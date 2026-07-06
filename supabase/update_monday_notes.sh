#!/bin/bash
# Update Monday.com evaluation notes

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

echo "=== MONDAY.COM FREE ==="
TIER="ffffffff-ffff-ffff-ffff-fffffffffff1"

patch_rating "$TIER" "data_privacy" \
  "Free tier users subject to standard consumer privacy terms. Monday.com acts as data controller. Limited data protection controls compared to paid tiers. GDPR and CCPA frameworks applied." \
  '["https://monday.com/trustcenter", "https://monday.com/trustcenter/faqs"]'

patch_rating "$TIER" "security" \
  "Infrastructure secured with AES-256 encryption at rest and TLS 1.2+ in transit. Basic security features. No enterprise controls on free tier. Annual security training for all employees." \
  '["https://monday.com/trustcenter", "https://support.monday.com/hc/en-us/articles/31119344104082"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply. Monday.com acts as data controller for user data. Standard limitation of liability. Users retain content ownership but grant broad processing rights." \
  '["https://monday.com/trustcenter"]'

patch_rating "$TIER" "accessibility" \
  "Basic accessibility features available. No VPAT or formal WCAG compliance statement published. Web-based interface with standard controls." \
  '["https://monday.com"]'

patch_rating "$TIER" "pricing" \
  "Free tier available with limited features for up to 2 seats. Excellent nonprofit program: 10 free Pro seats plus 70% discount on additional seats through TechSoup partnership." \
  '["https://monday.com/pricing", "https://support.monday.com/hc/en-us/articles/115005321269"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://monday.com"]'

patch_rating "$TIER" "ethical_training" \
  "AI features available on higher tiers. Limited transparency on AI training practices for free tier users. Privacy policy covers data use for service improvement." \
  '["https://monday.com/trustcenter"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. Limited to 2 seats. No SSO, audit logs, or organizational controls. Individual use only." \
  '["https://monday.com/pricing"]'

echo ""
echo "=== MONDAY.COM STANDARD ==="
TIER="ffffffff-ffff-ffff-ffff-fffffffffff2"

patch_rating "$TIER" "data_privacy" \
  "GDPR and CCPA compliant. DPA available. Data processed according to privacy policy. Standard data protection but not enterprise-grade controls." \
  '["https://monday.com/trustcenter", "https://monday.com/trustcenter/faqs"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II, ISO 27001/27017/27018/27032/27701 certified. AES-256 encryption at rest, TLS 1.2+ in transit. Basic team security features." \
  '["https://monday.com/trustcenter", "https://monday.com/terms/soc2"]'

patch_rating "$TIER" "tos" \
  "Business terms apply. DPA available for data processing. Standard liability terms. Better protections than free tier." \
  '["https://monday.com/trustcenter"]'

patch_rating "$TIER" "accessibility" \
  "Basic accessibility features available. No VPAT or formal WCAG compliance statement published. Web-based interface with standard controls." \
  '["https://monday.com"]'

patch_rating "$TIER" "pricing" \
  "Starts at $9/seat/month (annual). Excellent nonprofit program: 10 free Pro seats plus 70% discount on additional seats. Multi-product access since March 2024." \
  '["https://monday.com/pricing", "https://support.monday.com/hc/en-us/articles/115005321269"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://monday.com"]'

patch_rating "$TIER" "ethical_training" \
  "AI features available. Limited transparency on AI training practices. Data may be used for service improvement per privacy policy." \
  '["https://monday.com/trustcenter"]'

patch_rating "$TIER" "enterprise_controls" \
  "Basic admin features. No SSO on Standard tier. Limited audit capabilities. Team management available but not enterprise-grade." \
  '["https://monday.com/pricing"]'

echo ""
echo "=== MONDAY.COM PRO ==="
TIER="ffffffff-ffff-ffff-ffff-fffffffffff3"

patch_rating "$TIER" "data_privacy" \
  "GDPR and CCPA compliant. DPA available. Enhanced data handling controls. Data processed within compliance frameworks." \
  '["https://monday.com/trustcenter", "https://monday.com/trustcenter/faqs"]'

