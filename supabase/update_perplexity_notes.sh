#!/bin/bash
# Update Perplexity evaluation notes

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

echo "=== PERPLEXITY FREE ==="
TIER="55555555-5555-5555-5555-555555555556"

patch_rating "$TIER" "data_privacy" \
  "Consumer privacy policy applies. EU-US Data Privacy Framework compliant. FTC has jurisdiction over DPF compliance. Limited enterprise-grade protections on free tier." \
  '["https://www.perplexity.ai/hub/legal/privacy-policy"]'

patch_rating "$TIER" "security" \
  "Basic security measures. No SOC 2 or enterprise certifications on free tier. Enterprise Pro needed for compliance certifications. Web-based service with standard protections." \
  '["https://www.perplexity.ai/hub/legal/privacy-policy"]'

patch_rating "$TIER" "tos" \
  "Consumer terms of service apply. Acceptable Use Policy governs usage. Standard liability limitations. Terms can be modified with notice." \
  '["https://www.perplexity.ai/hub/legal/terms-of-service", "https://www.perplexity.ai/hub/legal/aup"]'

patch_rating "$TIER" "accessibility" \
  "No VPAT or formal WCAG compliance statement published. Web-based interface with standard controls. Limited accessibility documentation." \
  '["https://www.perplexity.ai"]'

patch_rating "$TIER" "pricing" \
  "Free tier with usage limits on queries. No nonprofit discount on free tier. Nonprofit discount (50% off) available on Enterprise Pro plan for qualified organizations." \
  '["https://www.perplexity.ai/hub/blog/bringing-perplexity-to-education-and-not-for-profits"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. Cloud infrastructure (AWS) has renewable energy commitments. No specific carbon data." \
  '["https://www.perplexity.ai"]'

patch_rating "$TIER" "ethical_training" \
  "Limited transparency on AI training practices for free tier. Privacy policy covers data collection and use. No published AI ethics framework." \
  '["https://www.perplexity.ai/hub/legal/privacy-policy"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. Individual use only. No SSO, audit logs, or organizational controls. Enterprise Pro required for admin features." \
  '["https://www.perplexity.ai/enterprise/pricing"]'

echo ""
echo "=== PERPLEXITY PRO ==="
TIER="55555555-5555-5555-5555-555555555557"

patch_rating "$TIER" "data_privacy" \
  "SOC 2 Type II audited. GDPR compliance stated (not independently verified). Files auto-deleted after 7 days. Enterprise-grade encryption at rest and in transit. Zero data retention policy for enterprise." \
  '["https://docs.perplexity.ai/guides/privacy-security", "https://www.perplexity.ai/hub/blog/how-perplexity-enterprise-pro-keeps-your-data-secure"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. HIPAA compliant (with BAA for Enterprise). AWS infrastructure with Wiz security scanning. Third-party model providers contractually prohibited from accessing/training on data." \
  '["https://www.perplexity.ai/hub/blog/how-perplexity-enterprise-pro-keeps-your-data-secure", "https://www.paubox.com/blog/is-perplexity-ai-hipaa-compliant-2025-update"]'

patch_rating "$TIER" "tos" \
  "Enterprise Pro terms (separate from consumer terms). DPA available with detailed data processing commitments. Annual compliance audits available on request. HIPAA BAA for Enterprise customers." \
  '["https://www.perplexity.ai/hub/legal/dpa", "https://www.perplexity.ai/hub/legal/perplexity-api-terms-of-service"]'

patch_rating "$TIER" "accessibility" \
  "No VPAT or formal WCAG compliance statement published. Web-based interface. Same accessibility as free tier with more features." \
  '["https://www.perplexity.ai"]'

patch_rating "$TIER" "pricing" \
  "Enterprise Pro at $40/user/month or $400/year. 50% NONPROFIT DISCOUNT available - $20/seat/month or $200/seat/year for nonprofits, education, and government. Contact enterprise@perplexity.ai to apply." \
  '["https://www.perplexity.ai/enterprise/pricing", "https://www.perplexity.ai/hub/blog/bringing-perplexity-to-education-and-not-for-profits"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. AWS infrastructure has renewable energy commitments. No specific carbon data available." \
  '["https://www.perplexity.ai"]'

patch_rating "$TIER" "ethical_training" \
  "Third-party model providers contractually prohibited from training on customer data (agreements reviewed annually). Zero data retention for enterprise. Better transparency than free tier." \
  '["https://www.perplexity.ai/hub/blog/how-perplexity-enterprise-pro-keeps-your-data-secure", "https://docs.perplexity.ai/guides/privacy-security"]'

patch_rating "$TIER" "enterprise_controls" \
  "Admin console with user management. SSO integration available. Audit logging. CAIQlite cloud security assessment. HIPAA Gap Assessment available for healthcare." \
  '["https://www.perplexity.ai/enterprise/pricing", "https://www.perplexity.ai/hub/blog/how-perplexity-enterprise-pro-keeps-your-data-secure"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 16 Perplexity evaluations"
