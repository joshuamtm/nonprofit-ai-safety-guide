import { useState, useRef, useEffect } from 'react'
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
  const [honeypot, setHoneypot] = useState('') // Spam prevention - bots fill this
  const [status, setStatus] = useState('idle') // idle, submitting, success, error
  const [error, setError] = useState('')
  const formLoadTime = useRef(Date.now())

  // Reset load time when form becomes idle again
  useEffect(() => {
    if (status === 'idle') {
      formLoadTime.current = Date.now()
    }
  }, [status])

  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData((prev) => ({ ...prev, [name]: value }))
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setStatus('submitting')
    setError('')

    // Spam prevention checks
    // 1. Honeypot field should be empty (bots fill hidden fields)
    if (honeypot) {
      // Silently reject - don't tell bots why
      setStatus('success')
      return
    }

    // 2. Form submitted too quickly (< 2 seconds) - likely a bot
    const timeSpent = Date.now() - formLoadTime.current
    if (timeSpent < 2000) {
      setStatus('success') // Silently reject
      return
    }

    // 3. Basic input validation
    if (formData.tool_name.length > 200 || formData.requester_email.length > 200) {
      setError('Input too long. Please shorten your submission.')
      setStatus('error')
      return
    }

    try {
      // Guard check for Supabase client
      if (!supabase) {
        throw new Error('Database connection not configured.')
      }

      const { error: submitError } = await supabase
        .from('review_requests')
        .insert([
          {
            tool_name: formData.tool_name.trim(),
            tool_url: formData.tool_url?.trim() || null,
            requester_email: formData.requester_email.trim().toLowerCase(),
            requester_org: formData.requester_org?.trim() || null,
            priority_reason: formData.priority_reason?.trim() || null,
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
        <CheckCircle className="w-16 h-16 text-rating-recommended mx-auto mb-4" />
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

        {/* Honeypot field - hidden from users, bots will fill it */}
        <div className="absolute -left-[9999px]" aria-hidden="true">
          <input
            type="text"
            name="website_url"
            value={honeypot}
            onChange={(e) => setHoneypot(e.target.value)}
            tabIndex={-1}
            autoComplete="off"
          />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <Input
            label="Tool Name"
            name="tool_name"
            value={formData.tool_name}
            onChange={handleChange}
            required
            maxLength={200}
            placeholder="e.g., ChatGPT, Claude"
          />
          <Input
            label="Tool Website URL"
            name="tool_url"
            type="url"
            value={formData.tool_url}
            onChange={handleChange}
            maxLength={500}
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
            maxLength={200}
            placeholder="you@organization.org"
          />
          <Input
            label="Your Organization"
            name="requester_org"
            value={formData.requester_org}
            onChange={handleChange}
            maxLength={200}
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
            maxLength={1000}
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
