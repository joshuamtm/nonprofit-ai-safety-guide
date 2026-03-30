import { cn } from '../../lib/utils'

const TIERS = [
  { id: 'all', label: 'All Tiers' },
  { id: 'Free', label: 'Free' },
  { id: 'Pro', label: 'Pro/Plus' },
  { id: 'Enterprise', label: 'Enterprise' },
]

export default function TierToggle({ selected, onChange }) {
  return (
    <div className="space-y-2.5">
      <span className="text-sm font-medium text-mtm-navy">Product Tier</span>
      <div className="flex flex-wrap gap-1.5">
        {TIERS.map((tier) => {
          const isActive = (tier.id === 'all' && !selected) || selected === tier.id
          return (
            <button
              key={tier.id}
              onClick={() => onChange(tier.id === 'all' ? null : tier.id)}
              className={cn(
                'px-3.5 py-2 rounded-mtm-md text-sm font-medium transition-all duration-200 border',
                isActive
                  ? 'bg-mtm-navy text-white border-mtm-navy shadow-sm'
                  : 'bg-mtm-white text-mtm-soft-blue border-mtm-border hover:border-mtm-navy/30 hover:text-mtm-navy'
              )}
            >
              {tier.label}
            </button>
          )
        })}
      </div>
    </div>
  )
}
