import { cn } from '../../lib/utils'

export default function Select({ label, options = [], error, className, placeholder = 'Select an option', ...props }) {
  return (
    <div className="w-full">
      {label && (
        <label className="block text-sm font-medium text-mtm-navy mb-1.5">{label}</label>
      )}
      <select
        className={cn(
          'w-full px-4 py-2.5 rounded-mtm-md border text-sm',
          'bg-mtm-white text-mtm-navy',
          'transition-colors duration-200',
          error
            ? 'border-rating-not-recommended focus:ring-2 focus:ring-rating-not-recommended/20'
            : 'border-mtm-border focus:border-mtm-primary focus:ring-2 focus:ring-mtm-primary/10',
          className
        )}
        {...props}
      >
        <option value="">{placeholder}</option>
        {options.map((opt) => (
          <option key={opt.value} value={opt.value}>{opt.label}</option>
        ))}
      </select>
      {error && <p className="mt-1.5 text-sm text-rating-not-recommended">{error}</p>}
    </div>
  )
}
