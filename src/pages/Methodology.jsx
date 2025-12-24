import { Link } from 'react-router-dom'
import { ArrowRight, Shield, Lock, FileText, Accessibility, DollarSign, Leaf, Brain, Building2, Search, Users, BadgeCheck, AlertCircle, Handshake } from 'lucide-react'
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
  {
    key: 'sector_commitment',
    icon: Handshake,
    title: 'Sector Commitment',
    weight: CRITERIA_WEIGHTS.sector_commitment,
    description: 'The vendor\'s demonstrated, sustained commitment to serving the nonprofit sector—evaluated for authenticity and depth, not just marketing claims.',
    considerations: [
      'Track record length (5+ years indicates genuine commitment)',
      'TechSoup partnership and validation status',
      'Dedicated nonprofit teams with sector expertise',
      'NTEN/AFP/sector conference participation and sponsorship',
      'Timing of initiatives (pre-crisis vs. crisis-timed "grantwashing")',
      'Substantive vs. performative program design',
      'Nonprofit-specific product features and roadmap investment',
      'Published case studies with measurable nonprofit outcomes',
    ],
    scores: [
      { score: 3, label: 'Sector Leader: Transformational commitment with 5+ year track record, dedicated teams, deep TechSoup/NTEN integration, nonprofit-first features' },
      { score: 2, label: 'Committed Partner: Material investment with active programs, sector partnerships, and genuine (non-crisis-timed) engagement' },
      { score: 1, label: 'Aware but Limited: Performative or transactional engagement—generic discounts, crisis-timed announcements, limited sector expertise' },
      { score: 0, label: 'No Commitment: No nonprofit programs, discontinued support, or regressive policies that harm sector interests' },
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
              Each tool is evaluated across <strong>9 criteria</strong> and receives an overall score from <strong>0 to 100</strong>.
              Individual criteria are scored 0-3 (Poor, Fair, Good, Excellent), then weighted and normalized
              to produce a final score out of 100.
            </p>

            <div className="bg-gray-50 rounded-mtm-lg p-4 mb-6">
              <h4 className="text-sm font-semibold text-mtm-navy mb-3">Weighted Scoring System</h4>

              <p className="text-sm text-gray-600 mb-4">
                Not all criteria are weighted equally. <strong>Data Privacy</strong> and <strong>Security</strong> carry
                <strong> 2x weight</strong> due to their critical importance for nonprofits handling sensitive data.
              </p>

              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-gray-200">
                      <th className="text-left py-2 pr-4 font-semibold text-mtm-navy">Criterion</th>
                      <th className="text-center py-2 px-4 font-semibold text-mtm-navy">Weight</th>
                      <th className="text-center py-2 pl-4 font-semibold text-mtm-navy">% of Score</th>
                    </tr>
                  </thead>
                  <tbody className="text-gray-600">
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Data Privacy</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-mtm-navy/10 text-mtm-navy rounded text-xs font-medium">2x</span></td>
                      <td className="text-center py-2 pl-4">~18%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Security Posture</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-mtm-navy/10 text-mtm-navy rounded text-xs font-medium">2x</span></td>
                      <td className="text-center py-2 pl-4">~18%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Terms of Service</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Accessibility</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Nonprofit Pricing</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Environmental Impact</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Ethical Training Data</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                    <tr className="border-b border-gray-100">
                      <td className="py-2 pr-4">Enterprise Controls</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                    <tr>
                      <td className="py-2 pr-4">Sector Commitment</td>
                      <td className="text-center py-2 px-4"><span className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs">1x</span></td>
                      <td className="text-center py-2 pl-4">~9%</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div className="text-sm text-gray-600 mt-4 pt-3 border-t border-gray-200">
                <p><strong>How the score is calculated:</strong></p>
                <ol className="list-decimal ml-5 mt-2 space-y-1">
                  <li>Each criterion is scored 0-3 (Poor, Fair, Good, Excellent)</li>
                  <li>Scores are multiplied by their weight (2x for Privacy/Security, 1x for others)</li>
                  <li>Weighted scores are summed and normalized to a 0-100 scale</li>
                </ol>
                <p className="mt-3 font-mono text-xs bg-white p-2 rounded border border-gray-200">
                  Score = (Weighted Sum ÷ Max Possible) × 100
                </p>
              </div>
            </div>

            <div className="space-y-3">
              <div className="flex items-center gap-3">
                <span className="w-24 text-sm font-medium">75-100:</span>
                <span className="px-3 py-1 bg-rating-recommended text-white rounded-full text-sm font-medium">
                  Recommended
                </span>
              </div>
              <div className="flex items-center gap-3">
                <span className="w-24 text-sm font-medium">50-74:</span>
                <span className="px-3 py-1 bg-rating-caution text-white rounded-full text-sm font-medium">
                  Caution
                </span>
              </div>
              <div className="flex items-center gap-3">
                <span className="w-24 text-sm font-medium">0-49:</span>
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

        {/* How We Gather Information */}
        <section className="mt-16">
          <Card className="max-w-3xl mx-auto">
            <h2 className="text-2xl font-bold text-mtm-navy mb-4">
              How We Gather Information
            </h2>
            <p className="text-gray-600 mb-6">
              Our evaluations are based on manual research of publicly available documentation.
              We do not receive compensation from vendors—evaluations reflect our independent
              assessment at the time of review.
            </p>

            <div className="grid md:grid-cols-2 gap-6 mb-6">
              <div className="p-4 bg-gray-50 rounded-lg">
                <div className="flex items-center gap-2 mb-3">
                  <Search className="w-5 h-5 text-mtm-primary" />
                  <h3 className="font-semibold text-mtm-navy">Primary Sources</h3>
                </div>
                <ul className="space-y-2 text-sm text-gray-600">
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Official privacy policies and terms of service
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Security documentation and SOC 2 reports
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Pricing pages and nonprofit discount information
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Accessibility statements (VPAT, WCAG compliance)
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Environmental and sustainability reports
                  </li>
                </ul>
              </div>

              <div className="p-4 bg-gray-50 rounded-lg">
                <div className="flex items-center gap-2 mb-3">
                  <BadgeCheck className="w-5 h-5 text-mtm-primary" />
                  <h3 className="font-semibold text-mtm-navy">Third-Party Verification</h3>
                </div>
                <ul className="space-y-2 text-sm text-gray-600">
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    FedRAMP Marketplace authorization status
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Common Sense Media privacy ratings
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Mozilla Foundation reviews
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="w-1.5 h-1.5 bg-mtm-primary rounded-full mt-2 flex-shrink-0" />
                    Industry certification databases
                  </li>
                </ul>
              </div>
            </div>

            <div className="p-4 bg-mtm-primary/5 rounded-lg border border-mtm-primary/20">
              <div className="flex items-start gap-3">
                <AlertCircle className="w-5 h-5 text-mtm-primary flex-shrink-0 mt-0.5" />
                <div>
                  <p className="text-sm text-gray-700 mb-2">
                    <strong>Have updated information?</strong> AI tools change their policies frequently.
                    If you notice outdated or incorrect information in our evaluations, please let us know.
                  </p>
                  <Link
                    to="/request-review"
                    className="text-sm text-mtm-primary hover:text-mtm-navy font-medium"
                  >
                    Submit a correction →
                  </Link>
                </div>
              </div>
            </div>
          </Card>
        </section>

        {/* Grantwashing Detection */}
        <section className="mt-16">
          <Card className="max-w-3xl mx-auto">
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-rating-caution/10 rounded-lg flex items-center justify-center flex-shrink-0">
                <AlertCircle className="w-6 h-6 text-rating-caution" />
              </div>
              <div>
                <h2 className="text-2xl font-bold text-mtm-navy mb-2">
                  Grantwashing Detection Framework
                </h2>
                <p className="text-gray-600 mb-4">
                  "Grantwashing" describes performative nonprofit support designed primarily for PR value
                  rather than genuine sector investment. We evaluate Sector Commitment with these red flags in mind:
                </p>

                <div className="grid md:grid-cols-2 gap-4 mb-4">
                  <div className="p-3 bg-rating-not-recommended/5 border border-rating-not-recommended/20 rounded-lg">
                    <h4 className="text-sm font-semibold text-rating-not-recommended mb-2">🚩 Warning Signs</h4>
                    <ul className="text-sm text-gray-600 space-y-1">
                      <li>• Crisis-timed announcements (e.g., post-layoff goodwill)</li>
                      <li>• Generic discounts without sector expertise</li>
                      <li>• No dedicated nonprofit team or resources</li>
                      <li>• PR-heavy, substance-light programs</li>
                      <li>• Discontinued or scaled-back support history</li>
                    </ul>
                  </div>

                  <div className="p-3 bg-rating-recommended/5 border border-rating-recommended/20 rounded-lg">
                    <h4 className="text-sm font-semibold text-rating-recommended mb-2">✓ Authentic Indicators</h4>
                    <ul className="text-sm text-gray-600 space-y-1">
                      <li>• 5+ year consistent track record</li>
                      <li>• TechSoup partnership and validation</li>
                      <li>• Dedicated nonprofit teams with sector hires</li>
                      <li>• NTEN/sector conference presence pre-crisis</li>
                      <li>• Nonprofit-specific product features</li>
                    </ul>
                  </div>
                </div>

                <p className="text-sm text-gray-500">
                  Vendors like Microsoft (20+ years), Google (22+ years), and Canva (100% free tier) demonstrate
                  genuine sector commitment. Crisis-timed initiatives from other vendors warrant closer scrutiny.
                </p>
              </div>
            </div>
          </Card>
        </section>

        {/* Community */}
        <section className="mt-16">
          <Card className="max-w-3xl mx-auto">
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-mtm-accent/10 rounded-lg flex items-center justify-center flex-shrink-0">
                <Users className="w-6 h-6 text-mtm-accent" />
              </div>
              <div>
                <h2 className="text-2xl font-bold text-mtm-navy mb-2">
                  Community-Driven Updates
                </h2>
                <p className="text-gray-600 mb-4">
                  This directory is maintained by{' '}
                  <a
                    href="https://mtm.now"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-mtm-primary hover:text-mtm-navy"
                  >
                    Meet the Moment
                  </a>{' '}
                  with input from the nonprofit technology community. Members of{' '}
                  <a
                    href="https://mtm.now/mtm-together"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-mtm-primary hover:text-mtm-navy"
                  >
                    MTM Together
                  </a>
                  —our community for nonprofits navigating AI—help keep evaluations current and relevant.
                </p>
                <p className="text-sm text-gray-500">
                  Want to contribute? Join the community or submit tool requests through the directory.
                </p>
              </div>
            </div>
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
