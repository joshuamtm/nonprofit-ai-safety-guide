#!/bin/bash
# Update Claude evaluation notes

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

echo "=== CLAUDE FREE ==="
TIER="22222222-2222-2222-2222-222222222223"

patch_rating "$TIER" "data_privacy" \
  "Anthropic does not train on Claude.ai conversations by default. Free tier users can opt out of any data use via settings. However, content flagged for safety review may still be analyzed. 30-day conversation retention." \
  '["https://www.anthropic.com/privacy", "https://privacy.anthropic.com"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. ISO 27001 and ISO 42001 compliant. Encryption in transit and at rest. MFA available but no SSO options on free tier. No admin controls." \
  '["https://trust.anthropic.com", "https://privacy.anthropic.com/en/articles/10015870-what-certifications-has-anthropic-obtained"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply with liability cap of \$100 or 6 months fees (whichever greater). Users retain input rights; Anthropic assigns output rights to users. Anthropic can terminate without notice for violations." \
  '["https://www.anthropic.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Claude web interface is accessible for keyboard use and screen reader assistive technologies. iOS app rated highly accessible with labeled buttons. No published VPAT or formal WCAG compliance statement." \
  '["https://claude.ai"]'

patch_rating "$TIER" "pricing" \
  "Free tier available with usage limits. No published nonprofit discount program. Education pricing available for universities but not nonprofits specifically." \
  '["https://claude.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Anthropic has not published specific carbon emissions data or sustainability reports. Google Cloud partnership provides 100% renewable energy matching. General commitment to studying AI environmental impact stated but limited transparency." \
  '["https://www.anthropic.com/news/investing-in-energy-to-secure-america-s-ai-future"]'

patch_rating "$TIER" "ethical_training" \
  "Constitutional AI approach with published training methodology. Does not train on user conversations by default. Some transparency on safety practices. Training data sources not fully disclosed." \
  '["https://www.anthropic.com/research", "https://www.anthropic.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. No SSO options. No team management or organizational controls. Individual use only." \
  '["https://claude.com/pricing"]'

echo ""
echo "=== CLAUDE PRO ==="
TIER="22222222-2222-2222-2222-222222222224"

patch_rating "$TIER" "data_privacy" \
  "Does not train on conversations by default. Opt-out available in settings. Same privacy protections as free tier with higher usage limits. No DPA on individual Pro plan." \
  '["https://www.anthropic.com/privacy", "https://privacy.anthropic.com"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. ISO 27001 and ISO 42001 compliant. Encryption in transit and at rest. MFA available. No SSO on individual Pro plan." \
  '["https://trust.anthropic.com", "https://privacy.anthropic.com/en/articles/10015870-what-certifications-has-anthropic-obtained"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply with liability cap of \$100 or 6 months fees (whichever greater). Users retain input rights; Anthropic assigns output rights to users. Pro-rata refund if Anthropic terminates." \
  '["https://www.anthropic.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Claude web interface is accessible for keyboard use and screen reader assistive technologies. iOS app rated highly accessible with labeled buttons. No published VPAT or formal WCAG compliance statement." \
  '["https://claude.ai"]'

patch_rating "$TIER" "pricing" \
  "\$17/month (annual) or \$20/month (monthly). No published nonprofit discount. Education pricing for universities but not nonprofit-specific pricing available." \
  '["https://claude.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Anthropic has not published specific carbon emissions data or sustainability reports. Google Cloud partnership provides 100% renewable energy matching. General commitment to studying AI environmental impact stated but limited transparency." \
  '["https://www.anthropic.com/news/investing-in-energy-to-secure-america-s-ai-future"]'

patch_rating "$TIER" "ethical_training" \
  "Constitutional AI approach with published research on training methodology. Does not train on user conversations. Transparency on safety practices and red-teaming. Training data sources not fully disclosed." \
  '["https://www.anthropic.com/research", "https://www.anthropic.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on individual Pro plan. No SSO. No team management features. Higher usage limits and extended thinking available but no organizational controls." \
  '["https://claude.com/pricing"]'

echo ""
echo "=== CLAUDE TEAM ==="
TIER="22222222-2222-2222-2222-222222222225"

patch_rating "$TIER" "data_privacy" \
  "Does not train on Team workspace conversations. Zero Data Retention (ZDR) addendum available for sensitive data. DPA available. Admin controls over data handling." \
  '["https://www.anthropic.com/privacy", "https://privacy.anthropic.com"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II, ISO 27001, ISO 42001, HIPAA compliant. SAML 2.0 and OIDC SSO supported. Domain capture to manage user access. Role-based access controls." \
  '["https://trust.anthropic.com", "https://privacy.anthropic.com/en/articles/10015870-what-certifications-has-anthropic-obtained"]'

patch_rating "$TIER" "tos" \
  "Business terms with improved protections over consumer ToS. DPA available with data handling commitments. Custom enterprise agreements negotiable on Enterprise tier." \
  '["https://www.anthropic.com/terms"]'

patch_rating "$TIER" "accessibility" \
  "Claude web interface is accessible for keyboard use and screen reader assistive technologies. iOS app rated highly accessible with labeled buttons. No published VPAT or formal WCAG compliance statement." \
  '["https://claude.ai"]'

patch_rating "$TIER" "pricing" \
  "\$25/month standard seat or \$150/month premium seat (minimum 5 members). No published nonprofit discount. Volume pricing may be negotiable." \
  '["https://claude.com/pricing"]'

patch_rating "$TIER" "environmental" \
  "Anthropic has not published specific carbon emissions data or sustainability reports. Google Cloud partnership provides 100% renewable energy matching. General commitment to studying AI environmental impact stated but limited transparency." \
  '["https://www.anthropic.com/news/investing-in-energy-to-secure-america-s-ai-future"]'

patch_rating "$TIER" "ethical_training" \
  "Constitutional AI approach with transparent methodology. Does not train on Team conversations. ZDR option eliminates all data persistence. Strong safety practices with published research." \
  '["https://www.anthropic.com/research", "https://www.anthropic.com/privacy"]'

patch_rating "$TIER" "enterprise_controls" \
  "Admin console with team management. SSO via SAML 2.0 and OIDC. Domain capture for user management. Role-based permissions. Audit logs available on Enterprise tier." \
  '["https://claude.com/pricing"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 24 Claude evaluations"
