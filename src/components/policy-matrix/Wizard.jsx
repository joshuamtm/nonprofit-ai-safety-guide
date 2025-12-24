import { useState } from 'react'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import Button from '../ui/Button'
import DataTypeStep from './DataTypeStep'
import RiskStep from './RiskStep'
import ResultsStep from './ResultsStep'

const STEPS = [
  { id: 1, name: 'Data Types', description: 'What data will you be using?' },
  { id: 2, name: 'Risk Tolerance', description: 'Your organization\'s risk appetite' },
  { id: 3, name: 'Recommendations', description: 'Your personalized policy matrix' },
]

export default function Wizard() {
  const [currentStep, setCurrentStep] = useState(1)
  const [answers, setAnswers] = useState({
    dataTypes: [],
    riskLevel: null,
    additionalContext: '',
  })

  const updateAnswers = (key, value) => {
    setAnswers((prev) => ({ ...prev, [key]: value }))
  }

  const canProceed = () => {
    if (currentStep === 1) return answers.dataTypes.length > 0
    if (currentStep === 2) return answers.riskLevel !== null
    return true
  }

  const goNext = () => {
    if (currentStep < 3 && canProceed()) {
      setCurrentStep((prev) => prev + 1)
    }
  }

  const goBack = () => {
    if (currentStep > 1) {
      setCurrentStep((prev) => prev - 1)
    }
  }

  const restart = () => {
    setCurrentStep(1)
    setAnswers({
      dataTypes: [],
      riskLevel: null,
      additionalContext: '',
    })
  }

  return (
    <div className="max-w-3xl mx-auto">
      {/* Progress indicator */}
      <div className="mb-8">
        <div className="flex items-center justify-between">
          {STEPS.map((step, index) => (
            <div key={step.id} className="flex items-center flex-1">
              <div className="flex flex-col items-center">
                <div
                  className={`w-10 h-10 rounded-full flex items-center justify-center text-sm font-semibold ${
                    currentStep >= step.id
                      ? 'bg-mtm-primary text-white'
                      : 'bg-gray-200 text-gray-500'
                  }`}
                >
                  {step.id}
                </div>
                <div className="mt-2 text-center">
                  <p className="text-sm font-medium text-gray-900">{step.name}</p>
                  <p className="text-xs text-gray-500 hidden sm:block">{step.description}</p>
                </div>
              </div>
              {index < STEPS.length - 1 && (
                <div
                  className={`flex-1 h-1 mx-4 ${
                    currentStep > step.id ? 'bg-mtm-primary' : 'bg-gray-200'
                  }`}
                />
              )}
            </div>
          ))}
        </div>
      </div>

      {/* Step content */}
      <div className="bg-white rounded-mtm-lg shadow-mtm p-6 mb-6">
        {currentStep === 1 && (
          <DataTypeStep
            selected={answers.dataTypes}
            onChange={(value) => updateAnswers('dataTypes', value)}
          />
        )}
        {currentStep === 2 && (
          <RiskStep
            selected={answers.riskLevel}
            onChange={(value) => updateAnswers('riskLevel', value)}
            context={answers.additionalContext}
            onContextChange={(value) => updateAnswers('additionalContext', value)}
          />
        )}
        {currentStep === 3 && (
          <ResultsStep answers={answers} onRestart={restart} />
        )}
      </div>

      {/* Navigation */}
      {currentStep < 3 && (
        <div className="flex justify-between">
          <Button
            variant="outline"
            onClick={goBack}
            disabled={currentStep === 1}
          >
            <ChevronLeft className="w-4 h-4 mr-1" />
            Back
          </Button>
          <Button onClick={goNext} disabled={!canProceed()}>
            {currentStep === 2 ? 'Generate Policy' : 'Next'}
            <ChevronRight className="w-4 h-4 ml-1" />
          </Button>
        </div>
      )}

      {/* Disclaimer */}
      <p className="mt-8 text-xs text-gray-500 text-center">
        This tool provides general guidance only and does not constitute legal advice.
        Please consult with your legal team before implementing any AI policies.
      </p>
    </div>
  )
}
