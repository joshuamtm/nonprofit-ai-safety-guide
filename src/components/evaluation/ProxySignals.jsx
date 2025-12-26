import { ExternalLink, Check, X, AlertCircle, Clock } from 'lucide-react'
import Card from '../ui/Card'

const SIGNAL_SOURCES = {
  fedramp: {
    name: 'FedRAMP',
    description: 'Federal Risk and Authorization Management Program',
  },
  common_sense: {
    name: 'Common Sense Media',
    description: 'Privacy evaluation for education tools',
  },
  mozilla: {
    name: 'Mozilla *Privacy Not Included',
    description: 'Consumer privacy review',
  },
  govai_coalition: {
    name: 'GovAI Coalition',
    description: 'Government AI readiness assessment',
  },
  soc2: {
    name: 'SOC 2 Type II',
    description: 'Service Organization Control certification',
  },
}

const getSignalIcon = (signalValue) => {
  switch (signalValue?.toLowerCase()) {
    case 'passed':
    case 'authorized':
    case 'certified':
    case 'yes':
      return <Check className="w-5 h-5 text-rating-recommended" />
    case 'failed':
    case 'not_authorized':
    case 'no':
      return <X className="w-5 h-5 text-rating-not-recommended" />
    case 'in_progress':
    case 'pending':
      return <Clock className="w-5 h-5 text-rating-caution" />
    default:
      return <AlertCircle className="w-5 h-5 text-gray-400" />
  }
}

const formatSignalValue = (signalValue) => {
  if (!signalValue) return 'Unknown'
  return signalValue
    .replace(/_/g, ' ')
    .replace(/\b\w/g, (l) => l.toUpperCase())
}

export default function ProxySignals({ signals = [] }) {
  if (signals.length === 0) {
    return (
      <Card>
        <h3 className="text-lg font-semibold text-mtm-navy mb-2">External Verification</h3>
        <p className="text-sm text-gray-500">
          No external verification signals available for this tool yet.
        </p>
      </Card>
    )
  }

  return (
    <Card>
      <div className="mb-4">
        <h3 className="text-lg font-semibold text-mtm-navy mb-2">External Verification</h3>
        <p className="text-sm text-gray-600">
          Third-party certifications and assessments from trusted sources.
        </p>
      </div>

      <div className="space-y-3">
        {signals.map((signal, index) => {
          const sourceInfo = SIGNAL_SOURCES[signal.source] || {
            name: signal.source,
            description: '',
          }

          return (
            <div
              key={index}
              className="flex items-start gap-3 p-3 bg-gray-50 rounded-lg"
            >
              <div className="flex-shrink-0 mt-0.5">
                {getSignalIcon(signal.signal_value)}
              </div>
              <div className="flex-grow">
                <div className="flex items-center gap-2">
                  <span className="font-medium text-gray-900">{sourceInfo.name}</span>
                  <span className="text-sm text-gray-600">
                    — {formatSignalValue(signal.signal_value)}
                  </span>
                </div>
                {sourceInfo.description && (
                  <p className="text-xs text-gray-500 mt-0.5">{sourceInfo.description}</p>
                )}
                {signal.signal_type && (
                  <p className="text-xs text-gray-500 mt-1">
                    Type: {signal.signal_type}
                  </p>
                )}
              </div>
              {signal.source_url && (
                <a
                  href={signal.source_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex-shrink-0 text-mtm-primary hover:text-mtm-navy"
                >
                  <ExternalLink className="w-4 h-4" />
                </a>
              )}
            </div>
          )
        })}
      </div>

      {signals.some((s) => s.last_checked_at) && (
        <p className="mt-4 text-xs text-gray-400">
          Last verified:{' '}
          {new Date(
            Math.max(...signals.map((s) => new Date(s.last_checked_at || 0)))
          ).toLocaleDateString()}
        </p>
      )}
    </Card>
  )
}
