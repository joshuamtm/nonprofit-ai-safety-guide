// Policy Generator for AI Tool Usage Policies
// Generates customized policy documents based on organization's data types and risk tolerance

const DATA_TYPE_LABELS = {
  donor_pii: 'Donor Personal Information',
  client_records: 'Client/Beneficiary Records',
  employee_data: 'Employee Data',
  financial_data: 'Financial/Grant Data',
  program_data: 'Program Data',
  marketing_content: 'Marketing Content',
  public_comms: 'Public Communications',
  internal_docs: 'Internal Documents',
}

const HIGH_RISK_DATA = ['donor_pii', 'client_records', 'employee_data']

export function generatePolicyDocument(answers) {
  const { dataTypes, riskLevel, additionalContext } = answers

  const hasHighRiskData = dataTypes.some(dt => HIGH_RISK_DATA.includes(dt))

  const sections = [
    generatePurposeSection(riskLevel),
    generateScopeSection(dataTypes),
    generateApprovalSection(riskLevel, hasHighRiskData),
    generateDataHandlingSection(dataTypes, riskLevel),
    generateAcceptableUseSection(riskLevel),
    generateProhibitedUsesSection(dataTypes),
    generateVendorRequirementsSection(riskLevel, hasHighRiskData),
    generateTrainingSection(riskLevel),
    generateIncidentResponseSection(),
    generateReviewSection(riskLevel),
  ]

  const plainText = sections
    .map(s => `${s.title}\n\n${s.content.join('\n\n')}`)
    .join('\n\n---\n\n')

  return { sections, plainText }
}

function generatePurposeSection(riskLevel) {
  const intro = {
    conservative: 'This policy establishes strict guidelines for the evaluation, approval, and use of artificial intelligence (AI) tools within our organization. Our primary objective is to protect sensitive data while thoughtfully exploring AI capabilities.',
    balanced: 'This policy provides a framework for the responsible use of artificial intelligence (AI) tools within our organization. We aim to balance innovation with appropriate safeguards to protect our stakeholders and mission.',
    progressive: 'This policy enables our organization to embrace AI innovation while maintaining appropriate safeguards. We believe AI tools can significantly enhance our mission impact when used responsibly.',
  }

  return {
    title: '1. Purpose',
    content: [
      intro[riskLevel] || intro.balanced,
      'This policy applies to all staff, contractors, volunteers, and partners who may use AI tools in connection with organizational work.',
    ],
  }
}

function generateScopeSection(dataTypes) {
  const typeLabels = dataTypes.map(dt => DATA_TYPE_LABELS[dt] || dt)

  return {
    title: '2. Scope',
    content: [
      'This policy covers the use of AI tools including but not limited to: large language models (ChatGPT, Claude, Gemini), image generators, transcription services, data analysis tools, and AI-powered productivity software.',
      `Based on organizational needs, this policy specifically addresses handling of: ${typeLabels.join(', ')}.`,
      'Both free and paid AI tools are subject to this policy, regardless of whether they are accessed through organizational or personal accounts for work purposes.',
    ],
  }
}

function generateApprovalSection(riskLevel, hasHighRiskData) {
  const approvalProcess = {
    conservative: [
      'All AI tools must be pre-approved before use through a formal review process.',
      'Approval requests must be submitted to the Technology Committee and include: tool name, vendor, intended use case, data types involved, and security documentation.',
      'Only tools rated "Approved" in the MTM Trusted AI Tools Directory may be considered.',
      'Each approval is valid for 12 months and must be renewed annually.',
    ],
    balanced: [
      'AI tools must be approved before use with organizational data.',
      'Tools rated "Approved" in the MTM Trusted AI Tools Directory may be used without additional approval for low-risk use cases.',
      'Tools rated "Caution" require manager approval and documented use guidelines.',
      'Tools rated "Not Recommended" are prohibited unless granted an exception by senior leadership.',
    ],
    progressive: [
      'Staff may use AI tools that appear in the MTM Trusted AI Tools Directory with ratings of "Approved" or "Caution".',
      'For tools not in the directory, submit a brief review request and you may proceed after acknowledgment.',
      'High-risk data use cases require manager notification before proceeding.',
      'The organization maintains a list of prohibited tools that may not be used under any circumstances.',
    ],
  }

  const content = approvalProcess[riskLevel] || approvalProcess.balanced

  if (hasHighRiskData && riskLevel !== 'conservative') {
    content.push('Exception: Any AI tool use involving donor PII, client records, or employee data requires explicit written approval regardless of the tool\'s general approval status.')
  }

  return {
    title: '3. Approval Process',
    content,
  }
}

