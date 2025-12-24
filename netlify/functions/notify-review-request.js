// Netlify Function: Receives Supabase webhook on new review_requests, sends email via Resend

export default async (request, context) => {
  // Only allow POST
  if (request.method !== 'POST') {
    return new Response('Method not allowed', { status: 405 })
  }

  // Verify webhook secret (optional but recommended)
  const webhookSecret = Netlify.env.get('SUPABASE_WEBHOOK_SECRET')
  const providedSecret = request.headers.get('x-webhook-secret')

  if (webhookSecret && providedSecret !== webhookSecret) {
    return new Response('Unauthorized', { status: 401 })
  }

  try {
    const payload = await request.json()

    // Supabase sends: { type: 'INSERT', table: 'review_requests', record: {...}, ... }
    const { type, record } = payload

    if (type !== 'INSERT' || !record) {
      return new Response('OK', { status: 200 })
    }

    const { tool_name, tool_url, requester_email, requester_org, priority_reason, created_at } = record

    // Send email via Resend
    const resendApiKey = Netlify.env.get('RESEND_API_KEY')

    if (!resendApiKey) {
      console.error('RESEND_API_KEY not configured')
      return new Response('Email service not configured', { status: 500 })
    }

    const emailHtml = `
      <h2>New Tool Review Request</h2>
      <p>Someone submitted a request to review an AI tool:</p>

      <table style="border-collapse: collapse; margin: 20px 0;">
        <tr>
          <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Tool Name</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${tool_name || 'Not provided'}</td>
        </tr>
        <tr>
          <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Tool URL</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${tool_url ? `<a href="${tool_url}">${tool_url}</a>` : 'Not provided'}</td>
        </tr>
        <tr>
          <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Requester Email</td>
          <td style="padding: 8px; border: 1px solid #ddd;"><a href="mailto:${requester_email}">${requester_email}</a></td>
        </tr>
        <tr>
          <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Organization</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${requester_org || 'Not provided'}</td>
        </tr>
        <tr>
          <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Priority Reason</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${priority_reason || 'Not provided'}</td>
        </tr>
        <tr>
          <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Submitted</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${new Date(created_at).toLocaleString()}</td>
        </tr>
      </table>

      <p style="margin-top: 20px; color: #666;">
        <a href="https://supabase.com/dashboard/project/evlzeqhybsihzsteoaye/editor/29270">View all requests in Supabase</a>
      </p>
    `

    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${resendApiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: 'AI Tools Directory <notifications@updates.mtm.now>',
        to: ['joshua@mtm.now'],
        subject: `New Review Request: ${tool_name}`,
        html: emailHtml,
      }),
    })

    if (!response.ok) {
      const errorData = await response.text()
      console.error('Resend error:', errorData)
      return new Response('Email send failed', { status: 500 })
    }

    return new Response('Notification sent', { status: 200 })

  } catch (error) {
    console.error('Webhook error:', error)
    return new Response('Internal error', { status: 500 })
  }
}

export const config = {
  path: '/api/notify-review-request'
}
