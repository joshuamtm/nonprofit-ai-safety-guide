import { useState, useEffect } from 'react'
import { Search, X } from 'lucide-react'

export default function SearchBar({ value, onChange, placeholder = 'Search tools...' }) {
  const [localValue, setLocalValue] = useState(value || '')

  useEffect(() => {
    const timer = setTimeout(() => {
      onChange(localValue)
    }, 300)
    return () => clearTimeout(timer)
  }, [localValue, onChange])

  useEffect(() => {
    setLocalValue(value || '')
  }, [value])

  const handleClear = () => {
    setLocalValue('')
    onChange('')
  }

  return (
    <div className="relative group">
      <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
        <Search className="h-4.5 w-4.5 text-mtm-soft-blue/50 group-focus-within:text-mtm-primary transition-colors" />
      </div>
      <input
        type="text"
        value={localValue}
        onChange={(e) => setLocalValue(e.target.value)}
        className="block w-full pl-11 pr-10 py-3 border border-mtm-border rounded-mtm-lg
                   bg-mtm-white text-mtm-navy
                   focus:outline-none focus:ring-2 focus:ring-mtm-primary/15 focus:border-mtm-primary
                   placeholder:text-mtm-soft-blue/50 text-sm transition-all duration-200"
        placeholder={placeholder}
      />
      {localValue && (
        <button
          onClick={handleClear}
          className="absolute inset-y-0 right-0 pr-4 flex items-center"
          aria-label="Clear search"
        >
          <X className="h-4 w-4 text-mtm-soft-blue/50 hover:text-mtm-navy transition-colors" />
        </button>
      )}
    </div>
  )
}
