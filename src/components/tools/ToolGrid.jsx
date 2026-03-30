import ToolCard from './ToolCard'

export default function ToolGrid({ tools, selectedTier }) {
  if (!tools || tools.length === 0) {
    return (
      <div className="text-center py-16">
        <p className="text-mtm-soft-blue font-display text-lg">No tools found matching your criteria.</p>
        <p className="text-mtm-soft-blue/60 text-sm mt-1">Try adjusting your filters or search terms.</p>
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-5">
      {tools.map((tool) => {
        const tier = selectedTier
          ? tool.tiers?.find((t) => t.tier_name === selectedTier)
          : tool.tiers?.[0]
        return <ToolCard key={tool.id} tool={tool} tier={tier} />
      })}
    </div>
  )
}
