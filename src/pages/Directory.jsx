import { useState, useEffect, useMemo } from 'react'
import { Link } from 'react-router-dom'
import { Loader2, ChevronDown, ChevronUp, HelpCircle, BookOpen, GitCompare } from 'lucide-react'
import SearchBar from '../components/tools/SearchBar'
import CategoryFilter from '../components/tools/CategoryFilter'
import TierToggle from '../components/tools/TierToggle'
import ToolGrid from '../components/tools/ToolGrid'
import Card from '../components/ui/Card'
import { supabase } from '../lib/supabase'
import { useCompare } from '../context/CompareContext'

export default function Directory() {
  const [tools, setTools] = useState([])
  const [loading, setLoading] = useState(true)
  const { compareList } = useCompare()
  const [showCompareHint, setShowCompareHint] = useState(true)
  const [error, setError] = useState(null)
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategories, setSelectedCategories] = useState([])
  const [selectedTier, setSelectedTier] = useState(null)
  const [showHelp, setShowHelp] = useState(false)

  useEffect(() => {
    const abortController = new AbortController()
    async function fetchTools() {
      if (!supabase) { setError('Database connection not configured.'); setLoading(false); return }
      try {
        setLoading(true)
        const { data, error: fetchError } = await supabase
          .from('tools').select(`*, tiers:tool_tiers(*)`).order('name').abortSignal(abortController.signal)
        if (fetchError) throw fetchError
        if (data && data.length > 0) {
          const allTierIds = data.flatMap(tool => tool.tiers?.map(t => t.id) || [])
          const { data: evaluations } = await supabase
            .from('evaluations').select('*').in('tool_tier_id', allTierIds).abortSignal(abortController.signal)
          const toolsWithEvals = data.map(tool => ({
            ...tool,
            tiers: tool.tiers?.map(tier => ({
              ...tier,
              evaluations: evaluations?.filter(e => e.tool_tier_id === tier.id) || []
            })) || []
          }))
          setTools(toolsWithEvals)
        } else {
          setTools(data || [])
        }
      } catch (err) {
        if (err.name === 'AbortError') return
        setError('Failed to load tools. Please try again.')
      } finally { setLoading(false) }
    }
    fetchTools()
    return () => abortController.abort()
  }, [])

  const filteredTools = useMemo(() => {
    let result = [...tools]
    if (searchQuery) {
      const q = searchQuery.toLowerCase()
      result = result.filter(t => t.name?.toLowerCase().includes(q) || t.vendor?.toLowerCase().includes(q) || t.description?.toLowerCase().includes(q))
    }
    if (selectedCategories.length > 0) result = result.filter(t => selectedCategories.some(c => t.categories?.includes(c)))
    if (selectedTier) result = result.filter(t => t.tiers?.some(tier => tier.tier_name === selectedTier))
    return result
  }, [tools, searchQuery, selectedCategories, selectedTier])

  const activeFilterCount = (selectedCategories.length > 0 ? 1 : 0) + (selectedTier ? 1 : 0)

  if (error) {
    return (
      <div className="container mx-auto px-4 py-16">
        <Card className="text-center py-12">
          <p className="text-rating-not-recommended mb-4">{error}</p>
          <button onClick={() => window.location.reload()} className="text-mtm-primary hover:underline">Try Again</button>
        </Card>
      </div>
    )
  }

  return (
    <div className="min-h-screen">
      {/* Header */}
      <div className="bg-mtm-white border-b border-mtm-border/40">
        <div className="container mx-auto px-4 py-8">
          <h1 className="font-display text-mtm-navy mb-2">AI Tools Directory</h1>
          <p className="text-mtm-soft-blue mb-6 max-w-2xl">
            Browse our evaluated AI tools. Each tool is rated based on data privacy, security,
            and responsible AI practices.
          </p>

          <div className="max-w-xl mb-6">
            <SearchBar value={searchQuery} onChange={setSearchQuery} placeholder="Search by tool name, vendor, or description..." />
          </div>

          <button
            onClick={() => setShowHelp(!showHelp)}
            className="flex items-center gap-2 text-sm text-mtm-primary hover:text-mtm-navy transition-colors"
          >
            <HelpCircle className="w-4 h-4" />
            How to use this directory
            {showHelp ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
          </button>

          {showHelp && (
            <div className="mt-4 p-5 bg-mtm-surface rounded-mtm-lg border border-mtm-border/40 animate-fade-in">
              <div className="grid md:grid-cols-3 gap-6 text-sm">
                <div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-2">Understanding Ratings</h3>
                  <ul className="space-y-2 text-mtm-soft-blue">
                    <li className="flex items-start gap-2">
                      <span className="inline-block w-2 h-2 mt-1.5 rounded-full bg-rating-recommended flex-shrink-0" />
                      <span><strong className="text-mtm-navy">Recommended</strong> (75-100): Safe for most nonprofit use cases.</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="inline-block w-2 h-2 mt-1.5 rounded-full bg-rating-caution flex-shrink-0" />
                      <span><strong className="text-mtm-navy">Caution</strong> (50-74): Usable with specific guardrails.</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="inline-block w-2 h-2 mt-1.5 rounded-full bg-rating-not-recommended flex-shrink-0" />
                      <span><strong className="text-mtm-navy">Not Recommended</strong> (0-49): Significant concerns.</span>
                    </li>
                  </ul>
                </div>
                <div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-2">Filters</h3>
                  <ul className="space-y-2 text-mtm-soft-blue">
                    <li><strong className="text-mtm-navy">Tier:</strong> Filter by Free, Pro, or Enterprise.</li>
                    <li><strong className="text-mtm-navy">Category:</strong> Find tools for specific tasks.</li>
                    <li><strong className="text-mtm-navy">Search:</strong> Look up by name or vendor.</li>
                  </ul>
                </div>
                <div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-2">Common Use Cases</h3>
                  <ul className="space-y-2 text-mtm-soft-blue">
                    <li><strong className="text-mtm-navy">Grant writing:</strong> "writing" tools rated Recommended.</li>
                    <li><strong className="text-mtm-navy">Meeting notes:</strong> "communication" category.</li>
                    <li><strong className="text-mtm-navy">Sensitive data:</strong> Enterprise tier filter.</li>
                  </ul>
                </div>
              </div>
              <div className="mt-5 pt-4 border-t border-mtm-border/30">
                <Link to="/methodology" className="inline-flex items-center gap-2 text-mtm-primary hover:text-mtm-navy transition-colors font-medium text-sm">
                  <BookOpen className="w-4 h-4" />
                  Learn about our evaluation methodology
                </Link>
              </div>
            </div>
          )}
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        <div className="lg:flex lg:gap-8">
          <aside className="lg:w-72 flex-shrink-0 mb-8 lg:mb-0">
            <Card className="sticky top-24">
              <div className="flex items-center justify-between mb-4">
                <h2 className="font-display font-semibold text-mtm-navy text-sm">Filters</h2>
                {activeFilterCount > 0 && (
                  <button onClick={() => { setSearchQuery(''); setSelectedCategories([]); setSelectedTier(null) }} className="text-xs text-mtm-primary hover:underline">
                    Clear all
                  </button>
                )}
              </div>
              <div className="space-y-6">
                <TierToggle selected={selectedTier} onChange={setSelectedTier} />
                <CategoryFilter selected={selectedCategories} onChange={setSelectedCategories} />
              </div>
            </Card>
          </aside>

          <main className="flex-grow">
            {showCompareHint && compareList.length === 0 && !loading && (
              <div className="mb-5 p-3.5 bg-mtm-primary/5 border border-mtm-primary/15 rounded-mtm-md flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <div className="w-8 h-8 bg-mtm-primary/10 rounded-full flex items-center justify-center">
                    <GitCompare className="w-4 h-4 text-mtm-primary" />
                  </div>
                  <p className="text-sm text-mtm-soft-blue">
                    <strong className="text-mtm-navy">Tip:</strong> Click the compare icon on tool cards to compare up to 3 tools side-by-side.
                  </p>
                </div>
                <button onClick={() => setShowCompareHint(false)} className="text-mtm-soft-blue/50 hover:text-mtm-navy text-sm ml-4">
                  Dismiss
                </button>
              </div>
            )}

            <div className="flex items-center justify-between mb-6">
              <p className="text-mtm-soft-blue text-sm">
                {loading ? 'Loading...' : (
                  <>Showing <span className="font-medium text-mtm-navy">{filteredTools.length}</span> {filteredTools.length === 1 ? 'tool' : 'tools'}
                    {searchQuery && <> for &ldquo;<span className="font-medium text-mtm-navy">{searchQuery}</span>&rdquo;</>}
                  </>
                )}
              </p>
            </div>

            {loading ? (
              <Card className="flex items-center justify-center py-20">
                <Loader2 className="w-7 h-7 animate-spin text-mtm-primary" />
              </Card>
            ) : (
              <ToolGrid tools={filteredTools} selectedTier={selectedTier} />
            )}
          </main>
        </div>
      </div>
    </div>
  )
}
