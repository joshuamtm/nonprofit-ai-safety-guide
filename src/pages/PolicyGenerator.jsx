import { Link } from 'react-router-dom'
import { ArrowLeft, FileText, Shield, AlertTriangle } from 'lucide-react'
import Wizard from '../components/policy-matrix/Wizard'
import Card from '../components/ui/Card'

export default function PolicyGenerator() {
  return (
    <div className="min-h-screen">
      <div className="bg-mtm-navy text-white py-12 relative overflow-hidden">
        <div className="absolute inset-0 opacity-[0.03]" style={{
          backgroundImage: 'radial-gradient(circle at 70% 50%, rgba(14,141,160,0.5) 0%, transparent 50%)'
        }} />
        <div className="container mx-auto px-4 relative">
          <Link to="/" className="inline-flex items-center text-sm text-white/50 hover:text-white mb-4 transition-colors">
            <ArrowLeft className="w-4 h-4 mr-1" />Back to Home
          </Link>
          <div className="flex items-center gap-4 mb-4">
            <div className="w-12 h-12 bg-white/10 rounded-mtm-lg flex items-center justify-center">
              <FileText className="w-6 h-6 text-white" />
            </div>
            <h1 className="font-display text-3xl font-semibold">AI Policy Matrix Generator</h1>
          </div>
          <p className="text-white/60 max-w-2xl leading-relaxed">
            Create a customized AI usage policy for your nonprofit based on your organization's
            data types, risk tolerance, and operational needs.
          </p>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        <div className="max-w-3xl mx-auto mb-12">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <Card className="bg-mtm-primary/5 border-mtm-primary/15">
              <div className="flex items-start gap-3">
                <Shield className="w-5 h-5 text-mtm-primary flex-shrink-0 mt-0.5" />
                <div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-1 text-sm">Nonprofit-Focused</h3>
                  <p className="text-sm text-mtm-soft-blue leading-relaxed">
                    Our policy templates address donor data, client confidentiality, and grant compliance.
                  </p>
                </div>
              </div>
            </Card>
            <Card className="bg-rating-caution-light border-rating-caution/15">
              <div className="flex items-start gap-3">
                <AlertTriangle className="w-5 h-5 text-rating-caution flex-shrink-0 mt-0.5" />
                <div>
                  <h3 className="font-display font-semibold text-mtm-navy mb-1 text-sm">Not Legal Advice</h3>
                  <p className="text-sm text-mtm-soft-blue leading-relaxed">
                    This provides a starting point. Please consult with legal counsel before implementation.
                  </p>
                </div>
              </div>
            </Card>
          </div>
        </div>
        <Wizard />
      </div>
    </div>
  )
}
