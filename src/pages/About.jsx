import { Link } from 'react-router-dom'
import { ExternalLink, Users, Target, Shield, ArrowRight } from 'lucide-react'
import Card from '../components/ui/Card'
import Button from '../components/ui/Button'

export default function About() {
  return (
    <div className="bg-gray-50 min-h-screen">
      {/* Hero */}
      <div className="bg-mtm-navy text-white py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl">
            <h1 className="text-4xl font-bold mb-4">About the Trusted AI Tools Directory</h1>
            <p className="text-xl text-white/80">
              Helping nonprofits make informed decisions about AI tools through independent,
              nonprofit-focused evaluations.
            </p>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        <div className="max-w-3xl mx-auto space-y-12">
          {/* Mission */}
          <section>
            <Card>
              <div className="flex items-start gap-4">
                <div className="w-12 h-12 bg-mtm-primary/10 rounded-lg flex items-center justify-center flex-shrink-0">
                  <Target className="w-6 h-6 text-mtm-primary" />
                </div>
                <div>
                  <h2 className="text-xl font-bold text-mtm-navy mb-3">Our Mission</h2>
                  <p className="text-gray-600 mb-4">
                    The Trusted AI Tools Directory exists to help nonprofit organizations navigate
                    the rapidly evolving landscape of AI tools. We provide independent, thorough
                    evaluations focused on the unique needs and concerns of the nonprofit sector.
                  </p>
                  <p className="text-gray-600">
                    Our goal is to empower nonprofits to embrace AI innovation while protecting
                    the sensitive data entrusted to them by donors, clients, and communities.
                  </p>
                </div>
              </div>
            </Card>
          </section>

          {/* Why This Matters */}
          <section>
            <h2 className="text-2xl font-bold text-mtm-navy mb-6">Why This Matters</h2>
            <div className="space-y-4">
              <Card>
                <h3 className="font-semibold text-mtm-navy mb-2">
                  Nonprofits Handle Sensitive Data
                </h3>
                <p className="text-gray-600">
                  From donor financial information to client case records, nonprofits are trusted
                  with highly sensitive data. AI tools that work fine for general consumers may
                  pose unacceptable risks for organizations handling protected information.
                </p>
              </Card>

              <Card>
                <h3 className="font-semibold text-mtm-navy mb-2">
                  Terms of Service Matter
                </h3>
                <p className="text-gray-600">
                  Many AI tools include terms that allow training on user data, claim rights over
                  generated content, or include problematic liability clauses. We review these
                  terms so you don't have to decode legal jargon.
                </p>
              </Card>

              <Card>
                <h3 className="font-semibold text-mtm-navy mb-2">
                  Free Tiers Aren't Always Safe
                </h3>
                <p className="text-gray-600">
                  The free version of a tool often has very different data handling practices than
                  paid or enterprise versions. We evaluate each tier separately so you know exactly
                  what you're getting.
                </p>
              </Card>
            </div>
          </section>

          {/* Who We Are */}
          <section>
            <Card>
              <div className="flex items-start gap-4">
                <div className="w-12 h-12 bg-mtm-primary/10 rounded-lg flex items-center justify-center flex-shrink-0">
                  <Users className="w-6 h-6 text-mtm-primary" />
                </div>
                <div>
                  <h2 className="text-xl font-bold text-mtm-navy mb-3">Who We Are</h2>
                  <p className="text-gray-600 mb-4">
                    The Trusted AI Tools Directory is a project of{' '}
                    <a
                      href="https://mtm.now"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-mtm-primary hover:underline inline-flex items-center gap-1"
                    >
                      Meet the Moment (MTM)
                      <ExternalLink className="w-3 h-3" />
                    </a>
                    , a nonprofit technology advisory firm dedicated to helping mission-driven
                    organizations thrive in the digital age.
                  </p>
                  <p className="text-gray-600">
                    Our evaluators combine expertise in nonprofit technology, data privacy,
                    information security, and AI ethics to provide comprehensive, practical
                    assessments.
                  </p>
                </div>
              </div>
            </Card>
          </section>

          {/* Disclaimers */}
          <section>
            <Card className="bg-gray-100 border-gray-200">
              <div className="flex items-start gap-4">
                <div className="w-12 h-12 bg-gray-200 rounded-lg flex items-center justify-center flex-shrink-0">
                  <Shield className="w-6 h-6 text-gray-600" />
                </div>
                <div>
                  <h2 className="text-xl font-bold text-gray-900 mb-3">Important Disclaimers</h2>
                  <ul className="space-y-3 text-gray-600">
                    <li>
                      <strong>Not Legal Advice:</strong> Our evaluations are for informational
                      purposes only and do not constitute legal, regulatory, or professional
                      advice. Consult qualified professionals before making decisions based on
                      our ratings.
                    </li>
                    <li>
                      <strong>Point-in-Time Assessments:</strong> AI tool policies and practices
                      change frequently. While we strive to keep evaluations current, always
                      verify critical information directly with vendors.
                    </li>
                    <li>
                      <strong>No Vendor Relationships:</strong> We do not accept payment from
                      vendors for evaluations or ratings. Our assessments are independent and
                      based solely on publicly available information and our evaluation criteria.
                    </li>
                    <li>
                      <strong>Use At Your Own Risk:</strong> The decision to use any AI tool
                      remains with your organization. We provide guidance to inform your
                      decision-making, but cannot guarantee the safety or appropriateness of
                      any tool for your specific use case.
                    </li>
                  </ul>
                </div>
              </div>
            </Card>
          </section>

          {/* Contact / Get Involved */}
          <section className="text-center">
            <h2 className="text-2xl font-bold text-mtm-navy mb-4">Get Involved</h2>
            <p className="text-gray-600 mb-6 max-w-xl mx-auto">
              Have questions, feedback, or want to contribute to this project? We'd love to hear
              from you.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Link to="/request-review">
                <Button>
                  Request a Tool Review
                  <ArrowRight className="w-4 h-4 ml-2" />
                </Button>
              </Link>
              <a href="https://mtm.now" target="_blank" rel="noopener noreferrer">
                <Button variant="outline">
                  Contact MTM
                  <ExternalLink className="w-4 h-4 ml-2" />
                </Button>
              </a>
            </div>
          </section>
        </div>
      </div>
    </div>
  )
}
