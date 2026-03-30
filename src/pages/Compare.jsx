import { Link } from 'react-router-dom'
import { ArrowLeft, Check, X, Minus, ExternalLink } from 'lucide-react'
import { useCompare } from '../context/CompareContext'
import Card from '../components/ui/Card'
import Button from '../components/ui/Button'
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

const getRatingColor = (r) => r === 3 ? 'text-rating-recommended' : r === 2 ? 'text-mtm-primary' : r === 1 ? 'text-rating-caution' : 'text-rating-not-recommended'
const getRatingIcon = (r) => r === 3 ? <Check className="w-4 h-4" /> : r === 0 ? <X className="w-4 h-4" /> : <Minus className="w-4 h-4" />

export default function Compare() {
  const { compareList, clearCompare } = useCompare()

  if (compareList.length < 2) {
    return (
      <div className="min-h-screen">
        <div className="container mx-auto px-4 py-16">
          <Card className="text-center py-12 max-w-lg mx-auto">
            <h1 className="font-display text-2xl font-semibold text-mtm-navy mb-4">Compare Tools</h1>
            <p className="text-mtm-soft-blue mb-6">Select at least 2 tools from the directory to compare them side by side.</p>
            <Link to="/directory"><Button variant="outline">Browse Directory</Button></Link>
          </Card>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen pb-20">
      <div className="bg-mtm-white border-b border-mtm-border/40">
        <div className="container mx-auto px-4 py-8">
          <Link to="/directory" className="inline-flex items-center text-sm text-mtm-soft-blue hover:text-mtm-primary mb-4 transition-colors">
            <ArrowLeft className="w-4 h-4 mr-1" />Back to Directory
          </Link>
          <div className="flex items-center justify-between">
            <div>
              <h1 className="font-display text-3xl font-semibold text-mtm-navy mb-2">Compare Tools</h1>
              <p className="text-mtm-soft-blue">Side-by-side comparison of {compareList.length} tools</p>
            </div>
            <button onClick={clearCompare} className="text-sm text-mtm-soft-blue hover:text-mtm-navy transition-colors">Clear</button>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        <div className="grid gap-4 mb-6" style={{ gridTemplateColumns: `200px repeat(${compareList.length}, 1fr)` }}>
          <div />
          {compareList.map(tool => {
            const tier = tool.tiers?.[0]
            const score = tier?.evaluations ? calculateOverallScore(tier.evaluations) : null
            return (
              <Card key={tool.id} className="text-center">
                <div className="flex justify-center mb-3">
                  {tool.logo_url ? (
                    <img src={tool.logo_url} alt={`${tool.name} logo`} className="w-12 h-12 rounded-mtm-md object-contain bg-mtm-surface p-1" />
                  ) : (
                    <div className="w-12 h-12 rounded-mtm-md bg-mtm-primary/10 flex items-center justify-center">
                      <span className="text-mtm-primary font-display font-bold text-lg">{tool.name?.charAt(0)}</span>
                    </div>
                  )}
                </div>
                <h2 className="font-display font-semibold text-mtm-navy">{tool.name}</h2>
                <p className="text-sm text-mtm-soft-blue mb-2">{tool.vendor}</p>
                {tier && (
                  <div className="flex flex-col items-center gap-1.5">
                    <RatingBadge rating={tier.overall_rating} size="sm" />
                    {score !== null && <span className="score-display text-sm text-mtm-soft-blue">{score}/100</span>}
                  </div>
                )}
                <Link to={`/tool/${tool.id}`} className="mt-3 inline-flex items-center text-sm text-mtm-primary hover:underline">
                  View details <ExternalLink className="w-3 h-3 ml-1" />
                </Link>
              </Card>
            )
          })}
        </div>

        <Card>
          <h3 className="font-display font-semibold text-mtm-navy mb-4">Evaluation Criteria</h3>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-mtm-border/40">
                  <th className="text-left py-3 pr-4 font-medium text-mtm-soft-blue w-48 text-sm">Criterion</th>
                  {compareList.map(t => <th key={t.id} className="text-center py-3 px-4 font-medium text-mtm-navy text-sm">{t.name}</th>)}
                </tr>
              </thead>
              <tbody>
                {CRITERIA.map(c => (
                  <tr key={c.key} className="border-b border-mtm-border/20">
                    <td className="py-3 pr-4">
                      <div className="font-medium text-mtm-navy text-sm">{c.label}</div>
                      <div className="text-xs text-mtm-soft-blue/60">Weight: {c.weight}</div>
                    </td>
                    {compareList.map(tool => {
                      const r = tool.tiers?.[0]?.evaluations?.find(e => e.criteria_key === c.key)?.rating
                      return (
                        <td key={tool.id} className="text-center py-3 px-4">
                          <div className={`inline-flex items-center gap-1.5 ${getRatingColor(r)}`}>
                            {getRatingIcon(r)}
                            <span className="score-display text-sm">{r ?? '-'}/3</span>
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

        <Card className="mt-6">
          <h3 className="font-display font-semibold text-mtm-navy mb-4">Key Policies</h3>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-mtm-border/40">
                  <th className="text-left py-3 pr-4 font-medium text-mtm-soft-blue w-48 text-sm">Policy</th>
                  {compareList.map(t => <th key={t.id} className="text-center py-3 px-4 font-medium text-mtm-navy text-sm">{t.name}</th>)}
                </tr>
              </thead>
              <tbody>
                <tr className="border-b border-mtm-border/20">
                  <td className="py-3 pr-4 font-medium text-mtm-navy text-sm">Data Training</td>
                  {compareList.map(tool => {
                    const p = tool.tiers?.[0]?.data_training_policy
                    return (
                      <td key={tool.id} className="text-center py-3 px-4">
                        <span className={`inline-flex items-center gap-1.5 text-sm ${p === 'no' ? 'text-rating-recommended' : p === 'opt-out' ? 'text-rating-caution' : 'text-rating-not-recommended'}`}>
                          {p === 'no' ? <Check className="w-4 h-4" /> : p === 'opt-out' ? <Minus className="w-4 h-4" /> : <X className="w-4 h-4" />}
                          {p === 'no' ? 'No training' : p === 'opt-out' ? 'Opt-out' : p === 'yes' ? 'Trains on data' : '-'}
                        </span>
                      </td>
                    )
                  })}
                </tr>
                <tr className="border-b border-mtm-border/20">
                  <td className="py-3 pr-4 font-medium text-mtm-navy text-sm">SOC 2 Certified</td>
                  {compareList.map(tool => {
                    const c = tool.tiers?.[0]?.soc2_certified
                    return (
                      <td key={tool.id} className="text-center py-3 px-4">
                        <span className={`inline-flex items-center gap-1.5 text-sm ${c ? 'text-rating-recommended' : 'text-mtm-soft-blue/40'}`}>
                          {c ? <Check className="w-4 h-4" /> : <X className="w-4 h-4" />}
                          {c ? 'Yes' : 'No'}
                        </span>
                      </td>
                    )
                  })}
                </tr>
                <tr className="border-b border-mtm-border/20">
                  <td className="py-3 pr-4 font-medium text-mtm-navy text-sm">Contract Required</td>
                  {compareList.map(tool => (
                    <td key={tool.id} className="text-center py-3 px-4 text-sm text-mtm-soft-blue">
                      {tool.tiers?.[0]?.requires_contract ? 'Yes' : 'No'}
                    </td>
                  ))}
                </tr>
              </tbody>
            </table>
          </div>
        </Card>
      </div>
    </div>
  )
}
