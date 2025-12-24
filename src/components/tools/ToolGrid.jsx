import ToolCard from './ToolCard'

export default function ToolGrid({ tools, selectedTier }) {
  if (!tools || tools.length === 0) {
    return (
      <div className="text-center py-12">
        <p className="text-gray-500">No tools found matching your criteria.</p>
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      {tools.map((tool) => {
        const tier = selectedTier
          ? tool.tiers?.find((t) => t.tier_name === selectedTier)
          : tool.tiers?.[0]
        return <ToolCard key={tool.id} tool={tool} tier={tier} />
      })}
    </div>
  )
}
