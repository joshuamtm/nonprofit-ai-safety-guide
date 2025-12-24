import { Check } from 'lucide-react'
import { CATEGORIES } from '../../lib/utils'
import { cn } from '../../lib/utils'

export default function CategoryFilter({ selected = [], onChange }) {
  const toggleCategory = (categoryId) => {
    if (selected.includes(categoryId)) {
      onChange(selected.filter((id) => id !== categoryId))
    } else {
      onChange([...selected, categoryId])
    }
  }

  const clearAll = () => {
    onChange([])
  }

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <span className="text-sm font-medium text-gray-700">Categories</span>
        {selected.length > 0 && (
          <button
            onClick={clearAll}
            className="text-xs text-mtm-primary hover:underline"
          >
            Clear
          </button>
        )}
      </div>
      <div className="space-y-1">
        {CATEGORIES.map((category) => {
          const isSelected = selected.includes(category.id)
          return (
            <button
              key={category.id}
              onClick={() => toggleCategory(category.id)}
              className={cn(
                'w-full flex items-center gap-2 px-3 py-2 rounded-lg text-sm transition-colors text-left',
                isSelected
                  ? 'bg-mtm-primary/10 text-mtm-primary font-medium'
                  : 'text-gray-600 hover:bg-gray-50'
              )}
            >
              <span className={cn(
                'w-4 h-4 rounded border flex items-center justify-center flex-shrink-0',
                isSelected
                  ? 'bg-mtm-primary border-mtm-primary'
                  : 'border-gray-300'
              )}>
                {isSelected && <Check className="w-3 h-3 text-white" />}
              </span>
              <span className="truncate">{category.label}</span>
            </button>
          )
        })}
      </div>
    </div>
  )
}
