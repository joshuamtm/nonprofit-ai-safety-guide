import { cn } from '../../lib/utils'
import { Shield, AlertTriangle, Zap } from 'lucide-react'

const RISK_LEVELS = [
  {
    id: 'conservative',
    label: 'Conservative',
    icon: Shield,
    description: 'Maximum caution. Only use tools with the highest security ratings.',
    implications: [
      'Only "Approved" rated tools',
      'Enterprise tiers required for sensitive data',
      'Written approval for each new tool',
      'Regular compliance audits',
    ],
    color: 'text-mtm-navy',
    bgColor: 'bg-mtm-navy/5',
    borderColor: 'border-mtm-navy/30',
  },
  {
    id: 'balanced',
    label: 'Balanced',
    icon: AlertTriangle,
    description: 'Moderate approach balancing innovation with security.',
    implications: [
      '"Approved" or "Caution" rated tools',
      'Manager approval for new tools',
      'Data classification guidelines',
      'Quarterly policy reviews',
    ],
    color: 'text-mtm-primary',
    bgColor: 'bg-mtm-primary/5',
    borderColor: 'border-mtm-primary/30',
  },
  {
    id: 'progressive',
    label: 'Progressive',
    icon: Zap,
    description: 'Embrace innovation while maintaining basic safeguards.',
    implications: [
      'Most tools permitted with guidelines',
      'Self-service with training requirements',
      'Post-use reporting for sensitive data',
      'Annual policy updates',
    ],
    color: 'text-mtm-accent',
    bgColor: 'bg-mtm-accent/5',
    borderColor: 'border-mtm-accent/30',
  },
]

export default function RiskStep({ selected, onChange, context, onContextChange }) {
  return (
    <div>
      <h2 className="text-xl font-semibold text-mtm-navy mb-2">
        What's your organization's risk tolerance?
      </h2>
      <p className="text-gray-600 mb-6">
        This helps us calibrate the strictness of your AI policy recommendations.
      </p>

      <div className="space-y-4">
        {RISK_LEVELS.map((level) => {
          const Icon = level.icon
          const isSelected = selected === level.id

          return (
            <button
              key={level.id}
              onClick={() => onChange(level.id)}
              className={cn(
                'w-full text-left p-5 rounded-mtm-lg border-2 transition-all',
                isSelected
                  ? 'border-mtm-primary bg-mtm-primary/5'
                  : `${level.borderColor} ${level.bgColor}`,
                'hover:border-mtm-primary focus:outline-none focus:ring-2 focus:ring-mtm-primary/50'
              )}
            >
              <div className="flex items-start gap-4">
                <div
                  className={cn(
                    'flex-shrink-0 w-12 h-12 rounded-full flex items-center justify-center',
                    isSelected ? 'bg-mtm-primary text-white' : `${level.bgColor} ${level.color}`
                  )}
                >
                  <Icon className="w-6 h-6" />
                </div>
                <div className="flex-grow">
                  <h3 className="font-semibold text-gray-900 text-lg">{level.label}</h3>
                  <p className="text-gray-600 mb-3">{level.description}</p>
                  <ul className="grid grid-cols-1 sm:grid-cols-2 gap-1">
                    {level.implications.map((item, index) => (
                      <li key={index} className="text-sm text-gray-500 flex items-center gap-1">
                        <span className={cn('w-1.5 h-1.5 rounded-full', isSelected ? 'bg-mtm-primary' : 'bg-gray-400')} />
                        {item}
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
            </button>
          )
        })}
      </div>

      <div className="mt-6">
        <label className="block text-sm font-medium text-gray-700 mb-2">
          Additional context (optional)
        </label>
        <textarea
          value={context}
          onChange={(e) => onContextChange(e.target.value)}
          rows={3}
          className="block w-full px-3 py-2 border border-gray-300 rounded-mtm-md shadow-sm
                   placeholder:text-gray-400 focus:outline-none focus:ring-2
                   focus:ring-mtm-primary focus:border-transparent"
          placeholder="Any specific concerns, compliance requirements, or context we should consider?"
        />
      </div>

      {!selected && (
        <p className="mt-6 text-sm text-gray-500 text-center">
          Please select a risk tolerance level to continue.
        </p>
      )}
    </div>
  )
}
