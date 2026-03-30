import { CheckCircle2, AlertTriangle, XCircle, Clock } from 'lucide-react'
import { cn } from '../../lib/utils'

const ratingConfig = {
  recommended: {
    label: 'Recommended',
    icon: CheckCircle2,
    bgColor: 'bg-rating-recommended-light',
    textColor: 'text-rating-recommended',
    borderColor: 'border-rating-recommended/25',
  },
  caution: {
    label: 'Caution',
    icon: AlertTriangle,
    bgColor: 'bg-rating-caution-light',
    textColor: 'text-rating-caution',
    borderColor: 'border-rating-caution/25',
  },
  not_recommended: {
    label: 'Not Recommended',
    icon: XCircle,
    bgColor: 'bg-rating-not-recommended-light',
    textColor: 'text-rating-not-recommended',
    borderColor: 'border-rating-not-recommended/25',
  },
  under_review: {
    label: 'Under Review',
    icon: Clock,
    bgColor: 'bg-rating-under-review-light',
    textColor: 'text-rating-under-review',
    borderColor: 'border-rating-under-review/25',
  },
}

const sizes = {
  sm: { badge: 'px-2.5 py-1 text-xs', icon: 13 },
  md: { badge: 'px-3 py-1.5 text-sm', icon: 15 },
  lg: { badge: 'px-4 py-2 text-base', icon: 18 },
}

export default function RatingBadge({ rating, size = 'md', showLabel = true }) {
  const config = ratingConfig[rating] || ratingConfig.under_review
  const Icon = config.icon
  const sizeConfig = sizes[size]

  return (
    <span
      className={cn(
        'inline-flex items-center gap-1.5 rounded-full font-medium border',
        config.bgColor,
        config.textColor,
        config.borderColor,
        sizeConfig.badge
      )}
    >
      <Icon size={sizeConfig.icon} />
      {showLabel && config.label}
    </span>
  )
}
