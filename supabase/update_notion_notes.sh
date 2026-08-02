#!/bin/bash
# Update Notion AI evaluation notes

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

echo "=== NOTION AI PLUS ==="
TIER="99999999-9999-9999-9999-99999999999a"

patch_rating "$TIER" "data_privacy" \
  "Notion AI included in SOC 2 Type 2 scope. LLM providers (like OpenAI) vetted by security team. Data encrypted in transit (TLS 1.2+) and at rest. Note: As of May 2025, Notion AI features no longer available as add-on for Plus plan." \
  '["https://www.notion.com/help/notion-ai-security-practices", "https://www.notion.com/security"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type 2, ISO 27001 certified. Notion AI included in certification scope. Customer data hosted on AWS. Third-party subprocessors vetted annually with penetration tests and attestation reports reviewed." \
  '["https://www.notion.com/security", "https://www.notion.com/help/notion-ai-security-practices"]'

patch_rating "$TIER" "tos" \
  "Master Subscription Agreement and DPA available. GDPR, CCPA compliant. Terms regularly assessed by privacy experts. Standard liability limitations apply." \
  '["https://www.notion.com/help/privacy", "https://www.notion.com/help/security-and-privacy"]'

patch_rating "$TIER" "accessibility" \
  "Basic accessibility features. No VPAT or formal WCAG compliance statement published. Web and desktop apps with standard controls. Mobile apps available." \
  '["https://www.notion.com"]'

patch_rating "$TIER" "pricing" \
  "Plus plan at $10/user/month (annual). 50% nonprofit discount available for US 501(c)(3) organizations through TechSoup - up to 3 workspaces. Note: AI features now only included in Business/Enterprise plans since May 2025." \
  '["https://www.notion.com/pricing", "https://www.notion.com/nonprofits", "https://www.techsoup.org/notion"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. AWS infrastructure (AWS has renewable energy commitments). No specific carbon footprint data." \
  '["https://www.notion.com"]'

patch_rating "$TIER" "ethical_training" \
  "Notion AI Commitment to AI Safety published. Subprocessors contractually prohibited from training on customer data without permission. Vector databases SOC 2 certified." \
  '["https://www.notion.com/help/ai-safety", "https://www.notion.com/help/notion-ai-security-practices"]'

patch_rating "$TIER" "enterprise_controls" \
  "Basic team features. Admin dashboard available. No SAML SSO on Plus plan - requires Business tier. Limited audit capabilities. No SCIM provisioning." \
  '["https://www.notion.com/pricing"]'

echo ""
echo "=== NOTION AI BUSINESS ==="
TIER="99999999-9999-9999-9999-99999999999b"

patch_rating "$TIER" "data_privacy" \
  "Enterprise-grade data protection. Notion AI included in SOC 2 and ISO 27001 scope. LLM providers use zero data retention for Enterprise workspaces. Data encrypted throughout. HIPAA eligible with zero-retention APIs." \
  '["https://www.notion.com/help/notion-ai-security-practices", "https://www.notion.com/security"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type 2, ISO 27001, BSI C5 certified. SAML SSO available. Third-party model providers thoroughly vetted. Subprocessors monitored annually. HIPAA compliance supported." \
  '["https://www.notion.com/security", "https://www.notion.com/help/notion-ai-security-practices"]'

patch_rating "$TIER" "tos" \
  "Business terms with DPA. GDPR, CCPA compliant. Custom enterprise agreements available for large deployments. Enhanced liability terms over Plus plan." \
  '["https://www.notion.com/help/privacy", "https://www.notion.com/help/security-and-privacy"]'

patch_rating "$TIER" "accessibility" \
  "Basic accessibility features. No VPAT or formal WCAG compliance statement published. Web, desktop, and mobile apps with standard controls." \
  '["https://www.notion.com"]'

patch_rating "$TIER" "pricing" \
  "Business plan at $15/user/month (annual) - includes Notion AI. 50% nonprofit discount for US 501(c)(3) through TechSoup. Nonprofit pricing brings it to approximately $7.50/user/month." \
  '["https://www.notion.com/pricing", "https://www.notion.com/nonprofits", "https://www.techsoup.org/notion"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. AWS infrastructure (AWS has renewable energy commitments). No specific carbon footprint data." \
  '["https://www.notion.com"]'

patch_rating "$TIER" "ethical_training" \
  "Strong AI safety commitment. LLM providers use zero data retention for Enterprise. Embeddings stored in vetted, SOC 2 certified vector databases. No training on customer data without permission." \
  '["https://www.notion.com/help/ai-safety", "https://www.notion.com/help/notion-ai-security-practices"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full admin console. SAML SSO available. SCIM provisioning. Private teamspaces. Advanced permissions and audit log. PDF export and bulk export features." \
  '["https://www.notion.com/pricing", "https://www.notion.com/security"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 16 Notion AI evaluations"
