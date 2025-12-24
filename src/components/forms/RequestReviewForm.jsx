import { useState } from 'react'
import { Send, Loader2, CheckCircle } from 'lucide-react'
import Button from '../ui/Button'
import Input from '../ui/Input'
import Card from '../ui/Card'
import { supabase } from '../../lib/supabase'

export default function RequestReviewForm() {
  const [formData, setFormData] = useState({
    tool_name: '',
    tool_url: '',
    requester_email: '',
    requester_org: '',
    priority_reason: '',
  })
  const [status, setStatus] = useState('idle') // idle, submitting, success, error
  const [error, setError] = useState('')

  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData((prev) => ({ ...prev, [name]: value }))
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setStatus('submitting')
    setError('')

    try {
      const { error: submitError } = await supabase
        .from('review_requests')
        .insert([
          {
            tool_name: formData.tool_name,
            tool_url: formData.tool_url || null,
            requester_email: formData.requester_email,
            requester_org: formData.requester_org || null,
            priority_reason: formData.priority_reason || null,
            status: 'pending',
          },
        ])

      if (submitError) throw submitError

      setStatus('success')
      setFormData({
        tool_name: '',
        tool_url: '',
        requester_email: '',
        requester_org: '',
        priority_reason: '',
      })
    } catch (err) {
      console.error('Error submitting request:', err)
      setError('Failed to submit request. Please try again.')
      setStatus('error')
    }
  }

  if (status === 'success') {
    return (
      <Card className="text-center py-8">
        <CheckCircle className="w-16 h-16 text-rating-approved mx-auto mb-4" />
        <h3 className="text-xl font-semibold text-mtm-navy mb-2">Request Submitted!</h3>
        <p className="text-gray-600 mb-6">
          Thank you for your submission. We'll review your request and add the tool to our
          evaluation queue.
        </p>
        <Button onClick={() => setStatus('idle')}>Submit Another Request</Button>
      </Card>
    )
  }

  return (
    <Card>
      <form onSubmit={handleSubmit} className="space-y-6">
        <div>
          <h3 className="text-lg font-semibold text-mtm-navy mb-2">Request a Tool Review</h3>
          <p className="text-sm text-gray-600">
            Can't find the AI tool you're looking for? Submit a request and we'll add it to our
            evaluation queue.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <Input
            label="Tool Name"
            name="tool_name"
            value={formData.tool_name}
            onChange={handleChange}
            required
            placeholder="e.g., ChatGPT, Midjourney"
          />
          <Input
            label="Tool Website URL"
            name="tool_url"
            type="url"
            value={formData.tool_url}
            onChange={handleChange}
            placeholder="https://..."
          />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <Input
            label="Your Email"
            name="requester_email"
            type="email"
            value={formData.requester_email}
            onChange={handleChange}
            required
            placeholder="you@organization.org"
          />
          <Input
            label="Your Organization"
            name="requester_org"
            value={formData.requester_org}
            onChange={handleChange}
            placeholder="Optional"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Why is this tool a priority for your organization?
          </label>
          <textarea
            name="priority_reason"
            value={formData.priority_reason}
            onChange={handleChange}
            rows={3}
            className="block w-full px-3 py-2 border border-gray-300 rounded-mtm-md shadow-sm
                     placeholder:text-gray-400 focus:outline-none focus:ring-2
                     focus:ring-mtm-primary focus:border-transparent"
            placeholder="Help us prioritize by explaining your use case..."
          />
        </div>

        {error && (
          <p className="text-sm text-rating-not-recommended">{error}</p>
        )}

        <Button
          type="submit"
          disabled={status === 'submitting'}
          className="w-full md:w-auto"
        >
          {status === 'submitting' ? (
            <>
              <Loader2 className="w-4 h-4 mr-2 animate-spin" />
              Submitting...
            </>
          ) : (
            <>
              <Send className="w-4 h-4 mr-2" />
              Submit Request
            </>
          )}
        </Button>
      </form>
    </Card>
  )
}
