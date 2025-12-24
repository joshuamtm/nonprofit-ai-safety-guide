import { Link } from 'react-router-dom'
import { ArrowRight, Shield, Search, FileText, CheckCircle } from 'lucide-react'
import Button from '../components/ui/Button'
import Card from '../components/ui/Card'
import NewsletterSignup from '../components/forms/NewsletterSignup'

const FEATURES = [
  {
    icon: Shield,
    title: 'Nonprofit-Focused Evaluations',
    description:
      'Every tool is evaluated against criteria that matter to nonprofits: data privacy, security, terms of service, and ethical considerations.',
  },
  {
    icon: Search,
    title: 'Easy-to-Understand Ratings',
    description:
      'Clear Recommended, Caution, and Not Recommended ratings help you make quick decisions about which tools are safe to use.',
  },
  {
    icon: FileText,
    title: 'Policy Generator',
    description:
      'Generate a customized AI usage policy for your organization based on your data types and risk tolerance.',
  },
  {
    icon: CheckCircle,
    title: 'Continuously Updated',
    description:
      'Tool policies and practices change. We continuously monitor and update our evaluations so you always have current information.',
  },
]

const STATS = [
  { value: '13', label: 'Tools Evaluated' },
  { value: '8', label: 'Evaluation Criteria' },
  { value: '3', label: 'Tier Levels' },
]

export default function Home() {
  return (
    <div>
      {/* Hero Section */}
      <section className="bg-gradient-to-br from-mtm-navy to-mtm-primary text-white py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl">
            <h1 className="text-4xl md:text-5xl font-bold mb-6">
              AI Tools You Can Trust for Your Nonprofit
            </h1>
            <p className="text-xl text-white/90 mb-8">
              A searchable directory of AI tools evaluated against a nonprofit-specific rubric for
              safety, privacy, and responsibility. Make informed decisions about which AI tools
              are right for your organization.
            </p>
            <Link to="/directory">
              <Button size="lg" variant="ghost" className="bg-white !text-mtm-navy hover:bg-gray-100">
                Browse Tools
                <ArrowRight className="w-5 h-5 ml-2" />
              </Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="bg-white py-8 border-b border-gray-100">
        <div className="container mx-auto px-4">
          <div className="flex flex-wrap justify-center gap-12 md:gap-24">
            {STATS.map((stat, index) => (
              <div key={index} className="text-center">
                <p className="text-3xl md:text-4xl font-bold text-mtm-primary">{stat.value}</p>
                <p className="text-gray-600">{stat.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-mtm-navy mb-4">
              Why Use the Trusted AI Tools Directory?
            </h2>
            <p className="text-gray-600 max-w-2xl mx-auto">
              We do the research so you don't have to. Our evaluations are specifically designed
              for nonprofit organizations with their unique data handling needs.
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {FEATURES.map((feature, index) => {
              const Icon = feature.icon
              return (
                <Card key={index} className="text-center">
                  <div className="w-12 h-12 bg-mtm-primary/10 rounded-full flex items-center justify-center mx-auto mb-4">
                    <Icon className="w-6 h-6 text-mtm-primary" />
                  </div>
                  <h3 className="font-semibold text-mtm-navy mb-2">{feature.title}</h3>
                  <p className="text-sm text-gray-600">{feature.description}</p>
                </Card>
              )
            })}
          </div>
        </div>
      </section>

      {/* Rating Explanation */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto">
            <h2 className="text-3xl font-bold text-mtm-navy mb-8 text-center">
              Understanding Our Ratings
            </h2>

            <div className="space-y-4">
              <div className="flex items-start gap-4 p-4 bg-rating-recommended/10 rounded-mtm-lg border border-rating-recommended/30">
                <div className="w-8 h-8 bg-rating-recommended rounded-full flex items-center justify-center flex-shrink-0">
                  <CheckCircle className="w-5 h-5 text-white" />
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">Recommended (24-30 points)</h3>
                  <p className="text-sm text-gray-600">
                    Tools that meet reasonable standards for data privacy, security, and responsible AI
                    practices. Safe for most nonprofit use cases.
                  </p>
                </div>
              </div>

              <div className="flex items-start gap-4 p-4 bg-rating-caution/10 rounded-mtm-lg border border-rating-caution/30">
                <div className="w-8 h-8 bg-rating-caution rounded-full flex items-center justify-center flex-shrink-0">
                  <span className="text-white font-bold">!</span>
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">Caution (16-23 points)</h3>
                  <p className="text-sm text-gray-600">
                    Tools that have some concerns but may be appropriate for certain use cases.
                    Review the specific evaluation details before using.
                  </p>
                </div>
              </div>

              <div className="flex items-start gap-4 p-4 bg-rating-not-recommended/10 rounded-mtm-lg border border-rating-not-recommended/30">
                <div className="w-8 h-8 bg-rating-not-recommended rounded-full flex items-center justify-center flex-shrink-0">
                  <span className="text-white font-bold">✕</span>
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">Not Recommended (0-15 points)</h3>
                  <p className="text-sm text-gray-600">
                    Tools with significant concerns about data privacy, security, or terms of
                    service. We recommend avoiding these tools for organizational use.
                  </p>
                </div>
              </div>
            </div>

            <div className="text-center mt-8">
              <Link to="/methodology">
                <Button variant="outline">
                  Learn About Our Methodology
                  <ArrowRight className="w-4 h-4 ml-2" />
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Newsletter Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="max-w-xl mx-auto">
            <NewsletterSignup />
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-mtm-navy text-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Can't Find a Tool?</h2>
          <p className="text-white/80 mb-8 max-w-xl mx-auto">
            If you're considering an AI tool that's not in our directory, request a review and
            we'll add it to our evaluation queue.
          </p>
          <Link to="/request-review">
            <Button size="lg" className="bg-mtm-accent hover:bg-mtm-accent/90">
              Request a Review
            </Button>
          </Link>
        </div>
      </section>
    </div>
  )
}
