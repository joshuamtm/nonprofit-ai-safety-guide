import { useState, useEffect, useMemo } from 'react'
import { Loader2 } from 'lucide-react'
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

  // Fetch tools from Supabase
  useEffect(() => {
    async function fetchTools() {
      try {
        setLoading(true)
        const { data, error: fetchError } = await supabase
          .from('tools')
          .select(`
            *,
            tiers:tool_tiers(*)
          `)
          .order('name')

        if (fetchError) throw fetchError

        setTools(data || [])
      } catch (err) {
        console.error('Error fetching tools:', err)
        setError('Failed to load tools. Please try again.')
      } finally {
        setLoading(false)
      }
    }

    fetchTools()
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
          <p className="text-gray-600">
            Browse our evaluated AI tools. Each tool is rated based on data privacy, security,
            and responsible AI practices.
          </p>
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
                <div>
                  <SearchBar
                    value={searchQuery}
                    onChange={setSearchQuery}
                    placeholder="Search tools..."
                  />
                </div>

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
