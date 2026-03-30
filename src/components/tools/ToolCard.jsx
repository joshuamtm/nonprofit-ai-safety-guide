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

  const score = displayTier?.evaluations ? calculateOverallScore(displayTier.evaluations) : null

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
    <Link to={`/tool/${tool.id}`} className="block h-full group">
      <Card hover className="h-full flex flex-col relative">
        {/* Compare Button */}
        <button
          onClick={handleCompareClick}
          disabled={!inCompare && !canAddMore}
          className={`absolute top-4 right-4 p-1.5 rounded-mtm-sm transition-all z-10 ${
            inCompare
              ? 'bg-mtm-primary text-white shadow-sm'
              : canAddMore
              ? 'bg-mtm-surface text-mtm-soft-blue hover:bg-mtm-primary/10 hover:text-mtm-primary'
              : 'bg-mtm-surface text-mtm-border cursor-not-allowed'
          }`}
          title={inCompare ? 'Remove from comparison' : canAddMore ? 'Add to comparison' : 'Max 3 tools'}
        >
          {inCompare ? <Check className="w-4 h-4" /> : <GitCompare className="w-4 h-4" />}
        </button>

        {/* Header */}
        <div className="flex items-start gap-3.5 mb-4 pr-10">
          <div className="flex-shrink-0">
            {tool.logo_url && !imgError ? (
              <img
                src={tool.logo_url}
                alt={`${tool.name} logo`}
                className="w-11 h-11 rounded-mtm-md object-contain bg-mtm-surface p-1.5 border border-mtm-border/30"
                onError={() => setImgError(true)}
              />
            ) : (
              <div className="w-11 h-11 rounded-mtm-md bg-gradient-to-br from-mtm-primary/15 to-mtm-primary/5 flex items-center justify-center border border-mtm-primary/15">
                <span className="text-mtm-primary font-display font-semibold text-lg">
                  {tool.name?.charAt(0)}
                </span>
              </div>
            )}
          </div>
          <div className="min-w-0 flex-1">
            <h3 className="font-display font-semibold text-mtm-navy group-hover:text-mtm-primary transition-colors truncate text-[1.05rem]">
              {tool.name}
            </h3>
            {tool.vendor && (
              <p className="text-sm text-mtm-soft-blue truncate">{tool.vendor}</p>
            )}
          </div>
        </div>

        {/* Rating + Score */}
        <div className="flex items-center gap-3 mb-3.5">
          {displayTier && <RatingBadge rating={displayTier.overall_rating} size="sm" />}
          {score !== null && (
            <span className="score-display text-sm text-mtm-soft-blue">
              {score}<span className="text-mtm-border">/100</span>
            </span>
          )}
        </div>

        {/* Description */}
        <p className="text-mtm-soft-blue text-sm mb-4 flex-grow line-clamp-3 leading-relaxed">
          {tool.description}
        </p>

        {/* Categories */}
        {tool.categories && tool.categories.length > 0 && (
          <div className="flex flex-wrap gap-1.5 mb-4">
            {tool.categories.slice(0, 3).map((category) => (
              <Badge key={category}>{category}</Badge>
            ))}
            {tool.categories.length > 3 && (
              <Badge>+{tool.categories.length - 3}</Badge>
            )}
          </div>
        )}

        {/* Footer */}
        <div className="flex items-center justify-between pt-4 border-t border-mtm-border/30">
          {displayTier && (
            <span className="text-xs text-mtm-soft-blue/70 font-medium">
              {displayTier.tier_name} tier
            </span>
          )}
          {displayTier?.last_reviewed_at && (
            <span className="text-xs text-mtm-soft-blue/50">
              Updated {formatDate(displayTier.last_reviewed_at)}
            </span>
          )}
        </div>
      </Card>
    </Link>
  )
}
