#!/bin/bash
# Update Microsoft Copilot evaluation notes

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

echo "=== MICROSOFT COPILOT FREE ==="
TIER="33333333-3333-3333-3333-333333333334"

patch_rating "$TIER" "data_privacy" \
  "Free Copilot (Bing Chat) has limited data protections. Conversations may be used for improvement. User/tenant identifiers removed from web searches. Not suitable for confidential organizational data." \
  '["https://learn.microsoft.com/en-us/copilot/privacy-and-protections"]'

patch_rating "$TIER" "security" \
  "Basic Microsoft account security. No enterprise controls. MFA available through Microsoft account. No SSO integration or admin features on free tier." \
  '["https://learn.microsoft.com/en-us/copilot/overview"]'

patch_rating "$TIER" "tos" \
  "Microsoft consumer terms apply. Standard liability limitations. Users retain input ownership. Not covered by enterprise service agreements." \
  '["https://www.microsoft.com/en-us/servicesagreement/"]'

patch_rating "$TIER" "accessibility" \
  "Microsoft products generally meet WCAG 2.1 AA standards. Built-in accessibility features. Screen reader compatible. Keyboard navigation supported across Microsoft products." \
  '["https://www.microsoft.com/en-us/accessibility"]'

patch_rating "$TIER" "pricing" \
  "Free tier available with basic features. Limited compared to M365 Copilot. Good for exploration but not suitable for organizational deployment." \
  '["https://copilot.microsoft.com"]'

patch_rating "$TIER" "environmental" \
  "Microsoft committed to carbon negative by 2030. Emissions increased 23% since 2020 due to AI growth, but progress being made. 19 GW renewable energy contracted in 2024. Largest buyer of carbon removal credits globally." \
  '["https://blogs.microsoft.com/on-the-issues/2024/05/15/microsoft-environmental-sustainability-report-2024/"]'

patch_rating "$TIER" "ethical_training" \
  "Free tier conversations may be used for improvement. Microsoft Responsible AI principles published. Some transparency on safety practices. Limited enterprise-grade protections." \
  '["https://www.microsoft.com/en-us/ai/responsible-ai"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. No SSO or organizational controls. Individual Microsoft account only. Not suitable for team or organizational deployment." \
  '["https://copilot.microsoft.com"]'

echo ""
echo "=== MICROSOFT 365 COPILOT ==="
TIER="33333333-3333-3333-3333-333333333335"

patch_rating "$TIER" "data_privacy" \
  "Enterprise data protection - data stays within M365 tenant. Prompts and responses not used to train foundation models. Data encrypted at rest and in transit. EU Data Boundary supported. DPA available." \
  '["https://learn.microsoft.com/en-us/copilot/microsoft-365/enterprise-data-protection", "https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-privacy"]'

patch_rating "$TIER" "security" \
  "FedRAMP Authorized (Moderate). SOC 2 Type II, ISO 27001/17/18 certified. Inherits M365 security including SAML SSO, MFA enforcement, Conditional Access. Data isolation between tenants." \
  '["https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-ai-security"]'

patch_rating "$TIER" "tos" \
  "Microsoft 365 enterprise agreement with comprehensive protections. DPA supports GDPR compliance. Inherits sensitivity labels and retention policies. Custom terms negotiable for large deployments." \
  '["https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/all"]'

patch_rating "$TIER" "accessibility" \
  "Microsoft products meet WCAG 2.1 AA standards. Accessibility Conformance Reports (ACRs) published. Screen reader compatible. Full keyboard navigation. Built into accessible M365 ecosystem." \
  '["https://www.microsoft.com/en-us/accessibility", "https://www.microsoft.com/en-us/accessibility/conformance-reports"]'

patch_rating "$TIER" "pricing" \
  "15% nonprofit discount since Nov 2024 (\$25.50/user/month vs \$30). Requires qualifying M365 base license. 20+ year track record of nonprofit support through Microsoft Philanthropies and TechSoup partnership." \
  '["https://techcommunity.microsoft.com/discussions/nonprofitpartners/15-discount-for-eligible-nonprofit-customers-on-microsoft-365-copilot-effective-/4284412", "https://www.microsoft.com/en-us/nonprofits/offers-for-nonprofits"]'

patch_rating "$TIER" "environmental" \
  "Microsoft committed to carbon negative by 2030, water positive, zero waste. Emissions increased 23% since 2020 due to AI but making progress. Largest carbon removal buyer globally. 19 GW renewable energy in 2024." \
  '["https://blogs.microsoft.com/on-the-issues/2024/05/15/microsoft-environmental-sustainability-report-2024/", "https://www.microsoft.com/en-us/corporate-responsibility/sustainability"]'

patch_rating "$TIER" "ethical_training" \
  "Enterprise data never used for model training. Microsoft Responsible AI principles published. Transparency on safety practices. Content filtered and reviewed for harmful outputs. AI governance framework." \
  '["https://www.microsoft.com/en-us/ai/responsible-ai", "https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full M365 admin center integration. SAML SSO via Entra ID. Sensitivity labels inherited. Audit logs in Purview. Conditional Access policies. Can enable/disable by user or group. Compliance Manager integration." \
  '["https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-setup"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 16 Microsoft Copilot evaluations"
