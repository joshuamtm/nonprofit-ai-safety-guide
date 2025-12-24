// Rating calculation based on PRD formula
// Overall = (DataPrivacy × 2) + (Security × 2) + ToS + Accessibility +
//           Pricing + Environmental + EthicalTraining + EnterpriseControls
// Maximum possible: 30 points

export const CRITERIA_WEIGHTS = {
  data_privacy: 2,
  security: 2,
  tos: 1,
  accessibility: 1,
  pricing: 1,
  environmental: 1,
  ethical_training: 1,
  enterprise_controls: 1,
}

export const RATING_THRESHOLDS = {
  approved: { min: 24, max: 30, label: 'Approved', color: 'rating-approved' },
  caution: { min: 16, max: 23, label: 'Caution', color: 'rating-caution' },
  not_recommended: { min: 0, max: 15, label: 'Not Recommended', color: 'rating-not-recommended' },
  under_review: { min: null, max: null, label: 'Under Review', color: 'rating-under-review' },
}

export const calculateOverallScore = (evaluations) => {
  if (!evaluations || evaluations.length === 0) return null

  let totalScore = 0
  let hasAllRequired = true

  Object.keys(CRITERIA_WEIGHTS).forEach(criteria => {
    const evaluation = evaluations.find(e => e.criteria_key === criteria)
    if (evaluation && evaluation.rating !== null) {
      totalScore += evaluation.rating * CRITERIA_WEIGHTS[criteria]
    } else {
      hasAllRequired = false
    }
  })

  return hasAllRequired ? totalScore : null
}

export const getRatingFromScore = (score) => {
  if (score === null) return RATING_THRESHOLDS.under_review
  if (score >= 24) return RATING_THRESHOLDS.approved
  if (score >= 16) return RATING_THRESHOLDS.caution
  return RATING_THRESHOLDS.not_recommended
}

export const calculateWeightedScore = (scores) => {
  let total = 0
  Object.keys(CRITERIA_WEIGHTS).forEach(key => {
    const score = scores[key] ?? 0
    total += score * CRITERIA_WEIGHTS[key]
  })
  return total
}

export const CATEGORIES = [
  { id: 'writing', label: 'Writing & Content', icon: 'PenLine' },
  { id: 'images', label: 'Image Generation', icon: 'Image' },
  { id: 'productivity', label: 'Productivity', icon: 'Zap' },
  { id: 'fundraising', label: 'Fundraising & Donor Management', icon: 'Heart' },
  { id: 'data', label: 'Data Analysis', icon: 'BarChart3' },
  { id: 'communication', label: 'Communication', icon: 'MessageSquare' },
  { id: 'research', label: 'Research', icon: 'Search' },
  { id: 'program', label: 'Program Delivery', icon: 'Users' },
]

export const CRITERIA_LABELS = {
  data_privacy: 'Data Privacy',
  security: 'Security Posture',
  tos: 'Terms of Service',
  accessibility: 'Accessibility',
  pricing: 'Nonprofit Pricing',
  environmental: 'Environmental Impact',
  ethical_training: 'Ethical Training Data',
  enterprise_controls: 'Enterprise Controls',
}

export const formatDate = (dateString) => {
  if (!dateString) return 'Unknown'
  return new Date(dateString).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  })
}

export const cn = (...classes) => {
  return classes.filter(Boolean).join(' ')
}
