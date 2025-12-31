#!/bin/bash
# Update Grammarly evaluation notes

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

echo "=== GRAMMARLY FREE ==="
TIER="77777777-7777-7777-7777-777777777778"

patch_rating "$TIER" "data_privacy" \
  "Free tier text may be used to improve Grammarly products and AI models. No opt-out available on free tier. Text processed on Grammarly servers. Personal data retained per privacy policy." \
  '["https://www.grammarly.com/privacy-policy", "https://www.grammarly.com/trust"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type 2, ISO 27001, ISO 27017, ISO 27018 certified. Encryption in transit (TLS 1.2+) and at rest (AES-256). No SSO on free tier. Basic account security only." \
  '["https://www.grammarly.com/trust", "https://www.grammarly.com/security"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply. Users retain ownership of content. Grammarly gets broad license to process and improve services. Standard limitation of liability." \
  '["https://www.grammarly.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Browser extensions and desktop apps support screen readers. Keyboard navigation available. VPAT published showing partial WCAG 2.1 AA conformance. Some accessibility gaps reported by users." \
  '["https://www.grammarly.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "Free tier with basic grammar and spelling checks. IMPORTANT: Grammarly discontinued nonprofit discount program in May 2024. No special pricing for nonprofits." \
  '["https://www.grammarly.com/plans", "https://www.reddit.com/r/grammarly/comments/1cr31bz/grammarly_has_ended_its_nonprofit_discount/"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure provider sustainability unknown." \
  '["https://www.grammarly.com"]'

patch_rating "$TIER" "ethical_training" \
  "Free tier data may be used for AI training. Limited transparency on training data sources. AI ethics principles not prominently published. Some generative AI features added with limited disclosure." \
  '["https://www.grammarly.com/privacy-policy"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. No team management. No SSO or organizational controls. Individual use only." \
  '["https://www.grammarly.com/plans"]'

echo ""
echo "=== GRAMMARLY PREMIUM ==="
TIER="77777777-7777-7777-7777-777777777779"

patch_rating "$TIER" "data_privacy" \
  "Premium individual accounts - text may still be used for improvement. Opt-out available in settings. No enterprise data protections. Better than free but not enterprise-grade." \
  '["https://www.grammarly.com/privacy-policy", "https://support.grammarly.com/hc/en-us/articles/360048805871"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type 2, ISO 27001/27017/27018 certified. Encryption in transit and at rest. MFA available. No SSO on individual Premium plan." \
  '["https://www.grammarly.com/trust", "https://www.grammarly.com/security"]'

patch_rating "$TIER" "tos" \
  "Consumer terms with liability cap. Users retain content ownership. Processing rights granted to Grammarly. Same fundamental terms as free tier." \
  '["https://www.grammarly.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Browser extensions and desktop apps support screen readers. Keyboard navigation available. VPAT published. Same accessibility features as free tier." \
  '["https://www.grammarly.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "\\$12/month (annual) or \\$30/month (monthly). IMPORTANT: Nonprofit discount program discontinued May 2024. No special pricing available for nonprofits." \
  '["https://www.grammarly.com/plans"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure provider sustainability unknown." \
  '["https://www.grammarly.com"]'

patch_rating "$TIER" "ethical_training" \
  "Data may be used for improvement with opt-out available. Limited transparency on AI training practices. Generative AI features added with limited ethics disclosure." \
  '["https://www.grammarly.com/privacy-policy", "https://support.grammarly.com/hc/en-us/articles/360048805871"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on individual Premium. No team management features. No SSO. Higher usage limits but no organizational controls." \
  '["https://www.grammarly.com/plans"]'

echo ""
echo "=== GRAMMARLY BUSINESS ==="
TIER="77777777-7777-7777-7777-77777777777a"

patch_rating "$TIER" "data_privacy" \
  "Enterprise customers can opt out of data being used for training. Text processed but not retained for improvement if opted out. DPA available. Admin controls over data handling." \
  '["https://www.grammarly.com/business/enterprise", "https://www.grammarly.com/trust"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type 2, ISO 27001/27017/27018 certified. SAML SSO supported. SCIM provisioning available. Encryption in transit and at rest. Admin security controls." \
  '["https://www.grammarly.com/trust", "https://www.grammarly.com/security", "https://www.grammarly.com/business/enterprise"]'

patch_rating "$TIER" "tos" \
  "Business terms with better protections than consumer ToS. DPA available for GDPR compliance. Custom enterprise agreements negotiable for large deployments." \
  '["https://www.grammarly.com/terms", "https://www.grammarly.com/business/enterprise"]'

patch_rating "$TIER" "accessibility" \
  "Browser extensions and desktop apps support screen readers. Keyboard navigation available. VPAT published. Enterprise accessibility reporting available." \
  '["https://www.grammarly.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "\\$15/member/month (annual). IMPORTANT: Nonprofit discount program was discontinued in May 2024. No special pricing currently available for nonprofits." \
  '["https://www.grammarly.com/business", "https://www.reddit.com/r/grammarly/comments/1cr31bz/grammarly_has_ended_its_nonprofit_discount/"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://www.grammarly.com"]'

patch_rating "$TIER" "ethical_training" \
  "Enterprise customers can opt out of data being used for AI training. Better than consumer tiers. Limited transparency on overall AI ethics practices. Training data sources not disclosed." \
  '["https://www.grammarly.com/trust", "https://www.grammarly.com/business/enterprise"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full admin console with team management. SAML SSO and SCIM provisioning. Role-based access controls. Usage analytics and reporting. Style guide enforcement." \
  '["https://www.grammarly.com/business/enterprise", "https://www.grammarly.com/business"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 24 Grammarly evaluations"
