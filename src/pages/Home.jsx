import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { ArrowRight, Shield, Search, FileText, CheckCircle2, AlertTriangle, XCircle } from 'lucide-react'
import Button from '../components/ui/Button'
import Card from '../components/ui/Card'
import { supabase } from '../lib/supabase'

const FEATURES = [
  {
    icon: Shield,
    title: 'Nonprofit-Focused Evaluations',
    description: 'Every tool evaluated against criteria that matter to nonprofits: data privacy, security, terms of service, and ethical considerations.',
  },
  {
    icon: Search,
    title: 'Clear, Actionable Ratings',
    description: 'Recommended, Caution, and Not Recommended ratings help you make quick decisions about which tools are safe to use.',
  },
  {
    icon: FileText,
    title: 'Policy Generator',
    description: 'Generate a customized AI usage policy for your organization based on your data types and risk tolerance.',
  },
  {
    icon: CheckCircle2,
    title: 'Continuously Updated',
    description: 'Tool policies change constantly. We monitor and update our evaluations so you always have current information.',
  },
]

export default function Home() {
  const [toolCount, setToolCount] = useState(null)

  useEffect(() => {
    async function fetchToolCount() {
      if (!supabase) return
      const { count } = await supabase.from('tools').select('*', { count: 'exact', head: true }).neq('status', 'deprecated')
      if (count !== null) setToolCount(count)
    }
    fetchToolCount()
  }, [])

  return (
    <div>
      {/* Hero */}
      <section className="relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-br from-mtm-navy via-mtm-navy to-[#0a3a5c]" />
        <div className="absolute inset-0 opacity-[0.04]" style={{
          backgroundImage: `radial-gradient(circle at 25% 25%, rgba(14,141,160,0.5) 0%, transparent 50%),
                           radial-gradient(circle at 75% 75%, rgba(217,122,30,0.3) 0%, transparent 50%)`
        }} />
        {/* Subtle grid pattern */}
        <div className="absolute inset-0 opacity-[0.03]" style={{
          backgroundImage: 'linear-gradient(rgba(255,255,255,0.1) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.1) 1px, transparent 1px)',
          backgroundSize: '60px 60px'
        }} />

        <div className="relative container mx-auto px-4 py-20 md:py-28">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-white/10 border border-white/10 text-white/70 text-xs font-medium mb-6 backdrop-blur-sm">
              <span className="w-1.5 h-1.5 rounded-full bg-rating-recommended animate-pulse" />
              {toolCount !== null ? `${toolCount} tools evaluated` : 'Independent evaluations'}
            </div>

            <h1 className="font-display text-4xl md:text-[3.5rem] font-semibold text-white leading-[1.1] mb-6 tracking-tight">
              AI Tools Safety Guide{' '}
              <span className="text-mtm-primary-light">for Nonprofits</span>
            </h1>

            <p className="text-lg md:text-xl text-white/70 mb-4 max-w-2xl leading-relaxed">
              A searchable directory of AI tools evaluated and rated for trust, safety, privacy,
              and responsibility. Make informed decisions about which tools are right for
              your organization.
            </p>
            <p className="text-sm text-white/40 mb-10 max-w-2xl">
              These ratings evaluate safety, privacy, ethics, and organizational risk &mdash; not features or capabilities.
              A lower score does not mean a tool is less useful, only that it requires more caution.
            </p>

            <div className="flex flex-wrap gap-4">
              <Link to="/directory">
                <Button size="lg" className="bg-white !text-mtm-navy hover:bg-mtm-cream shadow-lg">
                  Browse Tools
                  <ArrowRight className="w-5 h-5" />
                </Button>
              </Link>
              <Link to="/methodology">
                <Button size="lg" variant="ghost" className="text-white/80 hover:text-white hover:bg-white/10 border border-white/15">
                  Our Methodology
                </Button>
              </Link>
            </div>
          </div>
        </div>

        {/* Bottom fade */}
        <div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-mtm-cream to-transparent" />
      </section>

      {/* Stats */}
      <section className="py-4 -mt-8 relative z-10">
        <div className="container mx-auto px-4">
          <div className="bg-mtm-white rounded-mtm-xl border border-mtm-border/40 shadow-mtm-hover p-6 md:p-8">
            <div className="flex flex-wrap justify-center gap-10 md:gap-20">
              {[
                { value: toolCount !== null ? toolCount.toString() : '\u2014', label: 'Tools Evaluated' },
                { value: '9', label: 'Evaluation Criteria' },
                { value: '3', label: 'Tier Levels Rated' },
              ].map((stat, i) => (
                <div key={i} className="text-center">
                  <p className="score-display text-3xl md:text-4xl text-mtm-primary">{stat.value}</p>
                  <p className="text-mtm-soft-blue text-sm mt-1">{stat.label}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="py-20">
        <div className="container mx-auto px-4">
          <div className="text-center mb-14">
            <h2 className="font-display text-mtm-navy mb-4">Why Use This Guide?</h2>
            <p className="text-mtm-soft-blue max-w-2xl mx-auto leading-relaxed">
              We do the research so you don't have to. Our evaluations are specifically designed
              for nonprofit organizations with their unique data handling needs.
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5">
            {FEATURES.map((feature, i) => {
              const Icon = feature.icon
              return (
                <Card key={i} hover className="text-center">
                  <div className="w-12 h-12 bg-gradient-to-br from-mtm-primary/15 to-mtm-primary/5 rounded-mtm-lg flex items-center justify-center mx-auto mb-4">
                    <Icon className="w-5.5 h-5.5 text-mtm-primary" />
                  </div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-2 text-base">{feature.title}</h3>
                  <p className="text-sm text-mtm-soft-blue leading-relaxed">{feature.description}</p>
                </Card>
              )
            })}
          </div>
        </div>
      </section>

      {/* Rating Explanation */}
      <section className="py-20 bg-mtm-surface">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto">
            <h2 className="font-display text-mtm-navy mb-4 text-center">Understanding Our Ratings</h2>
            <p className="text-mtm-soft-blue text-center mb-10 max-w-xl mx-auto text-sm">
              Our ratings evaluate safety, privacy, ethics, and organizational risk. They do not assess features, capabilities, or usefulness of these platforms.
            </p>

            <div className="space-y-4">
              {[
                {
                  icon: CheckCircle2,
                  color: 'rating-recommended',
                  title: 'Recommended',
                  range: '75\u2013100',
                  description: 'Tools that meet reasonable standards for data privacy, security, and responsible AI practices. Safe for most nonprofit use cases.',
                },
                {
                  icon: AlertTriangle,
                  color: 'rating-caution',
                  title: 'Caution',
                  range: '50\u201374',
                  description: 'Tools that have some concerns but may be appropriate for certain use cases. Review the specific evaluation details before using.',
                },
                {
                  icon: XCircle,
                  color: 'rating-not-recommended',
                  title: 'Not Recommended',
                  range: '0\u201349',
                  description: 'Tools with significant concerns about data privacy, security, or terms of service. We recommend avoiding these for organizational use.',
                },
              ].map((rating) => {
                const Icon = rating.icon
                return (
                  <div key={rating.title} className={`flex items-start gap-4 p-5 bg-${rating.color}-light rounded-mtm-lg border border-${rating.color}/20`}>
                    <div className={`w-9 h-9 bg-${rating.color} rounded-full flex items-center justify-center flex-shrink-0`}>
                      <Icon className="w-5 h-5 text-white" />
                    </div>
                    <div>
                      <div className="flex items-center gap-3 mb-1">
                        <h3 className="font-display font-semibold text-mtm-navy">{rating.title}</h3>
                        <span className="score-display text-xs text-mtm-soft-blue">{rating.range}</span>
                      </div>
                      <p className="text-sm text-mtm-soft-blue leading-relaxed">{rating.description}</p>
                    </div>
                  </div>
                )
              })}
            </div>

            <div className="text-center mt-10">
              <Link to="/methodology">
                <Button variant="outline">
                  Learn About Our Methodology
                  <ArrowRight className="w-4 h-4" />
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
}
