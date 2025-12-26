import { useState } from 'react'
import { ChevronDown, ChevronUp, ExternalLink } from 'lucide-react'
import { cn } from '../../lib/utils'

const SCORE_LABELS = ['Poor', 'Fair', 'Good', 'Excellent']

export default function CriteriaScore({ label, score, maxScore = 3, notes, evidenceUrls = [], weight = 1 }) {
  const [isExpanded, setIsExpanded] = useState(false)
  const percentage = (score / maxScore) * 100
  const hasDetails = notes || (evidenceUrls && evidenceUrls.length > 0)

  const getScoreColor = (score) => {
    if (score === 0) return 'bg-rating-not-recommended'
    if (score === 1) return 'bg-rating-caution'
    if (score === 2) return 'bg-mtm-primary'
    return 'bg-rating-recommended'
  }

  const formatUrl = (url) => {
    try {
      const urlObj = new URL(url)
      return urlObj.hostname.replace('www.', '')
    } catch {
      return url
    }
  }

  return (
    <div className="py-3 border-b border-gray-100 last:border-0">
      <button
        onClick={() => hasDetails && setIsExpanded(!isExpanded)}
        className={cn(
          'w-full text-left',
          hasDetails && 'cursor-pointer hover:bg-gray-50 -mx-2 px-2 py-1 rounded-lg transition-colors'
        )}
        disabled={!hasDetails}
        aria-expanded={isExpanded}
      >
        <div className="flex items-center justify-between mb-2">
          <div className="flex items-center gap-2">
            <span className="font-medium text-gray-900">{label}</span>
            {weight > 1 && (
              <span className="text-xs bg-mtm-navy/10 text-mtm-navy px-2 py-0.5 rounded-full">
                {weight}x weight
              </span>
            )}
          </div>
          <div className="flex items-center gap-2">
            <span className="text-sm font-semibold text-gray-700">
              {score}/{maxScore}
            </span>
            <span className="text-xs text-gray-500">
              ({SCORE_LABELS[score] || 'N/A'})
            </span>
            {hasDetails && (
              isExpanded ? (
                <ChevronUp className="w-4 h-4 text-gray-400" />
              ) : (
                <ChevronDown className="w-4 h-4 text-gray-400" />
              )
            )}
          </div>
        </div>

        {/* Progress bar */}
        <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
          <div
            className={cn('h-full rounded-full transition-all', getScoreColor(score))}
            style={{ width: `${percentage}%` }}
          />
        </div>
      </button>

      {/* Expandable details section */}
      {isExpanded && hasDetails && (
        <div className="mt-3 pl-2 border-l-2 border-gray-200 ml-1">
          {notes && (
            <p className="text-sm text-gray-600 mb-2">{notes}</p>
          )}
          {evidenceUrls && evidenceUrls.length > 0 && (
            <div className="flex flex-wrap gap-2 mt-2">
              <span className="text-xs text-gray-500">Sources:</span>
              {evidenceUrls.map((url, index) => (
                <a
                  key={index}
                  href={url}
                  target="_blank"
                  rel="noopener noreferrer"
                  onClick={(e) => e.stopPropagation()}
                  className="inline-flex items-center gap-1 text-xs text-mtm-primary hover:text-mtm-navy hover:underline"
                >
                  {formatUrl(url)}
                  <ExternalLink className="w-3 h-3" />
                </a>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
