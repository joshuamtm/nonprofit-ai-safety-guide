import { Link } from 'react-router-dom'
import { X, GitCompare } from 'lucide-react'
import { useCompare } from '../../context/CompareContext'
import Button from '../ui/Button'

export default function CompareBar() {
  const { compareList, removeFromCompare, clearCompare } = useCompare()

  if (compareList.length === 0) return null

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 shadow-lg z-50">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between gap-4">
          <div className="flex items-center gap-3 flex-wrap">
            <span className="text-sm font-medium text-gray-700">
              Compare ({compareList.length}/3):
            </span>
            {compareList.map((tool) => (
              <div
                key={tool.id}
                className="flex items-center gap-2 bg-gray-100 rounded-full pl-3 pr-1 py-1"
              >
                <span className="text-sm text-gray-700">{tool.name}</span>
                <button
                  onClick={() => removeFromCompare(tool.id)}
                  className="p-1 hover:bg-gray-200 rounded-full transition-colors"
                  aria-label={`Remove ${tool.name} from comparison`}
                >
                  <X className="w-3 h-3 text-gray-500" />
                </button>
              </div>
            ))}
          </div>
          <div className="flex items-center gap-2">
            <button
              onClick={clearCompare}
              className="text-sm text-gray-500 hover:text-gray-700"
            >
              Clear
            </button>
            <Link to="/compare">
              <Button size="sm" disabled={compareList.length < 2}>
                <GitCompare className="w-4 h-4 mr-2" />
                Compare
              </Button>
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
