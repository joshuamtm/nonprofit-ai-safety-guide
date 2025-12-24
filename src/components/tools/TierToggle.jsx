import { cn } from '../../lib/utils'

const TIERS = [
  { id: 'all', label: 'All Tiers' },
  { id: 'Free', label: 'Free' },
  { id: 'Pro', label: 'Pro/Plus' },
  { id: 'Enterprise', label: 'Enterprise' },
]

export default function TierToggle({ selected, onChange }) {
  return (
    <div className="space-y-2">
      <span className="text-sm font-medium text-gray-700">Product Tier</span>
      <div className="flex flex-wrap gap-2">
        {TIERS.map((tier) => (
          <button
            key={tier.id}
            onClick={() => onChange(tier.id === 'all' ? null : tier.id)}
            className={cn(
              'px-4 py-2 rounded-mtm-md text-sm font-medium transition-colors border',
              (tier.id === 'all' && !selected) || selected === tier.id
                ? 'bg-mtm-navy text-white border-mtm-navy'
                : 'bg-white text-gray-700 border-gray-300 hover:border-mtm-navy'
            )}
          >
            {tier.label}
          </button>
        ))}
      </div>
    </div>
  )
}
