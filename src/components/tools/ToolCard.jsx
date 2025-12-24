import { useState } from 'react'
import { Link } from 'react-router-dom'
import { ExternalLink } from 'lucide-react'
import Card from '../ui/Card'
import Badge from '../ui/Badge'
import RatingBadge from './RatingBadge'
import { formatDate } from '../../lib/utils'

export default function ToolCard({ tool, tier }) {
  const displayTier = tier || tool.tiers?.[0]
  const [imgError, setImgError] = useState(false)

  const LetterAvatar = () => (
    <div className="w-12 h-12 rounded-lg bg-mtm-primary/10 flex items-center justify-center">
      <span className="text-mtm-primary font-bold text-lg">
        {tool.name?.charAt(0)}
      </span>
    </div>
  )

  return (
    <Card hover className="h-full flex flex-col">
      {/* Header */}
      <div className="flex items-start justify-between gap-4 mb-4">
        <div className="flex items-center gap-3">
          {tool.logo_url && !imgError ? (
            <img
              src={tool.logo_url}
              alt={`${tool.name} logo`}
              className="w-12 h-12 rounded-lg object-contain bg-gray-50 p-1"
              onError={() => setImgError(true)}
            />
          ) : (
            <LetterAvatar />
          )}
          <div>
            <h3 className="font-semibold text-mtm-navy">
              <Link
                to={`/tool/${tool.id}`}
                className="hover:text-mtm-primary transition-colors"
              >
                {tool.name}
              </Link>
            </h3>
            {tool.vendor && (
              <p className="text-sm text-gray-500">{tool.vendor}</p>
            )}
          </div>
        </div>
        {displayTier && (
          <RatingBadge rating={displayTier.overall_rating} size="sm" />
        )}
      </div>

      {/* Description */}
      <p className="text-gray-600 text-sm mb-4 flex-grow line-clamp-2">
        {tool.description}
      </p>

      {/* Categories */}
      {tool.categories && tool.categories.length > 0 && (
        <div className="flex flex-wrap gap-1.5 mb-4">
          {tool.categories.slice(0, 3).map((category) => (
            <Badge key={category} variant="default" className="text-xs">
              {category}
            </Badge>
          ))}
          {tool.categories.length > 3 && (
            <Badge variant="default" className="text-xs">
              +{tool.categories.length - 3}
            </Badge>
          )}
        </div>
      )}

      {/* Tier & Date */}
      <div className="flex items-center justify-between pt-4 border-t border-gray-100">
        {displayTier && (
          <span className="text-xs text-gray-500">
            {displayTier.tier_name} tier
          </span>
        )}
        {displayTier?.last_reviewed_at && (
          <span className="text-xs text-gray-400">
            Updated {formatDate(displayTier.last_reviewed_at)}
          </span>
        )}
      </div>

      {/* Link to full details */}
      <Link
        to={`/tool/${tool.id}`}
        className="mt-4 text-mtm-primary text-sm font-medium flex items-center gap-1 hover:underline"
      >
        View details <ExternalLink size={14} />
      </Link>
    </Card>
  )
}
