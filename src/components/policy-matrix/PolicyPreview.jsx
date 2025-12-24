import { useState } from 'react'
import { ChevronDown, ChevronRight } from 'lucide-react'
import { cn } from '../../lib/utils'

export default function PolicyPreview({ policy }) {
  const [expandedSections, setExpandedSections] = useState(
    policy.sections.map((_, i) => i === 0) // First section expanded by default
  )

  const toggleSection = (index) => {
    setExpandedSections((prev) =>
      prev.map((expanded, i) => (i === index ? !expanded : expanded))
    )
  }

  const expandAll = () => setExpandedSections(policy.sections.map(() => true))
  const collapseAll = () => setExpandedSections(policy.sections.map(() => false))

  return (
    <div className="border border-gray-200 rounded-mtm-lg overflow-hidden">
      {/* Header */}
      <div className="bg-gray-50 px-4 py-3 border-b border-gray-200 flex items-center justify-between">
        <h3 className="font-medium text-gray-900">Policy Preview</h3>
        <div className="flex gap-2">
          <button
            onClick={expandAll}
            className="text-xs text-mtm-primary hover:underline"
          >
            Expand all
          </button>
          <span className="text-gray-300">|</span>
          <button
            onClick={collapseAll}
            className="text-xs text-mtm-primary hover:underline"
          >
            Collapse all
          </button>
        </div>
      </div>

      {/* Sections */}
      <div className="divide-y divide-gray-100">
        {policy.sections.map((section, index) => (
          <div key={index}>
            <button
              onClick={() => toggleSection(index)}
              className="w-full px-4 py-3 flex items-center justify-between hover:bg-gray-50 transition-colors"
            >
              <span className="font-medium text-gray-900">{section.title}</span>
              {expandedSections[index] ? (
                <ChevronDown className="w-5 h-5 text-gray-400" />
              ) : (
                <ChevronRight className="w-5 h-5 text-gray-400" />
              )}
            </button>
            <div
              className={cn(
                'px-4 pb-4 space-y-2 transition-all overflow-hidden',
                expandedSections[index] ? 'block' : 'hidden'
              )}
            >
              {section.content.map((paragraph, pIndex) => (
                <p key={pIndex} className="text-sm text-gray-600 leading-relaxed">
                  {paragraph}
                </p>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
