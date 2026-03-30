import { Link } from 'react-router-dom'
import { X, GitCompare } from 'lucide-react'
import { useCompare } from '../../context/CompareContext'
import Button from '../ui/Button'

export default function CompareBar() {
  const { compareList, removeFromCompare, clearCompare } = useCompare()

  if (compareList.length === 0) return null

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-mtm-white/95 backdrop-blur-md border-t border-mtm-border shadow-mtm-float z-50">
      <div className="max-w-6xl mx-auto px-4 py-3">
        <div className="flex items-center justify-between gap-4">
          <div className="flex items-center gap-3 flex-wrap">
            <span className="text-sm font-medium text-mtm-navy">
              Compare ({compareList.length}/3):
            </span>
            {compareList.map((tool) => (
              <div
                key={tool.id}
                className="flex items-center gap-2 bg-mtm-surface rounded-full pl-3.5 pr-1.5 py-1 border border-mtm-border/40"
              >
                <span className="text-sm text-mtm-navy font-medium">{tool.name}</span>
                <button
                  onClick={() => removeFromCompare(tool.id)}
                  className="p-1 hover:bg-mtm-border/30 rounded-full transition-colors"
                  aria-label={`Remove ${tool.name} from comparison`}
                >
                  <X className="w-3 h-3 text-mtm-soft-blue" />
                </button>
              </div>
            ))}
          </div>
          <div className="flex items-center gap-2.5">
            <button
              onClick={clearCompare}
              className="text-sm text-mtm-soft-blue hover:text-mtm-navy transition-colors"
            >
              Clear
            </button>
            <Link to="/compare">
              <Button size="sm" disabled={compareList.length < 2}>
                <GitCompare className="w-4 h-4" />
                Compare
              </Button>
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
