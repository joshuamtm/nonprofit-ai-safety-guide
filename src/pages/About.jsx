import { Link } from 'react-router-dom'
import { ExternalLink, Users, Target, Shield, ArrowRight } from 'lucide-react'
import Card from '../components/ui/Card'
import Button from '../components/ui/Button'

export default function About() {
  return (
    <div className="min-h-screen">
      <div className="bg-mtm-navy text-white py-16 relative overflow-hidden">
        <div className="absolute inset-0 opacity-[0.03]" style={{
          backgroundImage: 'radial-gradient(circle at 30% 50%, rgba(14,141,160,0.5) 0%, transparent 50%)'
        }} />
        <div className="container mx-auto px-4 relative">
          <div className="max-w-3xl">
            <h1 className="font-display text-4xl font-semibold mb-4">About the Trusted AI Tools Directory</h1>
            <p className="text-xl text-white/70 leading-relaxed">
              Helping nonprofits make informed decisions about AI tools through independent,
              nonprofit-focused evaluations.
            </p>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        <div className="max-w-3xl mx-auto space-y-10">
          <Card>
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-mtm-primary/10 rounded-mtm-lg flex items-center justify-center flex-shrink-0">
                <Target className="w-6 h-6 text-mtm-primary" />
              </div>
              <div>
                <h2 className="font-display text-xl font-semibold text-mtm-navy mb-3">Our Mission</h2>
                <p className="text-mtm-soft-blue mb-4 leading-relaxed">
                  The Trusted AI Tools Directory exists to help nonprofit organizations navigate the rapidly evolving landscape of AI tools. We provide independent, thorough evaluations focused on the unique needs and concerns of the nonprofit sector.
                </p>
                <p className="text-mtm-soft-blue leading-relaxed">
                  Our goal is to empower nonprofits to embrace AI innovation while protecting the sensitive data entrusted to them by donors, clients, and communities.
                </p>
              </div>
            </div>
          </Card>

          <section>
            <h2 className="font-display text-2xl font-semibold text-mtm-navy mb-6">Why This Matters</h2>
            <div className="space-y-4">
              {[
                { title: 'Nonprofits Handle Sensitive Data', text: 'From donor financial information to client case records, nonprofits are trusted with highly sensitive data. AI tools that work fine for general consumers may pose unacceptable risks.' },
                { title: 'Terms of Service Matter', text: 'Many AI tools include terms that allow training on user data, claim rights over generated content, or include problematic liability clauses. We review these terms so you don\'t have to decode legal jargon.' },
                { title: 'Free Tiers Aren\'t Always Safe', text: 'The free version of a tool often has very different data handling practices than paid or enterprise versions. We evaluate each tier separately so you know exactly what you\'re getting.' },
              ].map(item => (
                <Card key={item.title}>
                  <h3 className="font-display font-semibold text-mtm-navy mb-2">{item.title}</h3>
                  <p className="text-mtm-soft-blue leading-relaxed">{item.text}</p>
                </Card>
              ))}
            </div>
          </section>

          <Card>
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-mtm-primary/10 rounded-mtm-lg flex items-center justify-center flex-shrink-0">
                <Users className="w-6 h-6 text-mtm-primary" />
              </div>
              <div>
                <h2 className="font-display text-xl font-semibold text-mtm-navy mb-3">Who We Are</h2>
                <p className="text-mtm-soft-blue mb-4 leading-relaxed">
                  The Trusted AI Tools Directory is a project of{' '}
                  <a href="https://mtm.now" target="_blank" rel="noopener noreferrer" className="text-mtm-primary hover:underline inline-flex items-center gap-1">
                    Meet the Moment (MTM)<ExternalLink className="w-3 h-3" />
                  </a>, a nonprofit technology advisory firm dedicated to helping mission-driven organizations thrive in the digital age.
                </p>
                <p className="text-mtm-soft-blue leading-relaxed">
                  Our evaluators combine expertise in nonprofit technology, data privacy, information security, and AI ethics to provide comprehensive, practical assessments.
                </p>
              </div>
            </div>
          </Card>

          <Card className="bg-mtm-surface border-mtm-border">
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-mtm-border/40 rounded-mtm-lg flex items-center justify-center flex-shrink-0">
                <Shield className="w-6 h-6 text-mtm-soft-blue" />
              </div>
              <div>
                <h2 className="font-display text-xl font-semibold text-mtm-navy mb-3">Important Disclaimers</h2>
                <ul className="space-y-3 text-mtm-soft-blue leading-relaxed">
                  <li><strong className="text-mtm-navy">Not Legal Advice:</strong> Our evaluations are for informational purposes only. Consult qualified professionals before making decisions based on our ratings.</li>
                  <li><strong className="text-mtm-navy">Point-in-Time Assessments:</strong> AI tool policies change frequently. Always verify critical information directly with vendors.</li>
                  <li><strong className="text-mtm-navy">No Vendor Relationships:</strong> We do not accept payment from vendors for evaluations. Our assessments are independent.</li>
                  <li><strong className="text-mtm-navy">Use At Your Own Risk:</strong> The decision to use any AI tool remains with your organization.</li>
                </ul>
              </div>
            </div>
          </Card>

          <section className="text-center">
            <h2 className="font-display text-2xl font-semibold text-mtm-navy mb-4">Get Involved</h2>
            <p className="text-mtm-soft-blue mb-6 max-w-xl mx-auto">
              Have questions, feedback, or want to contribute? We'd love to hear from you.
            </p>
            <a href="https://mtm.now" target="_blank" rel="noopener noreferrer">
              <Button>Contact MTM<ExternalLink className="w-4 h-4" /></Button>
            </a>
          </section>
        </div>
      </div>
    </div>
  )
}
