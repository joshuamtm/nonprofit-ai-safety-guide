import Card from '../ui/Card'
import CriteriaScore from './CriteriaScore'
import { CRITERIA_WEIGHTS, CRITERIA_LABELS, calculateWeightedScore } from '../../lib/utils'

export default function EvaluationBreakdown({ evaluations = [] }) {
  // Group evaluations by criteria
  const evaluationMap = evaluations.reduce((acc, evaluation) => {
    acc[evaluation.criteria_key] = evaluation
    return acc
  }, {})

  // Calculate total weighted score (returns 0-100)
  const scores = evaluations.reduce((acc, e) => {
    acc[e.criteria_key] = e.rating
    return acc
  }, {})
  const totalScore = calculateWeightedScore(scores)

  return (
    <Card>
      <div className="mb-6">
        <h3 className="text-lg font-semibold text-mtm-navy mb-2">Evaluation Breakdown</h3>
        <p className="text-sm text-gray-600">
          Detailed scoring across 9 evaluation criteria. Data Privacy and Security are weighted 2x.
        </p>
      </div>

      {/* Total Score Summary */}
      <div className="bg-gray-50 rounded-lg p-4 mb-6">
        <div className="flex items-center justify-between">
          <span className="font-medium text-gray-700">Overall Score</span>
          <span className="text-2xl font-bold text-mtm-navy">
            {totalScore}/100
          </span>
        </div>
        <div className="mt-2 h-3 bg-gray-200 rounded-full overflow-hidden">
          <div
            className={`h-full rounded-full ${
              totalScore >= 75
                ? 'bg-rating-recommended'
                : totalScore >= 50
                ? 'bg-rating-caution'
                : 'bg-rating-not-recommended'
            }`}
            style={{ width: `${totalScore}%` }}
          />
        </div>
      </div>

      {/* Individual Criteria */}
      <div className="divide-y divide-gray-100">
        {Object.entries(CRITERIA_LABELS).map(([key, label]) => {
          const evaluation = evaluationMap[key]
          return (
            <CriteriaScore
              key={key}
              label={label}
              score={evaluation?.rating ?? 0}
              weight={CRITERIA_WEIGHTS[key]}
              notes={evaluation?.notes}
            />
          )
        })}
      </div>

      {/* Last reviewed timestamp */}
      {evaluations.length > 0 && evaluations[0]?.reviewed_at && (
        <p className="mt-4 text-xs text-gray-400">
          Last evaluated: {new Date(evaluations[0].reviewed_at).toLocaleDateString()}
        </p>
      )}
    </Card>
  )
}
