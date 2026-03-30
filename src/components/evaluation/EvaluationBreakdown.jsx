import Card from '../ui/Card'
import CriteriaScore from './CriteriaScore'
import { CRITERIA_WEIGHTS, CRITERIA_LABELS, calculateWeightedScore } from '../../lib/utils'

export default function EvaluationBreakdown({ evaluations = [] }) {
  const evaluationMap = evaluations.reduce((acc, e) => {
    acc[e.criteria_key] = e
    return acc
  }, {})

  const scores = evaluations.reduce((acc, e) => {
    acc[e.criteria_key] = e.rating
    return acc
  }, {})
  const totalScore = calculateWeightedScore(scores)

  const getScoreColor = (s) => {
    if (s >= 75) return 'bg-rating-recommended'
    if (s >= 50) return 'bg-rating-caution'
    return 'bg-rating-not-recommended'
  }

  return (
    <Card>
      <div className="mb-6">
        <h3 className="font-display text-lg font-semibold text-mtm-navy mb-1">Evaluation Breakdown</h3>
        <p className="text-sm text-mtm-soft-blue">
          Detailed scoring across 9 criteria. Data Privacy and Security are weighted 2x.
        </p>
      </div>

      <div className="bg-mtm-surface rounded-mtm-md p-5 mb-6">
        <div className="flex items-center justify-between mb-3">
          <span className="font-medium text-mtm-navy text-sm">Overall Score</span>
          <span className="score-display text-2xl text-mtm-navy">
            {totalScore}<span className="text-mtm-border text-lg">/100</span>
          </span>
        </div>
        <div className="h-2.5 bg-mtm-border/30 rounded-full overflow-hidden">
          <div
            className={`h-full rounded-full transition-all duration-700 ${getScoreColor(totalScore)}`}
            style={{ width: `${totalScore}%` }}
          />
        </div>
      </div>

      <div>
        {Object.entries(CRITERIA_LABELS).map(([key, label]) => {
          const evaluation = evaluationMap[key]
          return (
            <CriteriaScore
              key={key}
              label={label}
              score={evaluation?.rating ?? 0}
              weight={CRITERIA_WEIGHTS[key]}
              notes={evaluation?.notes}
              evidenceUrls={evaluation?.evidence_urls}
            />
          )
        })}
      </div>

      {evaluations.length > 0 && evaluations[0]?.reviewed_at && (
        <p className="mt-5 text-xs text-mtm-soft-blue/50">
          Last evaluated: {new Date(evaluations[0].reviewed_at).toLocaleDateString()}
        </p>
      )}
    </Card>
  )
}