patch_rating "$TIER" "security" \
  "SOC 1 Type II, SOC 2 Type II, SOC 3, ISO 27001/27017/27018/27032/27701, HIPAA certified. AES-256 encryption. Enhanced security features." \
  '["https://monday.com/trustcenter", "https://monday.com/trustcenter/iso", "https://monday.com/terms/soc2"]'

patch_rating "$TIER" "tos" \
  "Business terms with DPA. Enhanced protections over Standard tier. Custom terms may be negotiable for larger deployments." \
  '["https://monday.com/trustcenter"]'

patch_rating "$TIER" "accessibility" \
  "Basic accessibility features available. No VPAT or formal WCAG compliance statement published. Web-based interface with standard controls." \
  '["https://monday.com"]'

patch_rating "$TIER" "pricing" \
  "Starts at $16/seat/month (annual). Nonprofits get 10 FREE Pro seats plus 70% off additional seats through TechSoup. Exceptional value for nonprofits." \
  '["https://monday.com/pricing", "https://support.monday.com/hc/en-us/articles/115005321269", "https://www.techsoup.org/monday"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://monday.com"]'

patch_rating "$TIER" "ethical_training" \
  "AI features included. Limited transparency on training practices. Monday code (app hosting) now SOC 2 and ISO 27001 certified as of January 2025." \
  '["https://monday.com/trustcenter", "https://community.monday.com/t/4-big-updates-to-enhance-app-security-and-compliance-on-monday-code/107529"]'

patch_rating "$TIER" "enterprise_controls" \
  "Enhanced admin features. Chart view, time tracking, formula columns. Better team management than Standard. No SSO - requires Enterprise tier." \
  '["https://monday.com/pricing"]'

echo ""
echo "=== MONDAY.COM ENTERPRISE ==="
TIER="ffffffff-ffff-ffff-ffff-fffffffffff4"

patch_rating "$TIER" "data_privacy" \
  "Enterprise-grade data protection. GDPR, CCPA, HIPAA compliant. DPA with comprehensive terms. Zero data retention options available. Data isolation features." \
  '["https://monday.com/trustcenter", "https://monday.com/trustcenter/faqs"]'

patch_rating "$TIER" "security" \
  "Full compliance suite: SOC 1/2/3 Type II, ISO 27001/27017/27018/27032/27701, HIPAA. Guardian add-on available for BYOK, TLE, DLP. SAML SSO with multiple IdPs." \
  '["https://monday.com/trustcenter", "https://monday.com/trustcenter/iso", "https://tollanis.com/blog/monday-for-enterprises"]'

patch_rating "$TIER" "tos" \
  "Enterprise agreement with custom terms available. DPA with enhanced protections. Negotiable terms for large deployments. Better liability provisions." \
  '["https://monday.com/trustcenter"]'

patch_rating "$TIER" "accessibility" \
  "Basic accessibility features available. No VPAT or formal WCAG compliance statement published. Web-based interface with standard controls." \
  '["https://monday.com"]'

patch_rating "$TIER" "pricing" \
  "Custom pricing. Nonprofits get 10 free Pro seats with 70% discount on additional, or can upgrade to Enterprise at 33% discount. Contact sales for nonprofit Enterprise pricing." \
  '["https://monday.com/pricing", "https://support.monday.com/hc/en-us/articles/115005321269"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. No carbon footprint data available. Cloud infrastructure sustainability not disclosed." \
  '["https://monday.com"]'

patch_rating "$TIER" "ethical_training" \
  "AI features with enterprise controls. Annual risk assessment as part of ISO 27001. Security Forum governance includes R&D, Legal, Operations oversight." \
  '["https://monday.com/trustcenter", "https://support.monday.com/hc/en-us/articles/360000769869"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full admin console. SAML SSO, SCIM provisioning. Guardian add-on for BYOK, tenant-level encryption, DLP. Audit logs, compliance reporting, advanced permissions." \
  '["https://monday.com/trustcenter", "https://tollanis.com/blog/monday-for-enterprises"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 32 Monday.com evaluations"
