import { cn } from '../../lib/utils'

const SCORE_LABELS = ['Poor', 'Fair', 'Good', 'Excellent']

export default function CriteriaScore({ label, score, maxScore = 3, notes, weight = 1 }) {
  const percentage = (score / maxScore) * 100

  const getScoreColor = (score) => {
    if (score === 0) return 'bg-rating-not-recommended'
    if (score === 1) return 'bg-rating-caution'
    if (score === 2) return 'bg-mtm-primary'
    return 'bg-rating-recommended'
  }

  return (
    <div className="py-3 border-b border-gray-100 last:border-0">
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
        </div>
      </div>

      {/* Progress bar */}
      <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
        <div
          className={cn('h-full rounded-full transition-all', getScoreColor(score))}
          style={{ width: `${percentage}%` }}
        />
      </div>

      {notes && (
        <p className="mt-2 text-sm text-gray-600">{notes}</p>
      )}
    </div>
  )
}
