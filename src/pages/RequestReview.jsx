import { Link } from 'react-router-dom'
import { ArrowLeft, Clock, CheckCircle, Search } from 'lucide-react'
import RequestReviewForm from '../components/forms/RequestReviewForm'
import Card from '../components/ui/Card'

const PROCESS_STEPS = [
  {
    icon: Search,
    title: 'Check the Directory',
    description: 'First, search our directory to see if the tool has already been evaluated.',
  },
  {
    icon: Clock,
    title: 'Submit Your Request',
    description: 'Fill out the form below with details about the tool you need evaluated.',
  },
  {
    icon: CheckCircle,
    title: 'We Evaluate',
    description: 'Our team reviews the tool against our 8-criteria rubric and publishes results.',
  },
]

export default function RequestReview() {
  return (
    <div className="bg-gray-50 min-h-screen">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="container mx-auto px-4 py-8">
          <Link
            to="/directory"
            className="inline-flex items-center text-sm text-gray-600 hover:text-mtm-primary mb-4"
          >
            <ArrowLeft className="w-4 h-4 mr-1" />
            Back to Directory
          </Link>
          <h1 className="text-3xl font-bold text-mtm-navy mb-2">Request a Tool Review</h1>
          <p className="text-gray-600 max-w-2xl">
            Can't find the AI tool you're looking for? Submit a request and we'll add it to our
            evaluation queue. We prioritize tools based on community demand and nonprofit relevance.
          </p>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        <div className="max-w-3xl mx-auto">
          {/* Process Overview */}
          <Card className="mb-8">
            <h2 className="text-lg font-semibold text-mtm-navy mb-6">How It Works</h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {PROCESS_STEPS.map((step, index) => {
                const Icon = step.icon
                return (
                  <div key={index} className="text-center">
                    <div className="w-12 h-12 bg-mtm-primary/10 rounded-full flex items-center justify-center mx-auto mb-3">
                      <Icon className="w-6 h-6 text-mtm-primary" />
                    </div>
                    <h3 className="font-medium text-gray-900 mb-1">{step.title}</h3>
                    <p className="text-sm text-gray-600">{step.description}</p>
                  </div>
                )
              })}
            </div>
          </Card>

          {/* Request Form */}
          <RequestReviewForm />

          {/* FAQ */}
          <Card className="mt-8">
            <h2 className="text-lg font-semibold text-mtm-navy mb-4">
              Frequently Asked Questions
            </h2>
            <div className="space-y-4">
              <div>
                <h3 className="font-medium text-gray-900 mb-1">
                  How long does an evaluation take?
                </h3>
                <p className="text-sm text-gray-600">
                  Typical evaluations take 1-2 weeks depending on the tool's complexity and our
                  current queue. High-priority requests from multiple organizations may be
                  expedited.
                </p>
              </div>
              <div>
                <h3 className="font-medium text-gray-900 mb-1">
                  What if a tool I need is rated "Not Recommended"?
                </h3>
                <p className="text-sm text-gray-600">
                  Our ratings are guidance, not mandates. If you need to use a tool rated "Not
                  Recommended," we suggest reviewing the specific concerns and implementing
                  appropriate safeguards. Consider using the tool only for non-sensitive data.
                </p>
              </div>
              <div>
                <h3 className="font-medium text-gray-900 mb-1">
                  How can I suggest a correction to an existing evaluation?
                </h3>
                <p className="text-sm text-gray-600">
                  If you believe an evaluation contains errors or is outdated, please use this
                  same form to report the issue. Include the tool name and specific concerns in
                  the priority reason field.
                </p>
              </div>
              <div>
                <h3 className="font-medium text-gray-900 mb-1">
                  Do you accept vendor submissions?
                </h3>
                <p className="text-sm text-gray-600">
                  Yes, vendors may request reviews of their tools. We conduct independent
                  evaluations regardless of who submits the request. Vendor-submitted tools are
                  held to the same standards as community-requested tools.
                </p>
              </div>
            </div>
          </Card>
        </div>
      </div>
    </div>
  )
}
