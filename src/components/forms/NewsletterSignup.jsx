import { useState } from 'react'
import { Mail, Loader2, CheckCircle } from 'lucide-react'
import Button from '../ui/Button'
import { supabase } from '../../lib/supabase'

export default function NewsletterSignup({ variant = 'default' }) {
  const [email, setEmail] = useState('')
  const [status, setStatus] = useState('idle') // idle, submitting, success, error
  const [error, setError] = useState('')

  const handleSubmit = async (e) => {
    e.preventDefault()
    setStatus('submitting')
    setError('')

    if (!supabase) {
      setError('Unable to subscribe. Please try again later.')
      setStatus('error')
      return
    }

    try {
      const { error: insertError } = await supabase
        .from('newsletter_subscribers')
        .insert([{ email: email.toLowerCase().trim() }])

      if (insertError) {
        // Handle duplicate email
        if (insertError.code === '23505') {
          setStatus('success') // Already subscribed, show success anyway
        } else {
          throw insertError
        }
      } else {
        setStatus('success')
      }
      setEmail('')
    } catch (err) {
      console.error('Newsletter signup error:', err)
      setError('Failed to subscribe. Please try again.')
      setStatus('error')
    }
  }

  if (status === 'success') {
    return (
      <div className={`flex items-center gap-2 ${variant === 'compact' ? 'text-sm' : ''}`}>
        <CheckCircle className="w-5 h-5 text-rating-recommended" />
        <span className="text-gray-700">Thanks for subscribing!</span>
      </div>
    )
  }

  if (variant === 'compact') {
    return (
      <form onSubmit={handleSubmit} className="flex gap-2">
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
          placeholder="Enter your email"
          className="flex-1 px-3 py-2 text-sm border border-gray-300 rounded-mtm-md
                   focus:outline-none focus:ring-2 focus:ring-mtm-primary focus:border-transparent"
        />
        <Button type="submit" size="sm" disabled={status === 'submitting'}>
          {status === 'submitting' ? (
            <Loader2 className="w-4 h-4 animate-spin" />
          ) : (
            <Mail className="w-4 h-4" />
          )}
        </Button>
      </form>
    )
  }

  return (
    <div className="bg-mtm-primary/5 rounded-mtm-lg p-6">
      <div className="flex items-start gap-4">
        <div className="flex-shrink-0">
          <div className="w-12 h-12 bg-mtm-primary/10 rounded-full flex items-center justify-center">
            <Mail className="w-6 h-6 text-mtm-primary" />
          </div>
        </div>
        <div className="flex-grow">
          <h3 className="font-semibold text-mtm-navy mb-1">Stay Updated</h3>
          <p className="text-sm text-gray-600 mb-4">
            Get notified when we add new tool evaluations or when ratings change for tools you're
            tracking.
          </p>
          <form onSubmit={handleSubmit} className="flex flex-col sm:flex-row gap-2">
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              placeholder="you@organization.org"
              className="flex-1 px-4 py-2 border border-gray-300 rounded-mtm-md
                       focus:outline-none focus:ring-2 focus:ring-mtm-primary focus:border-transparent"
            />
            <Button type="submit" disabled={status === 'submitting'}>
              {status === 'submitting' ? (
                <>
                  <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                  Subscribing...
                </>
              ) : (
                'Subscribe'
              )}
            </Button>
          </form>
          {error && <p className="mt-2 text-sm text-rating-not-recommended">{error}</p>}
        </div>
      </div>
    </div>
  )
}
