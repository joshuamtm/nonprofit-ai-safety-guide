import { Link } from 'react-router-dom'
import { ArrowLeft, Check, X, Minus, ExternalLink } from 'lucide-react'
import { useCompare } from '../context/CompareContext'
import Card from '../components/ui/Card'
import RatingBadge from '../components/tools/RatingBadge'
import { calculateOverallScore } from '../lib/utils'

const CRITERIA = [
  { key: 'data_privacy', label: 'Data Privacy', weight: '2x' },
  { key: 'security', label: 'Security', weight: '2x' },
  { key: 'tos', label: 'Terms of Service', weight: '1x' },
  { key: 'accessibility', label: 'Accessibility', weight: '1x' },
  { key: 'pricing', label: 'Nonprofit Pricing', weight: '1x' },
  { key: 'environmental', label: 'Environmental', weight: '1x' },
  { key: 'ethical_training', label: 'Ethical Training', weight: '1x' },
  { key: 'enterprise_controls', label: 'Enterprise Controls', weight: '1x' },
  { key: 'sector_commitment', label: 'Sector Commitment', weight: '1x' },
]

const getRatingColor = (rating) => {
  if (rating === 3) return 'text-rating-recommended'
  if (rating === 2) return 'text-rating-caution'
  if (rating === 1) return 'text-rating-caution'
  return 'text-rating-not-recommended'
}

const getRatingIcon = (rating) => {
  if (rating === 3) return <Check className="w-4 h-4" />
  if (rating === 2) return <Minus className="w-4 h-4" />
  if (rating === 1) return <Minus className="w-4 h-4" />
  if (rating === 0) return <X className="w-4 h-4" />
  return <Minus className="w-4 h-4 text-gray-400" />
}

