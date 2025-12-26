import { useState } from 'react'
import { Link } from 'react-router-dom'
import { GitCompare, Check } from 'lucide-react'
import Card from '../ui/Card'
import Badge from '../ui/Badge'
import RatingBadge from './RatingBadge'
import { formatDate, calculateOverallScore } from '../../lib/utils'
import { useCompare } from '../../context/CompareContext'

export default function ToolCard({ tool, tier }) {
  const displayTier = tier || tool.tiers?.[0]
  const [imgError, setImgError] = useState(false)
  const { addToCompare, removeFromCompare, isInCompare, canAddMore } = useCompare()
  const inCompare = isInCompare(tool.id)

  // Calculate the weighted score from evaluations
  const score = displayTier?.evaluations ? calculateOverallScore(displayTier.evaluations) : null

  const LetterAvatar = () => (
    <div className="w-12 h-12 rounded-lg bg-mtm-primary/10 flex items-center justify-center">
      <span className="text-mtm-primary font-bold text-lg">
        {tool.name?.charAt(0)}
      </span>
    </div>
  )

  const handleCompareClick = (e) => {
    e.preventDefault()
    e.stopPropagation()
    if (inCompare) {
      removeFromCompare(tool.id)
    } else {
      addToCompare({ ...tool, tiers: tool.tiers })
    }
  }

  return (
    <Link to={`/tool/${tool.id}`} className="block h-full">
      <Card hover className="h-full flex flex-col cursor-pointer relative">
        {/* Compare Button */}
        <button
          onClick={handleCompareClick}
          disabled={!inCompare && !canAddMore}
          className={`absolute top-3 right-3 p-1.5 rounded-md transition-colors z-10 ${
            inCompare
              ? 'bg-mtm-primary text-white'
              : canAddMore
              ? 'bg-gray-100 text-gray-500 hover:bg-mtm-primary/10 hover:text-mtm-primary'
              : 'bg-gray-100 text-gray-300 cursor-not-allowed'
          }`}
          title={inCompare ? 'Remove from comparison' : canAddMore ? 'Add to comparison' : 'Max 3 tools'}
        >
          {inCompare ? <Check className="w-4 h-4" /> : <GitCompare className="w-4 h-4" />}
        </button>

        {/* Header */}
        <div className="flex items-start justify-between gap-3 mb-4 pr-10">
          <div className="flex items-center gap-3 min-w-0 flex-1">
            {tool.logo_url && !imgError ? (
              <img
                src={tool.logo_url}
                alt={`${tool.name} logo`}
                className="w-12 h-12 rounded-lg object-contain bg-gray-50 p-1 flex-shrink-0"
                onError={() => setImgError(true)}
              />
            ) : (
              <LetterAvatar />
            )}
            <div className="min-w-0">
              <h3 className="font-semibold text-mtm-navy group-hover:text-mtm-primary transition-colors truncate">
                {tool.name}
              </h3>
              {tool.vendor && (
                <p className="text-sm text-gray-500 truncate">{tool.vendor}</p>
              )}
            </div>
          </div>
          <div className="flex flex-col items-end gap-1 flex-shrink-0">
            {displayTier && (
              <RatingBadge rating={displayTier.overall_rating} size="sm" />
            )}
            {score !== null && (
              <span className="text-xs font-medium text-gray-500">
                {score}/100
              </span>
            )}
          </div>
        </div>

        {/* Description */}
        <p className="text-gray-600 text-sm mb-4 flex-grow line-clamp-3">
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
      </Card>
    </Link>
  )
}
