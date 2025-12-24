import { cn } from '../../lib/utils'

const variants = {
  default: 'bg-gray-100 text-gray-700',
  primary: 'bg-mtm-primary/10 text-mtm-primary',
  accent: 'bg-mtm-accent/10 text-mtm-accent',
  recommended: 'bg-rating-recommended/10 text-rating-recommended',
  caution: 'bg-rating-caution/10 text-rating-caution',
  'not-recommended': 'bg-rating-not-recommended/10 text-rating-not-recommended',
  'under-review': 'bg-rating-under-review/10 text-rating-under-review',
}

export default function Badge({
  variant = 'default',
  children,
  className,
  ...props
}) {
  return (
    <span
      className={cn(
        'inline-flex items-center px-2.5 py-0.5 rounded-full text-sm font-medium',
        variants[variant],
        className
      )}
      {...props}
    >
      {children}
    </span>
  )
}
