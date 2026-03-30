import { Link } from 'react-router-dom'
import { ArrowLeft, Clock, CheckCircle, Search } from 'lucide-react'
import RequestReviewForm from '../components/forms/RequestReviewForm'
import Card from '../components/ui/Card'

const PROCESS_STEPS = [
  { icon: Search, title: 'Check the Directory', description: 'First, search our directory to see if the tool has already been evaluated.' },
  { icon: Clock, title: 'Submit Your Request', description: 'Fill out the form below with details about the tool you need evaluated.' },
  { icon: CheckCircle, title: 'We Evaluate', description: 'Our team reviews the tool against our 9-criteria rubric and publishes results.' },
]

export default function RequestReview() {
  return (
    <div className="min-h-screen">
      <div className="bg-mtm-white border-b border-mtm-border/40">
        <div className="container mx-auto px-4 py-8">
          <Link to="/directory" className="inline-flex items-center text-sm text-mtm-soft-blue hover:text-mtm-primary mb-4 transition-colors">
            <ArrowLeft className="w-4 h-4 mr-1" />Back to Directory
          </Link>
          <h1 className="font-display text-3xl font-semibold text-mtm-navy mb-2">Request a Tool Review</h1>
          <p className="text-mtm-soft-blue max-w-2xl leading-relaxed">
            Can't find the AI tool you're looking for? Submit a request and we'll add it to our evaluation queue.
          </p>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        <div className="max-w-3xl mx-auto">
          <Card className="mb-8">
            <h2 className="font-display text-lg font-semibold text-mtm-navy mb-6">How It Works</h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {PROCESS_STEPS.map((step, i) => {
                const Icon = step.icon
                return (
                  <div key={i} className="text-center">
                    <div className="w-12 h-12 bg-mtm-primary/10 rounded-full flex items-center justify-center mx-auto mb-3">
                      <Icon className="w-5 h-5 text-mtm-primary" />
                    </div>
                    <h3 className="font-display font-semibold text-mtm-navy mb-1 text-sm">{step.title}</h3>
                    <p className="text-sm text-mtm-soft-blue">{step.description}</p>
                  </div>
                )
              })}
            </div>
          </Card>

          <RequestReviewForm />

          <Card className="mt-8">
            <h2 className="font-display text-lg font-semibold text-mtm-navy mb-4">Frequently Asked Questions</h2>
            <div className="space-y-5">
              {[
                { q: 'How long does an evaluation take?', a: 'Typical evaluations take 1-2 weeks. High-priority requests from multiple organizations may be expedited.' },
                { q: 'What if a tool I need is rated "Not Recommended"?', a: 'Our ratings are guidance. Review the specific concerns and implement appropriate safeguards. Consider using only for non-sensitive data.' },
                { q: 'How can I suggest a correction?', a: 'Use this same form. Include the tool name and specific concerns in the priority reason field.' },
                { q: 'Do you accept vendor submissions?', a: 'Yes. We conduct independent evaluations regardless of who submits the request.' },
              ].map(item => (
                <div key={item.q}>
                  <h3 className="font-display font-semibold text-mtm-navy mb-1 text-sm">{item.q}</h3>
                  <p className="text-sm text-mtm-soft-blue leading-relaxed">{item.a}</p>
                </div>
              ))}
            </div>
          </Card>
        </div>
      </div>
    </div>
  )
}
