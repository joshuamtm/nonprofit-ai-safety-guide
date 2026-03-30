import { ExternalLink, Check, X, AlertCircle, Clock } from 'lucide-react'
import Card from '../ui/Card'

const SIGNAL_SOURCES = {
  fedramp: { name: 'FedRAMP', description: 'Federal Risk and Authorization Management Program' },
  common_sense: { name: 'Common Sense Media', description: 'Privacy evaluation for education tools' },
  mozilla: { name: 'Mozilla *Privacy Not Included', description: 'Consumer privacy review' },
  govai_coalition: { name: 'GovAI Coalition', description: 'Government AI readiness assessment' },
  soc2: { name: 'SOC 2 Type II', description: 'Service Organization Control certification' },
}

const getSignalIcon = (v) => {
  switch (v?.toLowerCase()) {
    case 'passed': case 'authorized': case 'certified': case 'yes':
      return <Check className="w-4.5 h-4.5 text-rating-recommended" />
    case 'failed': case 'not_authorized': case 'no':
      return <X className="w-4.5 h-4.5 text-rating-not-recommended" />
    case 'in_progress': case 'pending':
      return <Clock className="w-4.5 h-4.5 text-rating-caution" />
    default:
      return <AlertCircle className="w-4.5 h-4.5 text-mtm-soft-blue/40" />
  }
}

const formatSignalValue = (v) => {
  if (!v) return 'Unknown'
  return v.replace(/_/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase())
}

export default function ProxySignals({ signals = [] }) {
  if (signals.length === 0) {
    return (
      <Card>
        <h3 className="font-display text-lg font-semibold text-mtm-navy mb-2">External Verification</h3>
        <p className="text-sm text-mtm-soft-blue">
          No external verification signals available for this tool yet.
        </p>
      </Card>
    )
  }

  return (
    <Card>
      <div className="mb-4">
        <h3 className="font-display text-lg font-semibold text-mtm-navy mb-1">External Verification</h3>
        <p className="text-sm text-mtm-soft-blue">Third-party certifications and assessments.</p>
      </div>

      <div className="space-y-2.5">
        {signals.map((signal, i) => {
          const src = SIGNAL_SOURCES[signal.source] || { name: signal.source, description: '' }
          return (
            <div key={i} className="flex items-start gap-3 p-3 bg-mtm-surface rounded-mtm-md border border-mtm-border/20">
              <div className="flex-shrink-0 mt-0.5">{getSignalIcon(signal.signal_value)}</div>
              <div className="flex-grow min-w-0">
                <div className="flex items-center gap-2 flex-wrap">
                  <span className="font-medium text-mtm-navy text-sm">{src.name}</span>
                  <span className="text-sm text-mtm-soft-blue">&mdash; {formatSignalValue(signal.signal_value)}</span>
                </div>
                {src.description && (
                  <p className="text-xs text-mtm-soft-blue/60 mt-0.5">{src.description}</p>
                )}
              </div>
              {signal.source_url && (
                <a href={signal.source_url} target="_blank" rel="noopener noreferrer" className="flex-shrink-0 text-mtm-primary hover:text-mtm-navy transition-colors">
                  <ExternalLink className="w-3.5 h-3.5" />
                </a>
              )}
            </div>
          )
        })}
      </div>

      {signals.some((s) => s.last_checked_at) && (
        <p className="mt-4 text-xs text-mtm-soft-blue/50">
          Last verified: {new Date(Math.max(...signals.map((s) => new Date(s.last_checked_at || 0)))).toLocaleDateString()}
        </p>
      )}
    </Card>
  )
}
