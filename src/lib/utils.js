// Rating calculation - normalized to 0-100 scale
// Each criterion is scored 0-3, then weighted and normalized to 100
//
// Weights (reflecting importance to nonprofits):
//   Data Privacy: 2x weight (~18% of total)
//   Security: 2x weight (~18% of total)
//   Other 7 criteria: 1x weight each (~9% each, 64% total)
//
// Formula: (weighted_sum / max_weighted_sum) × 100
// Max weighted sum: (3×2) + (3×2) + (3×1×7) = 6 + 6 + 21 = 33
// Score = (weighted_sum / 33) × 100

export const CRITERIA_WEIGHTS = {
  data_privacy: 2,
  security: 2,
  tos: 1,
  accessibility: 1,
  pricing: 1,
  environmental: 1,
  ethical_training: 1,
  enterprise_controls: 1,
  sector_commitment: 1,
}

// Calculate max possible weighted score based on weights
export const MAX_WEIGHTED_SCORE = Object.values(CRITERIA_WEIGHTS).reduce((sum, weight) => sum + (3 * weight), 0) // = 33

export const RATING_THRESHOLDS = {
  recommended: { min: 75, max: 100, label: 'Recommended', color: 'rating-recommended' },
  caution: { min: 50, max: 74, label: 'Caution', color: 'rating-caution' },
  not_recommended: { min: 0, max: 49, label: 'Not Recommended', color: 'rating-not-recommended' },
  under_review: { min: null, max: null, label: 'Under Review', color: 'rating-under-review' },
}

export const calculateOverallScore = (evaluations) => {
  if (!evaluations || evaluations.length === 0) return null

  let weightedSum = 0
  let hasAllRequired = true

  Object.keys(CRITERIA_WEIGHTS).forEach(criteria => {
    const evaluation = evaluations.find(e => e.criteria_key === criteria)
    if (evaluation && evaluation.rating !== null) {
      weightedSum += evaluation.rating * CRITERIA_WEIGHTS[criteria]
    } else {
      hasAllRequired = false
    }
  })

  if (!hasAllRequired) return null

  // Normalize to 0-100 scale
  return Math.round((weightedSum / MAX_WEIGHTED_SCORE) * 100)
}

export const getRatingFromScore = (score) => {
  if (score === null) return RATING_THRESHOLDS.under_review
  if (score >= 75) return RATING_THRESHOLDS.recommended
  if (score >= 50) return RATING_THRESHOLDS.caution
  return RATING_THRESHOLDS.not_recommended
}

export const calculateWeightedScore = (scores) => {
  let weightedSum = 0
  Object.keys(CRITERIA_WEIGHTS).forEach(key => {
    const score = scores[key] ?? 0
    weightedSum += score * CRITERIA_WEIGHTS[key]
  })
  // Normalize to 0-100 scale
  return Math.round((weightedSum / MAX_WEIGHTED_SCORE) * 100)
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
  sector_commitment: 'Sector Commitment',
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
