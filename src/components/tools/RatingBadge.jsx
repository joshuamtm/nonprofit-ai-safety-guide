import { CheckCircle2, AlertTriangle, XCircle, Clock } from 'lucide-react'
import { cn } from '../../lib/utils'

const ratingConfig = {
  recommended: {
    label: 'Recommended',
    icon: CheckCircle2,
    bgColor: 'bg-rating-recommended/10',
    textColor: 'text-rating-recommended',
    borderColor: 'border-rating-recommended',
  },
  caution: {
    label: 'Caution',
    icon: AlertTriangle,
    bgColor: 'bg-rating-caution/10',
    textColor: 'text-rating-caution',
    borderColor: 'border-rating-caution',
  },
  not_recommended: {
    label: 'Not Recommended',
    icon: XCircle,
    bgColor: 'bg-rating-not-recommended/10',
    textColor: 'text-rating-not-recommended',
    borderColor: 'border-rating-not-recommended',
  },
  under_review: {
    label: 'Under Review',
    icon: Clock,
    bgColor: 'bg-rating-under-review/10',
    textColor: 'text-rating-under-review',
    borderColor: 'border-rating-under-review',
  },
}

export default function RatingBadge({ rating, size = 'md', showLabel = true }) {
  const config = ratingConfig[rating] || ratingConfig.under_review
  const Icon = config.icon

  const sizes = {
    sm: 'px-2 py-0.5 text-xs',
    md: 'px-3 py-1 text-sm',
    lg: 'px-4 py-2 text-base',
  }

  const iconSizes = {
    sm: 12,
    md: 16,
    lg: 20,
  }

  return (
    <span
      className={cn(
        'inline-flex items-center gap-1.5 rounded-full font-medium',
        config.bgColor,
        config.textColor,
        sizes[size]
      )}
    >
      <Icon size={iconSizes[size]} />
      {showLabel && config.label}
    </span>
  )
}
