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
            Clear all
          </button>
        )}
      </div>
      <div className="flex flex-wrap gap-2">
        {CATEGORIES.map((category) => (
          <button
            key={category.id}
            onClick={() => toggleCategory(category.id)}
            className={cn(
              'px-3 py-1.5 rounded-full text-sm font-medium transition-colors',
              selected.includes(category.id)
                ? 'bg-mtm-primary text-white'
                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
            )}
          >
            {category.label}
          </button>
        ))}
      </div>
    </div>
  )
}
