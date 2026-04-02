import { useState, useEffect } from 'react'
import { useParams, Link } from 'react-router-dom'
import { ArrowLeft, ExternalLink, Loader2, Calendar, Building2, BookOpen, Download } from 'lucide-react'
import Button from '../components/ui/Button'
import Card from '../components/ui/Card'
import Badge from '../components/ui/Badge'
import RatingBadge from '../components/tools/RatingBadge'
import EvaluationBreakdown from '../components/evaluation/EvaluationBreakdown'
import ProxySignals from '../components/evaluation/ProxySignals'
import LawsuitSection from '../components/evaluation/LawsuitSection'
import { supabase } from '../lib/supabase'
import { formatDate, cn } from '../lib/utils'

export default function ToolPage() {
  const { id } = useParams()
  const [tool, setTool] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [selectedTierIndex, setSelectedTierIndex] = useState(0)
  const [imgError, setImgError] = useState(false)

  useEffect(() => {
    const ac = new AbortController()
    async function fetchTool() {
      if (!supabase) { setError('Database connection not configured.'); setLoading(false); return }
      try {
        setLoading(true)
        const { data: toolData, error: toolError } = await supabase
          .from('tools').select(`*, tiers:tool_tiers(*), proxy_signals(*), lawsuits:tool_lawsuits(*)`).eq('id', id).single().abortSignal(ac.signal)
        if (toolError) throw toolError
        if (toolData?.tiers) {
          const tierIds = toolData.tiers.map(t => t.id)
          const { data: evals, error: evalError } = await supabase
            .from('evaluations').select('*').in('tool_tier_id', tierIds).abortSignal(ac.signal)
          if (!evalError && evals) {
            setTool({ ...toolData, tiers: toolData.tiers.map(t => ({ ...t, evaluations: evals.filter(e => e.tool_tier_id === t.id) })) })
            return
          }
        }
        setTool(toolData)
      } catch (err) {
        if (err.name === 'AbortError') return
        setError('Failed to load tool details.')
      } finally { setLoading(false) }
    }
    fetchTool()
    return () => ac.abort()
  }, [id])

  if (loading) return <div className="container mx-auto px-4 py-16 flex items-center justify-center"><Loader2 className="w-7 h-7 animate-spin text-mtm-primary" /></div>

  if (error || !tool) {
    return (
      <div className="container mx-auto px-4 py-16">
        <Card className="text-center py-12">
          <p className="text-rating-not-recommended mb-4">{error || 'Tool not found'}</p>
          <Link to="/directory"><Button variant="outline"><ArrowLeft className="w-4 h-4" />Back to Directory</Button></Link>
        </Card>
      </div>
    )
  }

  const selectedTier = tool.tiers?.[selectedTierIndex]

  return (
    <div className="min-h-screen">
      <div className="bg-mtm-white border-b border-mtm-border/40">
        <div className="container mx-auto px-4 py-6">
          <Link to="/directory" className="inline-flex items-center text-sm text-mtm-soft-blue hover:text-mtm-primary mb-4 transition-colors">
            <ArrowLeft className="w-4 h-4 mr-1" />Back to Directory
          </Link>
          <div className="flex flex-col md:flex-row md:items-start gap-6">
            <div className="flex-shrink-0">
              {tool.logo_url && !imgError ? (
                <img src={tool.logo_url} alt={`${tool.name} logo`} className="w-16 h-16 rounded-mtm-lg object-contain bg-mtm-surface p-2 border border-mtm-border/30" onError={() => setImgError(true)} />
              ) : (
                <div className="w-16 h-16 rounded-mtm-lg bg-gradient-to-br from-mtm-primary/15 to-mtm-primary/5 flex items-center justify-center border border-mtm-primary/15">
                  <span className="text-mtm-primary font-display font-bold text-2xl">{tool.name?.charAt(0)}</span>
                </div>
              )}
            </div>
            <div className="flex-grow">
              <div className="flex flex-col md:flex-row md:items-center gap-3 mb-3">
                <h1 className="font-display text-3xl font-semibold text-mtm-navy">{tool.name}</h1>
                {selectedTier && <RatingBadge rating={selectedTier.overall_rating} />}
              </div>
              <div className="flex flex-wrap items-center gap-4 text-mtm-soft-blue text-sm mb-4">
                {tool.vendor && <span className="flex items-center gap-1.5"><Building2 className="w-4 h-4" />{tool.vendor}</span>}
                {selectedTier?.last_reviewed_at && <span className="flex items-center gap-1.5"><Calendar className="w-4 h-4" />Last reviewed {formatDate(selectedTier.last_reviewed_at)}</span>}
              </div>
              {tool.categories?.length > 0 && (
                <div className="flex flex-wrap gap-2">
                  {tool.categories.map(c => <Badge key={c}>{c}</Badge>)}
                </div>
              )}
            </div>
            <div className="flex flex-col sm:flex-row gap-2 flex-shrink-0">
              <Button variant="outline" onClick={() => window.print()} className="print:hidden"><Download className="w-4 h-4" />Export PDF</Button>
              {tool.website_url && (
                <a href={tool.website_url} target="_blank" rel="noopener noreferrer">
                  <Button variant="outline" className="w-full">Visit Website<ExternalLink className="w-4 h-4" /></Button>
                </a>
              )}
            </div>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        <div className="lg:flex lg:gap-8">
          <main className="flex-grow space-y-6">
            <Card>
              <h2 className="font-display text-lg font-semibold text-mtm-navy mb-3">About</h2>
              <p className="text-mtm-soft-blue leading-relaxed">{tool.description}</p>
            </Card>

            {tool.tiers?.length > 1 && (
              <div className="flex gap-2 overflow-x-auto pb-2">
                {tool.tiers.map((tier, i) => (
                  <button key={tier.id} onClick={() => setSelectedTierIndex(i)}
                    className={cn('px-4 py-2 rounded-mtm-md text-sm font-medium transition-all whitespace-nowrap border',
                      selectedTierIndex === i ? 'bg-mtm-navy text-white border-mtm-navy' : 'bg-mtm-white text-mtm-soft-blue border-mtm-border hover:border-mtm-navy/30'
                    )}>
                    {tier.tier_name}
                  </button>
                ))}
              </div>
            )}

            {selectedTier && <EvaluationBreakdown evaluations={selectedTier.evaluations || []} />}

            {selectedTier && (
              <Card>
                <h3 className="font-display text-lg font-semibold text-mtm-navy mb-4">{selectedTier.tier_name} Tier Details</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                  {[
                    { label: 'Data Training Policy', value: selectedTier.data_training_policy === 'no' ? 'Does not train on user data' : selectedTier.data_training_policy === 'opt-out' ? 'Opt-out available' : selectedTier.data_training_policy === 'yes' ? 'May train on user data' : 'Unclear' },
                    { label: 'Contract Required', value: selectedTier.requires_contract ? 'Yes' : 'No' },
                    { label: 'SOC 2 Certified', value: selectedTier.soc2_certified ? 'Yes' : 'No / Unknown' },
                    { label: 'FedRAMP Status', value: selectedTier.fedramp_status ? selectedTier.fedramp_status.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase()) : 'Not Applicable' },
                  ].map(item => (
                    <div key={item.label} className="p-3.5 bg-mtm-surface rounded-mtm-md border border-mtm-border/20">
                      <p className="text-xs text-mtm-soft-blue/60 mb-1">{item.label}</p>
                      <p className="font-medium text-mtm-navy text-sm">{item.value}</p>
                    </div>
                  ))}
                </div>
                {selectedTier.rating_notes && (
                  <div className="mt-4 p-4 bg-mtm-primary/5 rounded-mtm-md border border-mtm-primary/15">
                    <p className="text-xs text-mtm-soft-blue/60 mb-1">Reviewer Notes</p>
                    <p className="text-mtm-navy text-sm leading-relaxed">{selectedTier.rating_notes}</p>
                  </div>
                )}
              </Card>
            )}
          </main>

          <aside className="lg:w-80 flex-shrink-0 mt-8 lg:mt-0 space-y-6">
            <LawsuitSection lawsuits={tool.lawsuits || []} />
            <ProxySignals signals={tool.proxy_signals || []} />
            <Card>
              <div className="flex items-start gap-3">
                <div className="w-10 h-10 bg-mtm-primary/10 rounded-mtm-md flex items-center justify-center flex-shrink-0">
                  <BookOpen className="w-5 h-5 text-mtm-primary" />
                </div>
                <div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-1 text-sm">How We Score</h3>
                  <p className="text-sm text-mtm-soft-blue mb-3 leading-relaxed">
                    Tools are evaluated on 9 weighted criteria to produce a score out of 100. Data privacy and security carry 2x weight.
                  </p>
                  <Link to="/methodology" className="text-sm text-mtm-primary hover:text-mtm-navy font-medium transition-colors">
                    View full methodology &rarr;
                  </Link>
                </div>
              </div>
            </Card>
            <Card>
              <h3 className="font-display font-semibold text-mtm-navy mb-3 text-sm">Report an Issue</h3>
              <p className="text-sm text-mtm-soft-blue mb-4">Notice something incorrect or outdated?</p>
              <a href="mailto:info@mtm.now?subject=AI%20Safety%20Guide%20Feedback">
                <Button variant="outline" className="w-full">Contact Us</Button>
              </a>
            </Card>
          </aside>
        </div>
      </div>
    </div>
  )
}