export default function Compare() {
  const { compareList, clearCompare } = useCompare()

  if (compareList.length < 2) {
    return (
      <div className="bg-gray-50 min-h-screen">
        <div className="container mx-auto px-4 py-16">
          <Card className="text-center py-12 max-w-lg mx-auto">
            <h1 className="text-2xl font-bold text-mtm-navy mb-4">Compare Tools</h1>
            <p className="text-gray-600 mb-6">
              Select at least 2 tools from the directory to compare them side by side.
            </p>
            <Link to="/directory">
              <button className="text-mtm-primary hover:underline">
                Browse Directory
              </button>
            </Link>
          </Card>
        </div>
      </div>
    )
  }

  return (
    <div className="bg-gray-50 min-h-screen pb-20">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="container mx-auto px-4 py-8">
          <Link
            to="/directory"
            className="inline-flex items-center text-sm text-gray-600 hover:text-mtm-primary mb-4"
          >
            <ArrowLeft className="w-4 h-4 mr-1" />
            Back to Directory
          </Link>
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-mtm-navy mb-2">Compare Tools</h1>
              <p className="text-gray-600">
                Side-by-side comparison of {compareList.length} tools
              </p>
            </div>
            <button
              onClick={clearCompare}
              className="text-sm text-gray-500 hover:text-gray-700"
            >
              Clear comparison
            </button>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        {/* Tool Headers */}
        <div className="grid gap-4 mb-6" style={{ gridTemplateColumns: `200px repeat(${compareList.length}, 1fr)` }}>
          <div></div>
          {compareList.map((tool) => {
            const tier = tool.tiers?.[0]
            const score = tier?.evaluations ? calculateOverallScore(tier.evaluations) : null
            return (
              <Card key={tool.id} className="text-center">
                <div className="flex justify-center mb-3">
                  {tool.logo_url ? (
                    <img
                      src={tool.logo_url}
                      alt={`${tool.name} logo`}
                      className="w-12 h-12 rounded-lg object-contain bg-gray-50 p-1"
                    />
                  ) : (
                    <div className="w-12 h-12 rounded-lg bg-mtm-primary/10 flex items-center justify-center">
                      <span className="text-mtm-primary font-bold text-lg">
                        {tool.name?.charAt(0)}
                      </span>
                    </div>
                  )}
                </div>
                <h2 className="font-semibold text-mtm-navy">{tool.name}</h2>
                <p className="text-sm text-gray-500 mb-2">{tool.vendor}</p>
                {tier && (
                  <div className="flex flex-col items-center gap-1">
                    <RatingBadge rating={tier.overall_rating} size="sm" />
                    {score !== null && (
                      <span className="text-sm font-medium text-gray-600">{score}/100</span>
                    )}
                  </div>
                )}
                <Link
                  to={`/tool/${tool.id}`}
                  className="mt-3 inline-flex items-center text-sm text-mtm-primary hover:underline"
                >
                  View details <ExternalLink className="w-3 h-3 ml-1" />
                </Link>
              </Card>
            )
          })}
        </div>

        {/* Comparison Table */}
        <Card>
          <h3 className="font-semibold text-mtm-navy mb-4">Evaluation Criteria</h3>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 pr-4 font-medium text-gray-700 w-48">Criterion</th>
                  {compareList.map((tool) => (
                    <th key={tool.id} className="text-center py-3 px-4 font-medium text-gray-700">
                      {tool.name}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {CRITERIA.map((criterion) => (
                  <tr key={criterion.key} className="border-b border-gray-100">
                    <td className="py-3 pr-4">
                      <div className="font-medium text-gray-900">{criterion.label}</div>
                      <div className="text-xs text-gray-500">Weight: {criterion.weight}</div>
                    </td>
                    {compareList.map((tool) => {
                      const tier = tool.tiers?.[0]
                      const evaluation = tier?.evaluations?.find(e => e.criteria_key === criterion.key)
                      const rating = evaluation?.rating
                      return (
                        <td key={tool.id} className="text-center py-3 px-4">
                          <div className={`inline-flex items-center gap-1 ${getRatingColor(rating)}`}>
                            {getRatingIcon(rating)}
                            <span className="font-medium">{rating ?? '-'}/3</span>
                          </div>
                        </td>
                      )
                    })}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </Card>

        {/* Key Policies */}
        <Card className="mt-6">
          <h3 className="font-semibold text-mtm-navy mb-4">Key Policies</h3>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 pr-4 font-medium text-gray-700 w-48">Policy</th>
                  {compareList.map((tool) => (
                    <th key={tool.id} className="text-center py-3 px-4 font-medium text-gray-700">
                      {tool.name}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                <tr className="border-b border-gray-100">
                  <td className="py-3 pr-4 font-medium text-gray-900">Data Training</td>
                  {compareList.map((tool) => {
                    const tier = tool.tiers?.[0]
                    const policy = tier?.data_training_policy
                    return (
                      <td key={tool.id} className="text-center py-3 px-4">
                        <span className={`inline-flex items-center gap-1 ${
                          policy === 'no' ? 'text-rating-recommended' :
                          policy === 'opt-out' ? 'text-rating-caution' :
                          'text-rating-not-recommended'
                        }`}>
                          {policy === 'no' ? <Check className="w-4 h-4" /> :
                           policy === 'opt-out' ? <Minus className="w-4 h-4" /> :
                           <X className="w-4 h-4" />}
                          {policy === 'no' ? 'No training' :
                           policy === 'opt-out' ? 'Opt-out available' :
                           policy === 'yes' ? 'Trains on data' : '-'}
                        </span>
                      </td>
                    )
                  })}
                </tr>
                <tr className="border-b border-gray-100">
                  <td className="py-3 pr-4 font-medium text-gray-900">SOC 2 Certified</td>
                  {compareList.map((tool) => {
                    const tier = tool.tiers?.[0]
                    const certified = tier?.soc2_certified
                    return (
                      <td key={tool.id} className="text-center py-3 px-4">
                        <span className={`inline-flex items-center gap-1 ${
                          certified ? 'text-rating-recommended' : 'text-gray-400'
                        }`}>
                          {certified ? <Check className="w-4 h-4" /> : <X className="w-4 h-4" />}
                          {certified ? 'Yes' : 'No'}
                        </span>
                      </td>
                    )
                  })}
                </tr>
                <tr className="border-b border-gray-100">
                  <td className="py-3 pr-4 font-medium text-gray-900">Contract Required</td>
                  {compareList.map((tool) => {
                    const tier = tool.tiers?.[0]
                    const required = tier?.requires_contract
                    return (
                      <td key={tool.id} className="text-center py-3 px-4">
                        <span className="text-gray-600">
                          {required ? 'Yes' : 'No'}
                        </span>
                      </td>
                    )
                  })}
                </tr>
              </tbody>
            </table>
          </div>
        </Card>
      </div>
    </div>
  )
}
