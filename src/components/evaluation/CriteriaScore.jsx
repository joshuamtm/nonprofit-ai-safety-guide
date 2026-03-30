import { useState } from 'react'
import { ChevronDown, ChevronUp, ExternalLink } from 'lucide-react'
import { cn } from '../../lib/utils'

const SCORE_LABELS = ['Poor', 'Fair', 'Good', 'Excellent']

export default function CriteriaScore({ label, score, maxScore = 3, notes, evidenceUrls = [], weight = 1 }) {
  const [isExpanded, setIsExpanded] = useState(false)
  const percentage = (score / maxScore) * 100
  const hasDetails = notes || (evidenceUrls && evidenceUrls.length > 0)

  const getScoreColor = (s) => {
    if (s === 0) return 'bg-rating-not-recommended'
    if (s === 1) return 'bg-rating-caution'
    if (s === 2) return 'bg-mtm-primary'
    return 'bg-rating-recommended'
  }

  const formatUrl = (url) => {
    try { return new URL(url).hostname.replace('www.', '') }
    catch { return url }
  }

  return (
    <div className="py-3.5 border-b border-mtm-border/30 last:border-0">
      <button
        onClick={() => hasDetails && setIsExpanded(!isExpanded)}
        className={cn(
          'w-full text-left',
          hasDetails && 'cursor-pointer hover:bg-mtm-surface/50 -mx-2 px-2 py-1 rounded-mtm-md transition-colors'
        )}
        disabled={!hasDetails}
        aria-expanded={isExpanded}
      >
        <div className="flex items-center justify-between mb-2.5">
          <div className="flex items-center gap-2">
            <span className="font-medium text-mtm-navy text-sm">{label}</span>
            {weight > 1 && (
              <span className="text-[10px] bg-mtm-navy/8 text-mtm-navy px-2 py-0.5 rounded-full font-semibold tracking-wide">
                {weight}x
              </span>
            )}
          </div>
          <div className="flex items-center gap-2.5">
            <span className="score-display text-sm text-mtm-navy">
              {score}<span className="text-mtm-border">/{maxScore}</span>
            </span>
            <span className="text-xs text-mtm-soft-blue/70 w-16 text-right">
              {SCORE_LABELS[score] || 'N/A'}
            </span>
            {hasDetails && (
              isExpanded
                ? <ChevronUp className="w-3.5 h-3.5 text-mtm-soft-blue/50" />
                : <ChevronDown className="w-3.5 h-3.5 text-mtm-soft-blue/50" />
            )}
          </div>
        </div>

        <div className="h-1.5 bg-mtm-surface rounded-full overflow-hidden">
          <div
            className={cn('h-full rounded-full transition-all duration-500', getScoreColor(score))}
            style={{ width: `${percentage}%` }}
          />
        </div>
      </button>

      {isExpanded && hasDetails && (
        <div className="mt-3 pl-3 border-l-2 border-mtm-primary/20 ml-1 animate-fade-in">
          {notes && <p className="text-sm text-mtm-soft-blue leading-relaxed mb-2">{notes}</p>}
          {evidenceUrls && evidenceUrls.length > 0 && (
            <div className="flex flex-wrap gap-2 mt-2">
              <span className="text-xs text-mtm-soft-blue/60">Sources:</span>
              {evidenceUrls.map((url, i) => (
                <a
                  key={i}
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
