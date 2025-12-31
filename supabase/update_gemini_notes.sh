#!/bin/bash
# Update Gemini evaluation notes

API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV2bHplcWh5YnNpaHpzdGVvYXllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2NjU3MjU3OSwiZXhwIjoyMDgyMTQ4NTc5fQ.1T3KzLsDC1ZPbO0PU4z0u6UG9Su3COzgWc9K7PjrZjs"
BASE_URL="https://evlzeqhybsihzsteoaye.supabase.co/rest/v1"

patch_rating() {
  local tier_id=$1
  local criteria=$2
  local notes=$3
  local urls=$4

  curl -s -X PATCH "$BASE_URL/evaluations?tool_tier_id=eq.$tier_id&criteria_key=eq.$criteria" \
    -H "apikey: $API_KEY" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -H "Prefer: return=minimal" \
    -d "{\"notes\": \"$notes\", \"evidence_urls\": $urls}"

  echo "Updated $criteria"
}

echo "=== GEMINI FREE ==="
TIER="44444444-4444-4444-4444-444444444445"

patch_rating "$TIER" "data_privacy" \
  "Free tier conversations may be reviewed by humans and used to improve Google products and AI models. Users should avoid entering confidential information. Activity controls allow some data management but no enterprise protections." \
  '["https://support.google.com/gemini/answer/13594961", "https://policies.google.com/privacy"]'

patch_rating "$TIER" "security" \
  "Google infrastructure security applies. No enterprise-specific controls on free tier. MFA available through Google account. No SSO or admin features." \
  '["https://workspace.google.com/learn-more/security/security-whitepaper/page-5/"]'

patch_rating "$TIER" "tos" \
  "Google consumer terms apply. Standard liability limitations. Users retain rights to inputs; Google retains broad license for improvement purposes on free tier." \
  '["https://policies.google.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Google products generally meet WCAG 2.1 AA standards. Screen reader compatible. Keyboard navigation supported. Accessibility features available through Google account settings." \
  '["https://www.google.com/accessibility/"]'

patch_rating "$TIER" "pricing" \
  "Free tier with usage limits. For nonprofits, Gemini app included free with Google Workspace for Nonprofits edition. Excellent value for organizations already using Google Workspace." \
  '["https://www.google.com/nonprofits/offerings/workspace/", "https://blog.google/outreach-initiatives/google-org/gemini-google-workspace-nonprofits/"]'

patch_rating "$TIER" "environmental" \
  "Google matches 100% electricity with renewables annually since 2017. 64% carbon-free energy across data centers. However, AI has driven 13% emissions increase in 2023. Net-zero by 2030 goal. No longer claiming carbon neutral." \
  '["https://sustainability.google/reports/google-2024-environmental-report/"]'

patch_rating "$TIER" "ethical_training" \
  "Free tier data may be used for model training. Some transparency on AI principles and safety practices. Training data sources not fully disclosed. Google AI Principles published." \
  '["https://ai.google/responsibility/principles/", "https://support.google.com/gemini/answer/13594961"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. No SSO or organizational controls. Individual Google account only. No audit logs or compliance features." \
  '["https://gemini.google.com"]'

echo ""
echo "=== GEMINI ADVANCED ==="
TIER="44444444-4444-4444-4444-444444444446"

patch_rating "$TIER" "data_privacy" \
  "Gemini Advanced (Google One AI Premium) conversations may still be used for improvement unless opted out. Better than free tier but not enterprise-grade. Activity controls available." \
  '["https://support.google.com/gemini/answer/13594961"]'

patch_rating "$TIER" "security" \
  "Google infrastructure security. Personal Google account security features including MFA. No enterprise SSO or admin controls on individual subscription." \
  '["https://workspace.google.com/learn-more/security/security-whitepaper/page-5/"]'

patch_rating "$TIER" "tos" \
  "Google One terms apply. Standard consumer liability limitations. More features than free tier but same fundamental terms structure." \
  '["https://policies.google.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Google products generally meet WCAG 2.1 AA standards. Screen reader compatible. Keyboard navigation supported. Same accessibility as free tier." \
  '["https://www.google.com/accessibility/"]'

