import { useState, useEffect, useMemo } from 'react'
import { Loader2, ChevronDown, ChevronUp, HelpCircle } from 'lucide-react'
import SearchBar from '../components/tools/SearchBar'
import CategoryFilter from '../components/tools/CategoryFilter'
import TierToggle from '../components/tools/TierToggle'
import ToolGrid from '../components/tools/ToolGrid'
import Card from '../components/ui/Card'
import { supabase } from '../lib/supabase'

export default function Directory() {
  const [tools, setTools] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  // Filter state
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategories, setSelectedCategories] = useState([])
  const [selectedTier, setSelectedTier] = useState(null)
  const [showHelp, setShowHelp] = useState(false)

  // Fetch tools from Supabase
  useEffect(() => {
    const abortController = new AbortController()

    async function fetchTools() {
      // Guard check for Supabase client
      if (!supabase) {
        setError('Database connection not configured.')
        setLoading(false)
        return
      }

      try {
        setLoading(true)
        const { data, error: fetchError } = await supabase
          .from('tools')
          .select(`
            *,
            tiers:tool_tiers(*)
          `)
          .order('name')
          .abortSignal(abortController.signal)

        if (fetchError) throw fetchError

        // Fetch evaluations for all tiers
        if (data && data.length > 0) {
          const allTierIds = data.flatMap(tool => tool.tiers?.map(t => t.id) || [])
          const { data: evaluations } = await supabase
            .from('evaluations')
            .select('*')
            .in('tool_tier_id', allTierIds)
            .abortSignal(abortController.signal)

          // Attach evaluations to their respective tiers (immutable)
          const toolsWithEvaluations = data.map(tool => ({
            ...tool,
            tiers: tool.tiers?.map(tier => ({
              ...tier,
              evaluations: evaluations?.filter(e => e.tool_tier_id === tier.id) || []
            })) || []
          }))

          setTools(toolsWithEvaluations)
        } else {
          setTools(data || [])
        }
      } catch (err) {
        if (err.name === 'AbortError') return
        console.error('Error fetching tools:', err)
        setError('Failed to load tools. Please try again.')
      } finally {
        setLoading(false)
      }
    }

    fetchTools()

    return () => abortController.abort()
  }, [])

  // Filter tools based on current filters
  const filteredTools = useMemo(() => {
    let result = [...tools]

    // Search filter
    if (searchQuery) {
      const query = searchQuery.toLowerCase()
      result = result.filter(
        (tool) =>
          tool.name?.toLowerCase().includes(query) ||
          tool.vendor?.toLowerCase().includes(query) ||
          tool.description?.toLowerCase().includes(query)
      )
    }

    // Category filter
    if (selectedCategories.length > 0) {
      result = result.filter((tool) =>
        selectedCategories.some((cat) => tool.categories?.includes(cat))
      )
    }

    // Tier filter
    if (selectedTier) {
      result = result.filter((tool) =>
        tool.tiers?.some((tier) => tier.tier_name === selectedTier)
      )
    }

    return result
  }, [tools, searchQuery, selectedCategories, selectedTier])

  // Count active filters
  const activeFilterCount = (selectedCategories.length > 0 ? 1 : 0) + (selectedTier ? 1 : 0)

  const clearAllFilters = () => {
    setSearchQuery('')
    setSelectedCategories([])
    setSelectedTier(null)
  }

  if (error) {
    return (
      <div className="container mx-auto px-4 py-16">
        <Card className="text-center py-12">
          <p className="text-rating-not-recommended mb-4">{error}</p>
          <button
            onClick={() => window.location.reload()}
            className="text-mtm-primary hover:underline"
          >
            Try Again
          </button>
        </Card>
      </div>
    )
  }

  return (
    <div className="bg-gray-50 min-h-screen">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="container mx-auto px-4 py-8">
          <h1 className="text-3xl font-bold text-mtm-navy mb-2">AI Tools Directory</h1>
          <p className="text-gray-600 mb-6">
            Browse our evaluated AI tools. Each tool is rated based on data privacy, security,
            and responsible AI practices.
          </p>

          {/* Search Bar - Prominent in header */}
          <div className="max-w-xl mb-6">
            <SearchBar
              value={searchQuery}
              onChange={setSearchQuery}
              placeholder="Search by tool name, vendor, or description..."
            />
          </div>

          {/* How to use this */}
          <button
            onClick={() => setShowHelp(!showHelp)}
            className="flex items-center gap-2 text-sm text-mtm-primary hover:text-mtm-navy transition-colors"
          >
            <HelpCircle className="w-4 h-4" />
            How to use this directory
            {showHelp ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
          </button>

          {showHelp && (
            <div className="mt-4 p-4 bg-gray-50 rounded-lg border border-gray-200">
              <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 text-sm">
                {/* Rating Guide */}
                <div>
                  <h3 className="font-semibold text-mtm-navy mb-2">Understanding Ratings</h3>
                  <ul className="space-y-2 text-gray-600">
                    <li className="flex items-start gap-2">
                      <span className="inline-block w-2 h-2 mt-1.5 rounded-full bg-rating-recommended flex-shrink-0"></span>
                      <span><strong>Recommended</strong> (24-30 pts): Safe for most nonprofit use cases with proper policies.</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="inline-block w-2 h-2 mt-1.5 rounded-full bg-rating-caution flex-shrink-0"></span>
                      <span><strong>Caution</strong> (16-23 pts): Usable with specific guardrails. Review concerns before adopting.</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="inline-block w-2 h-2 mt-1.5 rounded-full bg-rating-not-recommended flex-shrink-0"></span>
                      <span><strong>Not Recommended</strong> (0-15 pts): Significant concerns for nonprofit use.</span>
                    </li>
                  </ul>
                </div>

                {/* Using Filters */}
                <div>
                  <h3 className="font-semibold text-mtm-navy mb-2">Using Filters</h3>
                  <ul className="space-y-2 text-gray-600">
                    <li><strong>Tier:</strong> Filter by pricing tier. "Free" shows tools with no-cost options; "Enterprise" shows tools with advanced security controls.</li>
                    <li><strong>Category:</strong> Find tools for specific tasks like writing, images, or project management.</li>
                    <li><strong>Search:</strong> Look up tools by name, vendor, or description.</li>
                  </ul>
                </div>

                {/* Use Cases */}
                <div>
                  <h3 className="font-semibold text-mtm-navy mb-2">Common Use Cases</h3>
                  <ul className="space-y-2 text-gray-600">
                    <li><strong>Grant writing:</strong> Look for "writing" tools rated Recommended.</li>
                    <li><strong>Board presentations:</strong> Check "images" + "productivity" categories.</li>
                    <li><strong>Meeting notes:</strong> Filter by "communication" or search "transcription".</li>
                    <li><strong>Sensitive data:</strong> Use Enterprise tier filter for strongest privacy controls.</li>
                  </ul>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        <div className="lg:flex lg:gap-8">
          {/* Filters Sidebar */}
          <aside className="lg:w-72 flex-shrink-0 mb-8 lg:mb-0">
            <Card className="sticky top-24">
              <div className="flex items-center justify-between mb-4">
                <h2 className="font-semibold text-gray-900">Filters</h2>
                {activeFilterCount > 0 && (
                  <button
                    onClick={clearAllFilters}
                    className="text-sm text-mtm-primary hover:underline"
                  >
                    Clear all
                  </button>
                )}
              </div>

              <div className="space-y-6">
                <TierToggle selected={selectedTier} onChange={setSelectedTier} />

                <CategoryFilter
                  selected={selectedCategories}
                  onChange={setSelectedCategories}
                />
              </div>
            </Card>
          </aside>

          {/* Results */}
          <main className="flex-grow">
            {/* Results header */}
            <div className="flex items-center justify-between mb-6">
              <p className="text-gray-600">
                {loading ? (
                  'Loading...'
                ) : (
                  <>
                    Showing <span className="font-medium">{filteredTools.length}</span>{' '}
                    {filteredTools.length === 1 ? 'tool' : 'tools'}
                    {searchQuery && (
                      <>
                        {' '}
                        for "<span className="font-medium">{searchQuery}</span>"
                      </>
                    )}
                  </>
                )}
              </p>
            </div>

            {loading ? (
              <Card className="flex items-center justify-center py-16">
                <Loader2 className="w-8 h-8 animate-spin text-mtm-primary" />
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
