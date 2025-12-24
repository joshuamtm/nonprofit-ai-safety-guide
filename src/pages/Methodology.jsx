import { Link } from 'react-router-dom'
import { ArrowRight, Shield, Lock, FileText, Accessibility, DollarSign, Leaf, Brain, Building2 } from 'lucide-react'
import Card from '../components/ui/Card'
import Button from '../components/ui/Button'
import { CRITERIA_WEIGHTS } from '../lib/utils'

const CRITERIA = [
  {
    key: 'data_privacy',
    icon: Shield,
    title: 'Data Privacy',
    weight: CRITERIA_WEIGHTS.data_privacy,
    description: 'How the tool handles, stores, and protects user data.',
    considerations: [
      'Data retention policies and deletion options',
      'Whether data is used to train AI models',
      'Opt-out mechanisms for data collection',
      'Data sharing with third parties',
      'Compliance with privacy regulations (GDPR, CCPA)',
    ],
    scores: [
      { score: 3, label: 'Excellent: No data retention, clear opt-out, no training use' },
      { score: 2, label: 'Good: Short retention, opt-out available, limited training' },
      { score: 1, label: 'Fair: Moderate concerns, partial transparency' },
      { score: 0, label: 'Poor: Long retention, no opt-out, unclear policies' },
    ],
  },
  {
    key: 'security',
    icon: Lock,
    title: 'Security Posture',
    weight: CRITERIA_WEIGHTS.security,
    description: 'The tool\'s security certifications and infrastructure.',
    considerations: [
      'SOC 2 Type II certification',
      'Encryption at rest and in transit',
      'Access controls and authentication',
      'Security audit history',
      'Incident response procedures',
    ],
    scores: [
      { score: 3, label: 'Excellent: SOC 2 certified, enterprise-grade security' },
      { score: 2, label: 'Good: Strong security practices, audited' },
      { score: 1, label: 'Fair: Basic security measures in place' },
      { score: 0, label: 'Poor: Security concerns or unknown practices' },
    ],
  },
  {
    key: 'tos',
    icon: FileText,
    title: 'Terms of Service',
    weight: CRITERIA_WEIGHTS.tos,
    description: 'Fairness and clarity of the tool\'s terms of service.',
    considerations: [
      'Intellectual property rights over generated content',
      'Liability and indemnification clauses',
      'Service level agreements',
      'Data ownership clarity',
      'Termination and data portability',
    ],
    scores: [
      { score: 3, label: 'Excellent: User-friendly terms, clear data rights' },
      { score: 2, label: 'Good: Reasonable terms with minor concerns' },
      { score: 1, label: 'Fair: Some problematic clauses' },
      { score: 0, label: 'Poor: Overreaching or unclear terms' },
    ],
  },
  {
    key: 'accessibility',
    icon: Accessibility,
    title: 'Accessibility',
    weight: CRITERIA_WEIGHTS.accessibility,
    description: 'The tool\'s accessibility features and compliance.',
    considerations: [
      'WCAG 2.1 compliance level',
      'Screen reader compatibility',
      'Keyboard navigation support',
      'Alternative text for generated content',
      'Customization options for users with disabilities',
    ],
    scores: [
      { score: 3, label: 'Excellent: WCAG 2.1 AA compliant or better' },
      { score: 2, label: 'Good: Most accessibility needs met' },
      { score: 1, label: 'Fair: Basic accessibility features' },
      { score: 0, label: 'Poor: Significant accessibility barriers' },
    ],
  },
  {
    key: 'pricing',
    icon: DollarSign,
    title: 'Nonprofit Pricing',
    weight: CRITERIA_WEIGHTS.pricing,
    description: 'Availability of nonprofit discounts and pricing fairness.',
    considerations: [
      'Nonprofit discount availability',
      'Free tier functionality',
      'Pricing transparency',
      'No hidden fees',
      'Flexible payment terms',
    ],
    scores: [
      { score: 3, label: 'Excellent: 50%+ nonprofit discount or generous free tier' },
      { score: 2, label: 'Good: Meaningful nonprofit discount available' },
      { score: 1, label: 'Fair: Minor discount or reasonable pricing' },
      { score: 0, label: 'Poor: No nonprofit pricing, expensive' },
    ],
  },
  {
    key: 'environmental',
    icon: Leaf,
    title: 'Environmental Impact',
    weight: CRITERIA_WEIGHTS.environmental,
    description: 'The tool\'s environmental footprint and sustainability practices.',
    considerations: [
      'Carbon offset or neutrality commitments',
      'Renewable energy usage for data centers',
      'Model efficiency improvements',
      'Environmental transparency reporting',
    ],
    scores: [
      { score: 3, label: 'Excellent: Carbon neutral, renewable energy' },
      { score: 2, label: 'Good: Active sustainability initiatives' },
      { score: 1, label: 'Fair: Some environmental awareness' },
      { score: 0, label: 'Poor: No environmental consideration' },
    ],
  },
  {
    key: 'ethical_training',
    icon: Brain,
    title: 'Ethical Training Data',
    weight: CRITERIA_WEIGHTS.ethical_training,
    description: 'Transparency and ethics around AI model training data.',
    considerations: [
      'Training data source transparency',
      'Consent and licensing for training data',
      'Bias detection and mitigation efforts',
      'Content filtering and safety measures',
    ],
    scores: [
      { score: 3, label: 'Excellent: Transparent, ethical data sourcing' },
      { score: 2, label: 'Good: Reasonable transparency, bias mitigation' },
      { score: 1, label: 'Fair: Limited information, some concerns' },
      { score: 0, label: 'Poor: No transparency, known issues' },
    ],
  },
  {
    key: 'enterprise_controls',
    icon: Building2,
    title: 'Enterprise Controls',
    weight: CRITERIA_WEIGHTS.enterprise_controls,
    description: 'Administrative controls for organizational use.',
    considerations: [
      'Admin console and user management',
      'SSO and identity provider integration',
      'Usage analytics and reporting',
      'Content policies and filtering',
      'API access and integrations',
    ],
    scores: [
      { score: 3, label: 'Excellent: Full enterprise admin features' },
      { score: 2, label: 'Good: Core admin features available' },
      { score: 1, label: 'Fair: Limited organizational controls' },
      { score: 0, label: 'Poor: No admin or enterprise features' },
    ],
  },
]

