#!/bin/bash
# Update Fathom evaluation notes

API_KEY="${SUPABASE_SERVICE_KEY:?Set SUPABASE_SERVICE_KEY in your environment before running this script}"
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

echo "=== FATHOM FREE ==="
TIER="dddddddd-dddd-dddd-dddd-dddddddddde1"

patch_rating "$TIER" "data_privacy" \
  "Fathom uses de-identified customer data to improve proprietary AI models. Users can opt out in settings. No AI sub-processors (Anthropic, OpenAI, Google) are permitted to use data for training. All data stored in US servers." \
  '["https://help.fathom.video/en/articles/296512", "https://www.fathom.ai/privacy"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. HIPAA compliant. GDPR compliant. Verified Zoom Apps Launch Partner with extensive security review. End-to-end encryption, continuous monitoring, regular third-party testing." \
  '["https://help.fathom.video/en/articles/296512", "https://trust.fathom.video"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply. Users can delete data anytime for complete erasure. DPA available for EU/UK users on request. Standard Contractual Clauses for international transfers." \
  '["https://www.fathom.ai/privacy", "https://www.fathom.ai/dpa"]'

patch_rating "$TIER" "accessibility" \
  "No specific accessibility statement or VPAT published. Web-based interface with standard controls. Transcription feature aids accessibility for hearing impaired. Limited information on screen reader support." \
  '["https://www.fathom.ai"]'

patch_rating "$TIER" "pricing" \
  "Exceptionally generous free tier - unlimited recordings, transcription, and storage with no time limits. AI summaries limited to 5/month on free plan. Fathom branding on outputs. No published nonprofit discount." \
  '["https://www.fathom.ai/pricing"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://www.fathom.ai"]'

patch_rating "$TIER" "ethical_training" \
  "Uses de-identified data for AI training with opt-out available. AI sub-processors contractually prohibited from using data for training. Better transparency than many competitors on AI data practices." \
  '["https://help.fathom.video/en/articles/296512", "https://www.fathom.ai/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. Individual use only. Basic integrations with Slack, Zapier, some CRM platforms but throttled. No SSO or team management." \
  '["https://www.fathom.ai/pricing"]'

echo ""
echo "=== FATHOM STANDARD ==="
TIER="dddddddd-dddd-dddd-dddd-dddddddddde2"

patch_rating "$TIER" "data_privacy" \
  "Same data practices as free tier. De-identified data used for AI improvement with opt-out. AI sub-processors prohibited from using data for training. All data stored in US." \
  '["https://help.fathom.video/en/articles/296512", "https://www.fathom.ai/privacy"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. HIPAA compliant. GDPR compliant. End-to-end encryption. Enhanced features over free tier but same security foundation." \
  '["https://help.fathom.video/en/articles/296512", "https://trust.fathom.video"]'

patch_rating "$TIER" "tos" \
  "Business terms apply. DPA available for GDPR compliance. Standard Contractual Clauses and Data Privacy Framework compliance for international transfers." \
  '["https://www.fathom.ai/privacy", "https://www.fathom.ai/dpa"]'

patch_rating "$TIER" "accessibility" \
  "No specific accessibility statement or VPAT published. Web-based interface with standard controls. Transcription aids accessibility. Same accessibility as free tier." \
  '["https://www.fathom.ai"]'

patch_rating "$TIER" "pricing" \
  "Approximately 24/user/month. 25%+ savings with annual plans. 14-day free trial available. No published nonprofit discount - contact sales to inquire." \
  '["https://www.fathom.ai/pricing"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://www.fathom.ai"]'

patch_rating "$TIER" "ethical_training" \
  "De-identified data used for AI training with opt-out. Organization admins can opt out all users. AI sub-processors prohibited from training on data. Good transparency." \
  '["https://help.fathom.video/en/articles/296512", "https://www.fathom.ai/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Team features including collaboration, folders, comments. Enhanced CRM sync with HubSpot and Salesforce. Admin controls available. No SSO mentioned." \
  '["https://www.fathom.ai/pricing"]'

echo ""
echo "=== FATHOM PRO ==="
TIER="dddddddd-dddd-dddd-dddd-dddddddddde3"

patch_rating "$TIER" "data_privacy" \
  "Organization-level opt-out from AI training available. AI sub-processors contractually prohibited from using data. GDPR compliant with DPA. All data stored in US servers." \
  '["https://help.fathom.video/en/articles/296512", "https://www.fathom.ai/privacy"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. HIPAA compliant. GDPR compliant with DPA. Enterprise security review passed by Zoom. End-to-end encryption and continuous monitoring." \
  '["https://help.fathom.video/en/articles/296512", "https://trust.fathom.video"]'

patch_rating "$TIER" "tos" \
  "Business/Enterprise terms with enhanced protections. DPA available. Custom agreements may be negotiable for large deployments. 90-day satisfaction guarantee." \
  '["https://www.fathom.ai/privacy", "https://www.fathom.ai/dpa"]'

patch_rating "$TIER" "accessibility" \
  "No specific accessibility statement or VPAT published. Web-based interface with standard controls. Transcription feature aids accessibility. Limited published information." \
  '["https://www.fathom.ai"]'

patch_rating "$TIER" "pricing" \
  "Approximately 29/user/month. Volume discounts for 25+ members. Annual billing saves 25%+. 90-day satisfaction guarantee. No published nonprofit discount." \
  '["https://www.fathom.ai/pricing"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://www.fathom.ai"]'

patch_rating "$TIER" "ethical_training" \
  "Organization-level opt-out from AI training via admin settings. AI sub-processors contractually prohibited from training. Better than many competitors on transparency and control." \
  '["https://help.fathom.video/en/articles/296512", "https://www.fathom.ai/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full team features with advanced collaboration. Native CRM integration. Organization-wide settings and opt-outs. Real-time coaching features. Admin controls for team management." \
  '["https://www.fathom.ai/pricing"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 24 Fathom evaluations"