function generateDataHandlingSection(dataTypes, riskLevel) {
  const content = [
    'Staff must understand what data is being shared with AI tools and how it may be processed, stored, or used for training.',
  ]

  if (dataTypes.some(dt => HIGH_RISK_DATA.includes(dt))) {
    content.push(
      'SENSITIVE DATA REQUIREMENTS:',
      '• Donor PII, client records, and employee data must NEVER be entered into AI tools unless using an enterprise tier with explicit data protection agreements.',
      '• Before using any sensitive data with AI, confirm the tool\'s data training policy explicitly states user data is not used for model training.',
      '• All sensitive data use must be logged and reported to the designated privacy officer.',
    )
  }

  content.push(
    'DATA CLASSIFICATION GUIDELINES:',
    '• Public data: May be used with any approved AI tool.',
    '• Internal data: May be used with approved tools that have clear privacy policies.',
    '• Confidential data: Requires enterprise-tier tools with data protection agreements.',
    '• Restricted data (PII, HIPAA, etc.): Requires explicit approval and enterprise security controls.',
  )

  if (riskLevel === 'conservative') {
    content.push('When in doubt about data classification, treat data as confidential and seek guidance before proceeding.')
  }

  return {
    title: '4. Data Handling Requirements',
    content,
  }
}

function generateAcceptableUseSection(riskLevel) {
  const uses = {
    conservative: [
      'APPROVED USE CASES (with appropriate tool approval):',
      '• Drafting and editing external communications',
      '• Summarizing public research and reports',
      '• Generating initial drafts of marketing content',
      '• Brainstorming and ideation sessions',
      '• Proofreading and grammar checking',
      'All AI-generated content must be reviewed and verified by a human before use.',
    ],
    balanced: [
      'ENCOURAGED USE CASES:',
      '• Content creation and editing assistance',
      '• Research summarization and synthesis',
      '• Meeting transcription and note-taking',
      '• Data analysis and visualization (with non-sensitive data)',
      '• Translation and accessibility improvements',
      '• Process automation for routine tasks',
      'Staff should use professional judgment and verify AI outputs before relying on them.',
    ],
    progressive: [
      'EMPOWERED USE CASES:',
      '• All content creation and editing workflows',
      '• Research and analysis tasks',
      '• Meeting and communication support',
      '• Program design and planning assistance',
      '• Donor communication personalization (with appropriate data protections)',
      '• Grant writing and reporting support',
      'Staff are encouraged to explore AI capabilities while maintaining appropriate oversight.',
    ],
  }

  return {
    title: '5. Acceptable Use',
    content: uses[riskLevel] || uses.balanced,
  }
}

function generateProhibitedUsesSection(dataTypes) {
  const content = [
    'The following uses of AI tools are PROHIBITED:',
    '• Making final decisions about individuals (hiring, services, benefits) based solely on AI output',
    '• Generating content that misrepresents the organization\'s positions or policies',
    '• Creating deepfakes or misleading media',
    '• Circumventing security controls or using personal accounts to avoid policy requirements',
    '• Sharing confidential strategic plans or unpublished financial information',
  ]

  if (dataTypes.includes('client_records')) {
    content.push('• Entering individual client case notes or service records into any AI tool without explicit approval and enterprise data protections')
  }

  if (dataTypes.includes('donor_pii')) {
    content.push('• Processing donor financial information or giving history through AI tools')
    content.push('• Using AI to make decisions about donor solicitation amounts or strategies without human review')
  }

  content.push('Violations of prohibited uses may result in disciplinary action.')

  return {
    title: '6. Prohibited Uses',
    content,
  }
}

