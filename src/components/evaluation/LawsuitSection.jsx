import { ExternalLink, Scale, ShieldCheck } from 'lucide-react'
import Card from '../ui/Card'

const STATUS_STYLES = {
  active: { label: 'Active', bg: 'bg-rating-not-recommended/10', text: 'text-rating-not-recommended', dot: 'bg-rating-not-recommended' },
  settled: { label: 'Settled', bg: 'bg-rating-caution/10', text: 'text-rating-caution', dot: 'bg-rating-caution' },
  dismissed: { label: 'Dismissed', bg: 'bg-mtm-soft-blue/10', text: 'text-mtm-soft-blue', dot: 'bg-mtm-soft-blue' },
  resolved: { label: 'Resolved', bg: 'bg-mtm-soft-blue/10', text: 'text-mtm-soft-blue', dot: 'bg-mtm-soft-blue' },
}

export default function LawsuitSection({ lawsuits = [] }) {
  if (lawsuits.length === 0) {
    return (
      <Card>
        <div className="flex items-start gap-3">
          <div className="w-10 h-10 bg-rating-recommended/10 rounded-mtm-md flex items-center justify-center flex-shrink-0">
            <ShieldCheck className="w-5 h-5 text-rating-recommended" />
          </div>
          <div>
            <h3 className="font-display font-semibold text-mtm-navy mb-1 text-sm">Legal Status</h3>
            <p className="text-sm text-mtm-soft-blue leading-relaxed">
              No known lawsuits or major regulatory actions related to data privacy, consent, or AI training practices.
            </p>
          </div>
        </div>
      </Card>
    )
  }

  const hasActive = lawsuits.some(l => l.status === 'active')

  return (
    <Card>
      <div className="mb-4">
        <div className="flex items-center gap-2 mb-1">
          <Scale className={`w-5 h-5 ${hasActive ? 'text-rating-not-recommended' : 'text-rating-caution'}`} />
          <h3 className="font-display text-lg font-semibold text-mtm-navy">Legal Status</h3>
        </div>
        <p className="text-sm text-mtm-soft-blue">
          Known lawsuits and regulatory actions.
        </p>
      </div>

      <div className="space-y-3">
        {lawsuits.map((lawsuit, i) => {
          const style = STATUS_STYLES[lawsuit.status] || STATUS_STYLES.active
          return (
            <div key={i} className="p-3 bg-mtm-surface rounded-mtm-md border border-mtm-border/20">
              <div className="flex items-start justify-between gap-2 mb-1.5">
                <span className="font-medium text-mtm-navy text-sm leading-snug">{lawsuit.case_name}</span>
                {lawsuit.source_url && (
                  <a href={lawsuit.source_url} target="_blank" rel="noopener noreferrer" className="flex-shrink-0 text-mtm-primary hover:text-mtm-navy transition-colors mt-0.5">
                    <ExternalLink className="w-3.5 h-3.5" />
                  </a>
                )}
              </div>
              <p className="text-xs text-mtm-soft-blue leading-relaxed mb-2">{lawsuit.description}</p>
              <div className="flex items-center gap-3">
                <span className={`inline-flex items-center gap-1.5 text-xs font-medium px-2 py-0.5 rounded-full ${style.bg} ${style.text}`}>
                  <span className={`w-1.5 h-1.5 rounded-full ${style.dot}`} />
                  {style.label}
                </span>
                {lawsuit.filed_date && (
                  <span className="text-xs text-mtm-soft-blue/60">Filed: {lawsuit.filed_date}</span>
                )}
              </div>
            </div>
          )
        })}
      </div>
    </Card>
  )
}
