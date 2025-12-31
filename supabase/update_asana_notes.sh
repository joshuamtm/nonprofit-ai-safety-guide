#!/bin/bash
# Update Asana evaluation notes
# Run with: bash update_asana_notes.sh

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

  echo "Updated $tier_id - $criteria"
}

echo "=== ASANA BASIC (Free) ==="
TIER="eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1"

patch_rating "$TIER" "data_privacy" \
  "Free tier data is subject to AI processing for Asana AI features using metadata. Users cannot disable AI features without admin console (not available on free tier). Privacy policy applies equally across tiers but free users have limited control options." \
  '["https://asana.com/privacy", "https://asana.com/terms"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified across all tiers. Multi-factor authentication available. However, no SSO options and no admin console on free tier limits organizational security controls." \
  '["https://asana.com/pricing", "https://trustcenter.asana.com"]'

patch_rating "$TIER" "tos" \
  "Standard consumer terms apply. \$100 aggregate liability cap regardless of damages. Users retain content ownership but grant Asana broad usage license. Asana can terminate access unilaterally." \
  '["https://asana.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features." \
  '["https://asana.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "Personal tier is free forever with core task management features. Excellent option for small nonprofits getting started with project management." \
  '["https://asana.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards." \
  '["https://asana.com/inside-asana/fy25-asana-esg-report", "https://asana.com/inside-asana/asana-carbon-offsets"]'

patch_rating "$TIER" "ethical_training" \
  "Asana AI features use metadata from workspaces. AI Partner-powered features may use task titles and descriptions. Users can opt out but require admin console access (not available on free tier). Some transparency on data usage in privacy policy." \
  '["https://asana.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. No SSO options. No organizational controls or user management. Limited to individual use or informal team coordination." \
  '["https://asana.com/pricing"]'

echo ""
echo "=== ASANA PREMIUM (Starter) ==="
TIER="eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2"

patch_rating "$TIER" "data_privacy" \
  "Admin console allows disabling AI features. Data processing follows standard privacy policy. Improved control over organizational data compared to free tier, but no DPA or custom data handling options." \
  '["https://asana.com/privacy", "https://asana.com/pricing"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. Google SSO available. Admin console for basic user management and security settings. MFA supported. No SAML SSO at this tier." \
  '["https://asana.com/pricing", "https://trustcenter.asana.com"]'

patch_rating "$TIER" "tos" \
  "Standard consumer terms apply with \$100 liability cap. Customer retains content ownership. Better than free tier but no custom enterprise agreement available." \
  '["https://asana.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features." \
  '["https://asana.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "50% nonprofit discount available through Goodstack verification. \$10.99/user/month (annual) before discount. Discount lasts forever for qualifying 501(c)(3) organizations." \
  '["https://asana.com/nonprofit", "https://asana.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards." \
  '["https://asana.com/inside-asana/fy25-asana-esg-report", "https://asana.com/inside-asana/asana-carbon-offsets"]'

patch_rating "$TIER" "ethical_training" \
  "Asana AI features use metadata from workspaces. Admin console allows disabling AI features. Some transparency on data sources in privacy policy, though training data origins for underlying models not fully disclosed." \
  '["https://asana.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Basic admin console included. Google SSO only (no SAML). User management and basic security settings. No audit logs or advanced compliance features." \
  '["https://asana.com/pricing"]'

echo ""
echo "=== ASANA BUSINESS (Advanced) ==="
TIER="eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3"

patch_rating "$TIER" "data_privacy" \
  "Full admin console control over AI features. Standard Data Processing Addendum available. Can disable all AI processing. Better organizational data control than lower tiers." \
  '["https://asana.com/privacy", "https://asana.com/pricing"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. ISO 27001 compliant. Google SSO included. Full admin console with advanced security settings. MFA enforced option. Still no SAML SSO at this tier." \
  '["https://asana.com/pricing", "https://trustcenter.asana.com"]'

patch_rating "$TIER" "tos" \
  "Customer agreement available with improved terms over consumer ToS. Data Processing Addendum incorporates EU-US privacy frameworks. Still has liability limitations but better protections than lower tiers." \
  '["https://asana.com/terms", "https://asana.com/privacy"]'

patch_rating "$TIER" "accessibility" \
  "Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features." \
  '["https://asana.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "50% nonprofit discount available through Goodstack verification. \$24.99/user/month (annual) before discount. Discount lasts forever for qualifying 501(c)(3) organizations." \
  '["https://asana.com/nonprofit", "https://asana.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards." \
  '["https://asana.com/inside-asana/fy25-asana-esg-report", "https://asana.com/inside-asana/asana-carbon-offsets"]'

patch_rating "$TIER" "ethical_training" \
  "Full control to disable AI features via admin console. Asana AI uses workspace metadata only; AI Partner features use content with transparency. Training data for underlying models (likely third-party) not fully disclosed." \
  '["https://asana.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full admin console with advanced permissions. Google SSO included. Custom branding. Advanced reporting and analytics. No SAML SSO or audit log API at this tier." \
  '["https://asana.com/pricing"]'

echo ""
echo "=== ASANA ENTERPRISE ==="
TIER="eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4"

patch_rating "$TIER" "data_privacy" \
  "Enterprise Data Processing Addendum with EU-US, UK, and Swiss privacy framework compliance. Full control over AI features. Data residency options available on Enterprise+. Custom data handling agreements negotiable." \
  '["https://asana.com/privacy", "https://asana.com/pricing"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II, ISO 27001, ISO 27018, ISO 27701 certified. SAML SSO included. Full admin console with advanced security. Audit log API and SIEM integration on Enterprise+. Enterprise-grade security controls." \
  '["https://asana.com/pricing", "https://trustcenter.asana.com"]'

patch_rating "$TIER" "tos" \
  "Custom enterprise agreement with negotiable terms. Data Processing Addendum with comprehensive privacy framework compliance. Better liability protections and custom SLAs available." \
  '["https://asana.com/terms", "https://asana.com/privacy"]'

patch_rating "$TIER" "accessibility" \
  "Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features." \
  '["https://asana.com/accessibility"]'

patch_rating "$TIER" "pricing" \
  "Enterprise pricing requires contacting sales. No published nonprofit discount for Enterprise tier - must negotiate directly. May be cost-prohibitive for smaller nonprofits." \
  '["https://asana.com/nonprofit", "https://asana.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards." \
  '["https://asana.com/inside-asana/fy25-asana-esg-report", "https://asana.com/inside-asana/asana-carbon-offsets"]'

patch_rating "$TIER" "ethical_training" \
  "Full control over AI features with granular admin settings. Enterprise DPA provides transparency on data processing. Asana AI uses metadata only; can fully disable AI Partner features that use content." \
  '["https://asana.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full enterprise admin suite. SAML SSO, SCIM provisioning. Audit log API (Enterprise+). SIEM integration support. Data residency options. Custom domains. Organization-wide JSON export." \
  '["https://asana.com/pricing"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 32 Asana ratings"
