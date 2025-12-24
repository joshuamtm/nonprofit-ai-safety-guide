import { useState, useEffect } from 'react'
import { useParams, Link } from 'react-router-dom'
import { ArrowLeft, ExternalLink, Loader2, Calendar, Building2, BookOpen } from 'lucide-react'
import Button from '../components/ui/Button'
import Card from '../components/ui/Card'
import Badge from '../components/ui/Badge'
import RatingBadge from '../components/tools/RatingBadge'
import EvaluationBreakdown from '../components/evaluation/EvaluationBreakdown'
import ProxySignals from '../components/evaluation/ProxySignals'
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
    const abortController = new AbortController()

    async function fetchTool() {
      // Guard check for Supabase client
      if (!supabase) {
        setError('Database connection not configured.')
        setLoading(false)
        return
      }

      try {
        setLoading(true)

        // Fetch tool with tiers
        const { data: toolData, error: toolError } = await supabase
          .from('tools')
          .select(`
            *,
            tiers:tool_tiers(*),
            proxy_signals(*)
          `)
          .eq('id', id)
          .single()
          .abortSignal(abortController.signal)

        if (toolError) throw toolError

        // Fetch evaluations for each tier
        if (toolData?.tiers) {
          const tierIds = toolData.tiers.map((t) => t.id)
          const { data: evaluations, error: evalError } = await supabase
            .from('evaluations')
            .select('*')
            .in('tool_tier_id', tierIds)
            .abortSignal(abortController.signal)

          if (!evalError && evaluations) {
            // Attach evaluations to their respective tiers (immutable)
            const tiersWithEvaluations = toolData.tiers.map((tier) => ({
              ...tier,
              evaluations: evaluations.filter((e) => e.tool_tier_id === tier.id),
            }))
            setTool({ ...toolData, tiers: tiersWithEvaluations })
            return
          }
        }

        setTool(toolData)
      } catch (err) {
        if (err.name === 'AbortError') return
        console.error('Error fetching tool:', err)
        setError('Failed to load tool details.')
      } finally {
        setLoading(false)
      }
    }

    fetchTool()

    return () => abortController.abort()
  }, [id])

  if (loading) {
    return (
      <div className="container mx-auto px-4 py-16 flex items-center justify-center">
        <Loader2 className="w-8 h-8 animate-spin text-mtm-primary" />
      </div>
    )
  }

  if (error || !tool) {
    return (
      <div className="container mx-auto px-4 py-16">
        <Card className="text-center py-12">
          <p className="text-rating-not-recommended mb-4">{error || 'Tool not found'}</p>
          <Link to="/directory">
            <Button variant="outline">
              <ArrowLeft className="w-4 h-4 mr-2" />
              Back to Directory
            </Button>
          </Link>
        </Card>
      </div>
    )
  }

  const selectedTier = tool.tiers?.[selectedTierIndex]

  return (
    <div className="bg-gray-50 min-h-screen">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="container mx-auto px-4 py-6">
          <Link
            to="/directory"
            className="inline-flex items-center text-sm text-gray-600 hover:text-mtm-primary mb-4"
          >
            <ArrowLeft className="w-4 h-4 mr-1" />
            Back to Directory
          </Link>

          <div className="flex flex-col md:flex-row md:items-start gap-6">
            {/* Logo */}
            <div className="flex-shrink-0">
              {tool.logo_url && !imgError ? (
                <img
                  src={tool.logo_url}
                  alt={`${tool.name} logo`}
                  className="w-20 h-20 rounded-lg object-contain bg-gray-50 p-2 border border-gray-200"
                  onError={() => setImgError(true)}
                />
              ) : (
                <div className="w-20 h-20 rounded-lg bg-mtm-primary/10 flex items-center justify-center border border-mtm-primary/20">
                  <span className="text-mtm-primary font-bold text-3xl">
                    {tool.name?.charAt(0)}
                  </span>
                </div>
              )}
            </div>

            {/* Title and metadata */}
            <div className="flex-grow">
              <div className="flex flex-col md:flex-row md:items-center gap-4 mb-3">
                <h1 className="text-3xl font-bold text-mtm-navy">{tool.name}</h1>
                {selectedTier && <RatingBadge rating={selectedTier.overall_rating} />}
              </div>

              <div className="flex flex-wrap items-center gap-4 text-gray-600 text-sm mb-4">
                {tool.vendor && (
                  <span className="flex items-center gap-1">
                    <Building2 className="w-4 h-4" />
                    {tool.vendor}
                  </span>
                )}
                {selectedTier?.last_reviewed_at && (
                  <span className="flex items-center gap-1">
                    <Calendar className="w-4 h-4" />
                    Last reviewed {formatDate(selectedTier.last_reviewed_at)}
                  </span>
                )}
              </div>

              {tool.categories && tool.categories.length > 0 && (
                <div className="flex flex-wrap gap-2">
                  {tool.categories.map((category) => (
                    <Badge key={category} variant="default">
                      {category}
                    </Badge>
                  ))}
                </div>
              )}
            </div>

            {/* External link */}
            {tool.website_url && (
              <a
                href={tool.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="flex-shrink-0"
              >
                <Button variant="outline">
                  Visit Website
                  <ExternalLink className="w-4 h-4 ml-2" />
                </Button>
              </a>
            )}
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        <div className="lg:flex lg:gap-8">
          {/* Main content */}
          <main className="flex-grow space-y-8">
            {/* Description */}
            <Card>
              <h2 className="text-lg font-semibold text-mtm-navy mb-3">About</h2>
              <p className="text-gray-600">{tool.description}</p>
            </Card>

            {/* Tier tabs */}
            {tool.tiers && tool.tiers.length > 1 && (
              <div className="flex gap-2 overflow-x-auto pb-2">
                {tool.tiers.map((tier, index) => (
                  <button
                    key={tier.id}
                    onClick={() => setSelectedTierIndex(index)}
                    className={cn(
                      'px-4 py-2 rounded-mtm-md text-sm font-medium transition-colors whitespace-nowrap',
                      selectedTierIndex === index
                        ? 'bg-mtm-navy text-white'
                        : 'bg-white text-gray-700 border border-gray-300 hover:border-mtm-navy'
                    )}
                  >
                    {tier.tier_name}
                  </button>
                ))}
              </div>
            )}

            {/* Evaluation breakdown */}
            {selectedTier && (
              <EvaluationBreakdown evaluations={selectedTier.evaluations || []} />
            )}

            {/* Tier-specific info */}
            {selectedTier && (
              <Card>
                <h3 className="text-lg font-semibold text-mtm-navy mb-4">
                  {selectedTier.tier_name} Tier Details
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="p-3 bg-gray-50 rounded-mtm-md">
                    <p className="text-sm text-gray-500 mb-1">Data Training Policy</p>
                    <p className="font-medium text-gray-900">
                      {selectedTier.data_training_policy === 'no'
                        ? 'Does not train on user data'
                        : selectedTier.data_training_policy === 'opt-out'
                        ? 'Opt-out available'
                        : selectedTier.data_training_policy === 'yes'
                        ? 'May train on user data'
                        : 'Unclear'}
                    </p>
                  </div>

                  <div className="p-3 bg-gray-50 rounded-mtm-md">
                    <p className="text-sm text-gray-500 mb-1">Contract Required</p>
                    <p className="font-medium text-gray-900">
                      {selectedTier.requires_contract ? 'Yes' : 'No'}
                    </p>
                  </div>

                  <div className="p-3 bg-gray-50 rounded-mtm-md">
                    <p className="text-sm text-gray-500 mb-1">SOC 2 Certified</p>
                    <p className="font-medium text-gray-900">
                      {selectedTier.soc2_certified ? 'Yes' : 'No / Unknown'}
                    </p>
                  </div>

                  <div className="p-3 bg-gray-50 rounded-mtm-md">
                    <p className="text-sm text-gray-500 mb-1">FedRAMP Status</p>
                    <p className="font-medium text-gray-900">
                      {selectedTier.fedramp_status
                        ? selectedTier.fedramp_status.replace(/_/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase())
                        : 'Not Applicable'}
                    </p>
                  </div>
                </div>

                {selectedTier.rating_notes && (
                  <div className="mt-4 p-3 bg-mtm-primary/5 rounded-mtm-md border border-mtm-primary/20">
                    <p className="text-sm text-gray-500 mb-1">Reviewer Notes</p>
                    <p className="text-gray-700">{selectedTier.rating_notes}</p>
                  </div>
                )}
              </Card>
            )}
          </main>

          {/* Sidebar */}
          <aside className="lg:w-80 flex-shrink-0 mt-8 lg:mt-0 space-y-6">
            <ProxySignals signals={tool.proxy_signals || []} />

            {/* How We Score */}
            <Card>
              <div className="flex items-start gap-3">
                <div className="w-10 h-10 bg-mtm-primary/10 rounded-lg flex items-center justify-center flex-shrink-0">
                  <BookOpen className="w-5 h-5 text-mtm-primary" />
                </div>
                <div>
                  <h3 className="font-semibold text-mtm-navy mb-1">How We Score</h3>
                  <p className="text-sm text-gray-600 mb-3">
                    Tools are evaluated on 9 weighted criteria to produce a score out of 100. Data privacy and security carry 2x weight.
                  </p>
                  <Link
                    to="/methodology"
                    className="text-sm text-mtm-primary hover:text-mtm-navy font-medium"
                  >
                    View full methodology →
                  </Link>
                </div>
              </div>
            </Card>

            <Card>
              <h3 className="font-semibold text-mtm-navy mb-3">Report an Issue</h3>
              <p className="text-sm text-gray-600 mb-4">
                Notice something incorrect or outdated in this evaluation?
              </p>
              <Link to="/request-review">
                <Button variant="outline" className="w-full">
                  Report Issue
                </Button>
              </Link>
            </Card>
          </aside>
        </div>
      </div>
    </div>
  )
}
