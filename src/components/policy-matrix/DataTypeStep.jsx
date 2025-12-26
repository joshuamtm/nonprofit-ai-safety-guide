import { cn } from '../../lib/utils'
import { Check } from 'lucide-react'

const DATA_TYPES = [
  {
    id: 'donor_pii',
    label: 'Donor PII',
    description: 'Names, addresses, payment info, giving history',
    riskLevel: 'high',
  },
  {
    id: 'client_records',
    label: 'Client/Beneficiary Records',
    description: 'Case notes, service history, personal circumstances',
    riskLevel: 'high',
  },
  {
    id: 'employee_data',
    label: 'Employee Data',
    description: 'HR records, performance reviews, compensation',
    riskLevel: 'high',
  },
  {
    id: 'financial_data',
    label: 'Financial/Grant Data',
    description: 'Budgets, grant applications, financial reports',
    riskLevel: 'medium',
  },
  {
    id: 'program_data',
    label: 'Program Data',
    description: 'Outcomes, metrics, aggregated statistics',
    riskLevel: 'medium',
  },
  {
    id: 'marketing_content',
    label: 'Marketing Content',
    description: 'Social posts, newsletters, website copy',
    riskLevel: 'low',
  },
  {
    id: 'public_comms',
    label: 'Public Communications',
    description: 'Press releases, annual reports, public statements',
    riskLevel: 'low',
  },
  {
    id: 'internal_docs',
    label: 'Internal Documents',
    description: 'Meeting notes, strategic plans, board materials',
    riskLevel: 'medium',
  },
]

const getRiskColor = (level) => {
  switch (level) {
    case 'high':
      return 'border-rating-not-recommended/30 bg-rating-not-recommended/5'
    case 'medium':
      return 'border-rating-caution/30 bg-rating-caution/5'
    case 'low':
      return 'border-rating-recommended/30 bg-rating-recommended/5'
    default:
      return 'border-gray-200 bg-gray-50'
  }
}

const getRiskBadge = (level) => {
  switch (level) {
    case 'high':
      return 'bg-rating-not-recommended/10 text-rating-not-recommended'
    case 'medium':
      return 'bg-rating-caution/10 text-rating-caution'
    case 'low':
      return 'bg-rating-recommended/10 text-rating-recommended'
    default:
      return 'bg-gray-100 text-gray-600'
  }
}

export default function DataTypeStep({ selected = [], onChange }) {
  const toggleDataType = (id) => {
    if (selected.includes(id)) {
      onChange(selected.filter((item) => item !== id))
    } else {
      onChange([...selected, id])
    }
  }

  const highRiskSelected = selected.some(
    (id) => DATA_TYPES.find((dt) => dt.id === id)?.riskLevel === 'high'
  )

  return (
    <div>
      <h2 className="text-xl font-semibold text-mtm-navy mb-2">
        What types of data will your organization use with AI tools?
      </h2>
      <p className="text-gray-600 mb-6">
        Select all that apply. This helps us recommend appropriate security requirements.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
        {DATA_TYPES.map((dataType) => (
          <button
            key={dataType.id}
            onClick={() => toggleDataType(dataType.id)}
            className={cn(
              'text-left p-4 rounded-mtm-md border-2 transition-all',
              selected.includes(dataType.id)
                ? 'border-mtm-primary bg-mtm-primary/5'
                : getRiskColor(dataType.riskLevel),
              'hover:border-mtm-primary focus:outline-none focus:ring-2 focus:ring-mtm-primary/50'
            )}
          >
            <div className="flex items-start justify-between gap-2">
              <div className="flex-grow">
                <div className="flex items-center gap-2">
                  <span className="font-medium text-gray-900">{dataType.label}</span>
                  <span
                    className={cn(
                      'text-xs px-2 py-0.5 rounded-full capitalize',
                      getRiskBadge(dataType.riskLevel)
                    )}
                  >
                    {dataType.riskLevel} risk
                  </span>
                </div>
                <p className="text-sm text-gray-600 mt-1">{dataType.description}</p>
              </div>
              {selected.includes(dataType.id) && (
                <div className="flex-shrink-0 w-5 h-5 bg-mtm-primary rounded-full flex items-center justify-center">
                  <Check className="w-3 h-3 text-white" />
                </div>
              )}
            </div>
          </button>
        ))}
      </div>

      {highRiskSelected && (
        <div className="mt-6 p-4 bg-rating-caution/10 border border-rating-caution/30 rounded-mtm-md">
          <p className="text-sm text-gray-700">
            <strong>Note:</strong> You've selected high-risk data types. Your policy will include
            additional safeguards for tools handling sensitive information.
          </p>
        </div>
      )}

      {selected.length === 0 && (
        <p className="mt-6 text-sm text-gray-500 text-center">
          Please select at least one data type to continue.
        </p>
      )}
    </div>
  )
}
