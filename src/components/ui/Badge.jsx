import { cn } from '../../lib/utils'

const variants = {
  default: 'bg-mtm-surface text-mtm-soft-blue border border-mtm-border/50',
  primary: 'bg-mtm-primary/10 text-mtm-primary border border-mtm-primary/20',
  accent: 'bg-mtm-accent/10 text-mtm-accent border border-mtm-accent/20',
  recommended: 'bg-rating-recommended-light text-rating-recommended border border-rating-recommended/20',
  caution: 'bg-rating-caution-light text-rating-caution border border-rating-caution/20',
  'not-recommended': 'bg-rating-not-recommended-light text-rating-not-recommended border border-rating-not-recommended/20',
  'under-review': 'bg-rating-under-review-light text-rating-under-review border border-rating-under-review/20',
}

export default function Badge({ variant = 'default', children, className, ...props }) {
  return (
    <span
      className={cn(
        'inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium tracking-wide',
        variants[variant],
        className
      )}
      {...props}
    >
      {children}
    </span>
  )
}