function generateVendorRequirementsSection(riskLevel, hasHighRiskData) {
  const baseRequirements = {
    conservative: [
      'AI tool vendors must meet the following requirements:',
      '• SOC 2 Type II certification or equivalent',
      '• Clear data processing agreement with opt-out from training data use',
      '• Data residency in approved jurisdictions',
      '• Regular security audits and penetration testing',
      '• Incident response and notification procedures',
      'For tools handling sensitive data, FedRAMP authorization or equivalent is strongly preferred.',
    ],
    balanced: [
      'AI tool vendors should meet the following requirements:',
      '• Published privacy policy with clear data handling terms',
      '• Opt-out mechanism for training data use',
      '• Reasonable security practices',
      '• Data deletion capabilities upon request',
      'Enterprise tiers with enhanced security are required for sensitive data use cases.',
    ],
    progressive: [
      'AI tool vendors should provide:',
      '• Clear privacy policy',
      '• Opt-out option for training data use (required for confidential data)',
      '• Responsive support for data-related inquiries',
      'Higher security requirements apply for sensitive data use cases.',
    ],
  }

  const content = baseRequirements[riskLevel] || baseRequirements.balanced

  if (hasHighRiskData) {
    content.push('Given the sensitive data types in scope, preference should be given to vendors with nonprofit-specific data handling experience and compliance certifications.')
  }

  return {
    title: '7. Vendor Requirements',
    content,
  }
}

function generateTrainingSection(riskLevel) {
  const training = {
    conservative: [
      'All staff must complete AI awareness training before using any AI tools.',
      'Training covers: data classification, approved tools, prohibited uses, and incident reporting.',
      'Annual refresher training is required.',
      'New tools require tool-specific training before use is permitted.',
    ],
    balanced: [
      'Staff using AI tools should complete basic AI literacy training.',
      'Training covers: responsible AI use, data handling, and organizational policies.',
      'Department leads are responsible for ensuring team members understand relevant guidelines.',
      'Resources and guidance are available on the internal knowledge base.',
    ],
    progressive: [
      'AI literacy resources are available to all staff and are encouraged but not mandatory.',
      'Managers should ensure team members understand basic responsible AI principles.',
      'Peer learning and knowledge sharing about effective AI use is encouraged.',
    ],
  }

  return {
    title: '8. Training & Awareness',
    content: training[riskLevel] || training.balanced,
  }
}

function generateIncidentResponseSection() {
  return {
    title: '9. Incident Response',
    content: [
      'If you believe sensitive data has been inappropriately shared with an AI tool, or if you discover an AI-related security issue:',
      '1. Stop using the tool immediately',
      '2. Document what data was shared and with which tool',
      '3. Report the incident to your supervisor and IT/security team within 24 hours',
      '4. Do not attempt to "fix" the issue by deleting conversations or accounts',
      'Prompt reporting helps protect the organization and is expected of all staff.',
    ],
  }
}

function generateReviewSection(riskLevel) {
  const frequency = {
    conservative: 'quarterly',
    balanced: 'semi-annually',
    progressive: 'annually',
  }

  return {
    title: '10. Policy Review',
    content: [
      `This policy will be reviewed ${frequency[riskLevel] || 'annually'} and updated as needed to reflect changes in AI technology, organizational needs, and regulatory requirements.`,
      'Feedback on this policy can be submitted to the Technology Committee at any time.',
      'Material changes will be communicated to all staff with appropriate transition periods for compliance.',
    ],
  }
}
