import { Check } from 'lucide-react'
import { CATEGORIES, cn } from '../../lib/utils'

export default function CategoryFilter({ selected = [], onChange }) {
  const toggleCategory = (categoryId) => {
    if (selected.includes(categoryId)) {
      onChange(selected.filter((id) => id !== categoryId))
    } else {
      onChange([...selected, categoryId])
    }
  }

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <span className="text-sm font-medium text-mtm-navy">Categories</span>
        {selected.length > 0 && (
          <button onClick={() => onChange([])} className="text-xs text-mtm-primary hover:underline">
            Clear
          </button>
        )}
      </div>
      <div className="space-y-0.5">
        {CATEGORIES.map((category) => {
          const isSelected = selected.includes(category.id)
          return (
            <button
              key={category.id}
              onClick={() => toggleCategory(category.id)}
              className={cn(
                'w-full flex items-center gap-2.5 px-3 py-2 rounded-mtm-md text-sm transition-all duration-150 text-left',
                isSelected
                  ? 'bg-mtm-primary/8 text-mtm-primary font-medium'
                  : 'text-mtm-soft-blue hover:bg-mtm-surface hover:text-mtm-navy'
              )}
            >
              <span className={cn(
                'w-4 h-4 rounded border-2 flex items-center justify-center flex-shrink-0 transition-colors',
                isSelected
                  ? 'bg-mtm-primary border-mtm-primary'
                  : 'border-mtm-border'
              )}>
                {isSelected && <Check className="w-2.5 h-2.5 text-white" strokeWidth={3} />}
              </span>
              <span className="truncate">{category.label}</span>
            </button>
          )
        })}
      </div>
    </div>
  )
}