patch_rating "$TIER" "pricing" \
  "\$19.99/month for Google One AI Premium including Gemini Advanced. No published nonprofit discount on individual subscriptions. Better value through Workspace for Nonprofits." \
  '["https://one.google.com/about/ai-premium"]'

patch_rating "$TIER" "environmental" \
  "Google matches 100% electricity with renewables annually since 2017. 64% carbon-free energy across data centers. AI has driven 13% emissions increase in 2023. Net-zero by 2030 goal." \
  '["https://sustainability.google/reports/google-2024-environmental-report/"]'

patch_rating "$TIER" "ethical_training" \
  "Data may be used for model improvement with opt-out available. Google AI Principles published. Some transparency on safety practices. Training data sources not fully disclosed." \
  '["https://ai.google/responsibility/principles/", "https://support.google.com/gemini/answer/13594961"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console. Individual subscription only. No SSO integration. No organizational controls or audit features. Not suitable for team deployment." \
  '["https://one.google.com/about/ai-premium"]'

echo ""
echo "=== GEMINI WORKSPACE ==="
TIER="44444444-4444-4444-4444-444444444447"

patch_rating "$TIER" "data_privacy" \
  "Enterprise-grade data protection. Submissions not used to train models and never reviewed by humans. Data stays within organization. DPA available. Zero data retention options for sensitive use cases." \
  '["https://support.google.com/a/answer/15706919", "https://workspace.google.com/blog/identity-and-security/gemini-workspace-apps-and-gemini-app-are-first-achieve-fedramp-high-authorization"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II, ISO 27001/17/18/27701, ISO 42001 certified. FedRAMP High authorized - first AI assistant to achieve this. SAML SSO, admin controls, audit logs. HIPAA compliant." \
  '["https://workspace.google.com/learn-more/security/security-whitepaper/page-5/", "https://workspaceupdates.googleblog.com/2024/10/gemini-for-workspace-fedramp-high-authorization.html"]'

patch_rating "$TIER" "tos" \
  "Google Workspace enterprise agreement with improved protections. DPA available. Data processing terms aligned with GDPR and other regulations. Custom terms negotiable." \
  '["https://workspace.google.com/terms/dpa_terms.html"]'

patch_rating "$TIER" "accessibility" \
  "Google products generally meet WCAG 2.1 AA standards. Screen reader compatible. Keyboard navigation supported. Enterprise accessibility features and admin controls." \
  '["https://www.google.com/accessibility/"]'

patch_rating "$TIER" "pricing" \
  "Exceptional nonprofit value. Free Workspace for Nonprofits includes Gemini app. 70-75% off Business/Enterprise plans (\$3-5/user/month). Gemini for Workspace add-on also heavily discounted." \
  '["https://www.google.com/nonprofits/workspace/compare/", "https://blog.google/outreach-initiatives/google-org/gemini-google-workspace-nonprofits/"]'

patch_rating "$TIER" "environmental" \
  "Google matches 100% electricity with renewables annually since 2017. 64% carbon-free energy across data centers. Net-zero by 2030 goal. Water stewardship program replenishing 1B+ gallons." \
  '["https://sustainability.google/reports/google-2024-environmental-report/"]'

patch_rating "$TIER" "ethical_training" \
  "Workspace data never used for model training without permission. Google AI Principles published. ISO 42001 AI management system certified. Strong governance and safety practices." \
  '["https://ai.google/responsibility/principles/", "https://support.google.com/a/answer/15706919"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full admin console integration. SAML SSO, SCIM provisioning. Granular access controls. Audit logs and compliance reporting. Can enable/disable AI features organization-wide or by group." \
  '["https://support.google.com/a/answer/14130944", "https://workspaceupdates.googleblog.com/2024/10/gemini-app-enterprise-data-protection-core-service-expansion.html"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 24 Gemini evaluations"