export default function Methodology() {
  return (
    <div className="bg-gray-50 min-h-screen">
      {/* Hero */}
      <div className="bg-mtm-navy text-white py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl">
            <h1 className="text-4xl font-bold mb-4">Our Evaluation Methodology</h1>
            <p className="text-xl text-white/80">
              We evaluate AI tools using a comprehensive rubric designed specifically for
              nonprofit organizations. Here's how we determine our ratings.
            </p>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        {/* Scoring Overview */}
        <section className="mb-16">
          <Card className="max-w-3xl mx-auto">
            <h2 className="text-2xl font-bold text-mtm-navy mb-4">How We Score</h2>
            <p className="text-gray-600 mb-6">
              Each tool is evaluated across 8 criteria. Each criterion receives a score from 0-3.
              Data Privacy and Security are weighted 2x due to their critical importance for
              nonprofits handling sensitive data.
            </p>

            <div className="bg-gray-50 rounded-mtm-lg p-4 mb-6">
              <p className="font-mono text-sm text-gray-700">
                Overall Score = (Data Privacy × 2) + (Security × 2) + ToS + Accessibility +
                Pricing + Environmental + Ethical Training + Enterprise Controls
              </p>
              <p className="text-sm text-gray-500 mt-2">Maximum possible score: 30 points</p>
            </div>

            <div className="space-y-3">
              <div className="flex items-center gap-3">
                <span className="w-28 text-sm font-medium">24-30 points:</span>
                <span className="px-3 py-1 bg-rating-approved text-white rounded-full text-sm font-medium">
                  Approved
                </span>
              </div>
              <div className="flex items-center gap-3">
                <span className="w-28 text-sm font-medium">16-23 points:</span>
                <span className="px-3 py-1 bg-rating-caution text-white rounded-full text-sm font-medium">
                  Caution
                </span>
              </div>
              <div className="flex items-center gap-3">
                <span className="w-28 text-sm font-medium">0-15 points:</span>
                <span className="px-3 py-1 bg-rating-not-recommended text-white rounded-full text-sm font-medium">
                  Not Recommended
                </span>
              </div>
            </div>
          </Card>
        </section>

        {/* Criteria Details */}
        <section>
          <h2 className="text-2xl font-bold text-mtm-navy mb-8 text-center">
            Evaluation Criteria
          </h2>

          <div className="space-y-8 max-w-4xl mx-auto">
            {CRITERIA.map((criterion) => {
              const Icon = criterion.icon
              return (
                <Card key={criterion.key}>
                  <div className="flex items-start gap-4">
                    <div className="flex-shrink-0 w-12 h-12 bg-mtm-primary/10 rounded-lg flex items-center justify-center">
                      <Icon className="w-6 h-6 text-mtm-primary" />
                    </div>
                    <div className="flex-grow">
                      <div className="flex items-center gap-3 mb-2">
                        <h3 className="text-xl font-semibold text-mtm-navy">
                          {criterion.title}
                        </h3>
                        {criterion.weight > 1 && (
                          <span className="px-2 py-0.5 bg-mtm-navy/10 text-mtm-navy text-xs rounded-full font-medium">
                            {criterion.weight}x weight
                          </span>
                        )}
                      </div>
                      <p className="text-gray-600 mb-4">{criterion.description}</p>

                      <div className="grid md:grid-cols-2 gap-6">
                        <div>
                          <h4 className="text-sm font-medium text-gray-900 mb-2">
                            What We Consider
                          </h4>
                          <ul className="space-y-1">
                            {criterion.considerations.map((item, index) => (
                              <li
                                key={index}
                                className="text-sm text-gray-600 flex items-start gap-2"
                              >
                                <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                                {item}
                              </li>
                            ))}
                          </ul>
                        </div>

                        <div>
                          <h4 className="text-sm font-medium text-gray-900 mb-2">
                            Scoring Guide
                          </h4>
                          <div className="space-y-2">
                            {criterion.scores.map((item) => (
                              <div key={item.score} className="flex items-start gap-2">
                                <span className="flex-shrink-0 w-6 h-6 bg-gray-100 rounded-full flex items-center justify-center text-sm font-medium text-gray-700">
                                  {item.score}
                                </span>
                                <span className="text-sm text-gray-600">{item.label}</span>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </Card>
              )
            })}
          </div>
        </section>

        {/* Tier Distinctions */}
        <section className="mt-16">
          <Card className="max-w-3xl mx-auto">
            <h2 className="text-2xl font-bold text-mtm-navy mb-4">
              Why We Evaluate by Tier
            </h2>
            <p className="text-gray-600 mb-6">
              Many AI tools offer different pricing tiers (Free, Pro, Enterprise) with significantly
              different data handling practices. We evaluate each tier separately because:
            </p>
            <ul className="space-y-3">
              <li className="flex items-start gap-3">
                <span className="w-6 h-6 bg-mtm-primary/10 rounded-full flex items-center justify-center text-sm font-medium text-mtm-primary flex-shrink-0">
                  1
                </span>
                <span className="text-gray-600">
                  <strong>Data training policies differ:</strong> Free tiers often use data for
                  training while enterprise tiers may offer opt-out.
                </span>
              </li>
              <li className="flex items-start gap-3">
                <span className="w-6 h-6 bg-mtm-primary/10 rounded-full flex items-center justify-center text-sm font-medium text-mtm-primary flex-shrink-0">
                  2
                </span>
                <span className="text-gray-600">
                  <strong>Security features vary:</strong> Enterprise tiers typically offer SSO,
                  SOC 2 compliance, and admin controls not available in free versions.
                </span>
              </li>
              <li className="flex items-start gap-3">
                <span className="w-6 h-6 bg-mtm-primary/10 rounded-full flex items-center justify-center text-sm font-medium text-mtm-primary flex-shrink-0">
                  3
                </span>
                <span className="text-gray-600">
                  <strong>Contract protections differ:</strong> Enterprise agreements often include
                  additional liability protections and data processing agreements.
                </span>
              </li>
            </ul>
          </Card>
        </section>

        {/* CTA */}
        <section className="mt-16 text-center">
          <h2 className="text-2xl font-bold text-mtm-navy mb-4">Ready to Explore?</h2>
          <p className="text-gray-600 mb-6 max-w-xl mx-auto">
            Browse our directory to see how specific AI tools score against these criteria.
          </p>
          <Link to="/directory">
            <Button>
              Browse Tool Directory
              <ArrowRight className="w-4 h-4 ml-2" />
            </Button>
          </Link>
        </section>
      </div>
    </div>
  )
}
