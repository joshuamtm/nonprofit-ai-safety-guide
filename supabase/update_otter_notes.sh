#!/bin/bash
# Update Otter.ai evaluation notes

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

echo "=== OTTER.AI FREE ==="
TIER="88888888-8888-8888-8888-888888888889"

patch_rating "$TIER" "data_privacy" \
  "Otter acts as data controller for free tier - significant control over data processing. Uses de-identified data for AI training (automatic, no manual review). AI service providers prohibited from training on user data. Data stored in AWS US West." \
  '["https://otter.ai/privacy-policy", "https://otter.ai/privacy-security", "https://blog.buildbetter.ai/do-they-own-your-data-otter-ai-privacy-policy-reviewed/"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. TLS encryption in transit, AES-256 encryption at rest. AWS S3 with server-side encryption. GDPR and CCPA compliant frameworks applied." \
  '["https://otter.ai/privacy-security", "https://help.otter.ai/hc/en-us/articles/360048258953"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply. Otter is data controller with significant processing rights. Users can request data deletion. Standard limitation of liability." \
  '["https://otter.ai/privacy-policy"]'

patch_rating "$TIER" "accessibility" \
  "Transcription aids hearing accessibility. No VPAT or formal WCAG compliance statement published. Web and mobile apps with standard controls." \
  '["https://otter.ai"]'

patch_rating "$TIER" "pricing" \
  "Free tier with limited monthly minutes (300 transcription minutes/month). Basic features only. Nonprofit discount available on Business plan through TechSoup partnership." \
  '["https://otter.ai/pricing", "https://help.otter.ai/hc/en-us/articles/15871360236951"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. AWS infrastructure. No specific carbon footprint data available." \
  '["https://otter.ai"]'

patch_rating "$TIER" "ethical_training" \
  "Otter uses de-identified data for AI training - automatic process with no human review. Training data encrypted. Third-party AI providers prohibited from training. Limited transparency overall." \
  '["https://otter.ai/privacy-security", "https://blog.buildbetter.ai/do-they-own-your-data-otter-ai-privacy-policy-reviewed/"]'

patch_rating "$TIER" "enterprise_controls" \
  "No admin console on free tier. Individual use only. No SSO or team management. Basic account features only." \
  '["https://otter.ai/pricing"]'

echo ""
echo "=== OTTER.AI PRO ==="
TIER="88888888-8888-8888-8888-88888888888a"

patch_rating "$TIER" "data_privacy" \
  "Otter acts as data controller for individual Pro accounts. De-identified data used for AI training. AI service providers prohibited from training on data. Better than free but not enterprise-grade protections." \
  '["https://otter.ai/privacy-policy", "https://otter.ai/privacy-security"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. TLS encryption in transit, AES-256 encryption at rest. Same security infrastructure as free tier with higher usage limits." \
  '["https://otter.ai/privacy-security", "https://help.otter.ai/hc/en-us/articles/360048258953"]'

patch_rating "$TIER" "tos" \
  "Consumer terms apply with higher usage limits. Otter maintains data controller status. Data export and deletion available on request." \
  '["https://otter.ai/privacy-policy"]'

patch_rating "$TIER" "accessibility" \
  "Transcription aids hearing accessibility. No VPAT or formal WCAG compliance statement published. Same accessibility as free tier." \
  '["https://otter.ai"]'

patch_rating "$TIER" "pricing" \
  "Pro plan at approximately $16.99/month (annual). Student/teacher discounts available. No specific nonprofit discount - nonprofits should consider Business plan with TechSoup discount." \
  '["https://otter.ai/pricing", "https://help.otter.ai/hc/en-us/articles/4402467517847"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. AWS infrastructure. No specific carbon footprint data available." \
  '["https://otter.ai"]'

patch_rating "$TIER" "ethical_training" \
  "De-identified data used for AI training. No human review of recordings/transcripts. Training data encrypted. Limited transparency on AI practices." \
  '["https://otter.ai/privacy-security"]'

patch_rating "$TIER" "enterprise_controls" \
  "Individual plan - no admin console. No team management or SSO. Higher usage limits than free but no organizational controls." \
  '["https://otter.ai/pricing"]'

echo ""
echo "=== OTTER.AI BUSINESS ==="
TIER="88888888-8888-8888-8888-88888888888b"

patch_rating "$TIER" "data_privacy" \
  "Enterprise customers are data controllers with business agreement. DPA available. HIPAA compliance available with BAA (announced July 2025). Better data governance than consumer tiers." \
  '["https://otter.ai/privacy-policy", "https://otter.ai/blog/otter-ai-achieves-hipaa-compliance"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II certified. HIPAA compliant (with BAA, announced July 2025). TLS encryption in transit, AES-256 at rest. Enhanced enterprise security controls." \
  '["https://otter.ai/privacy-security", "https://otter.ai/blog/otter-ai-achieves-hipaa-compliance"]'

patch_rating "$TIER" "tos" \
  "Business terms with DPA. Customers become data controllers with business agreement. HIPAA BAA available. Better protections than consumer tiers." \
  '["https://otter.ai/privacy-policy"]'

patch_rating "$TIER" "accessibility" \
  "Transcription aids hearing accessibility significantly. No VPAT or formal WCAG compliance statement published. Web and mobile apps with standard controls." \
  '["https://otter.ai"]'

patch_rating "$TIER" "pricing" \
  "Business plan starts at $20/seat/month (annual). Nonprofit discount available through TechSoup partnership - discounted rate on Business plan. Admin fee applies through TechSoup." \
  '["https://otter.ai/pricing", "https://help.otter.ai/hc/en-us/articles/15871360236951", "https://www.techsoup.org/otter-ai-details"]'

patch_rating "$TIER" "environmental" \
  "No published environmental policy or sustainability report. AWS infrastructure. No specific carbon footprint data available." \
  '["https://otter.ai"]'

patch_rating "$TIER" "ethical_training" \
  "Third-party AI providers prohibited from training on data. Enterprise customers have more control as data controllers. De-identified training with opt-out options available." \
  '["https://otter.ai/privacy-security"]'

patch_rating "$TIER" "enterprise_controls" \
  "Admin console with team management. Usage analytics and reporting. SSO integration available. Centralized billing. HIPAA compliance support with BAA." \
  '["https://otter.ai/pricing", "https://otter.ai/blog/otter-ai-achieves-hipaa-compliance"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 24 Otter.ai evaluations"
