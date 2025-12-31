#!/bin/bash
# Update Zoom AI Companion evaluation notes

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

echo "=== ZOOM AI COMPANION PRO ==="
TIER="aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab"

patch_rating "$TIER" "data_privacy" \
  "Zoom does NOT use customer audio, video, chat, screen sharing, or other content to train AI models. Federated AI approach combining Zoom models with vetted third-party models. Privacy governed by Privacy Statement and DPA." \
  '["https://www.zoom.com/en/products/ai-assistant/resources/privacy-security/", "https://www.zoom.com/en/blog/legal-and-compliance-guide-to-ai-companion/"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II, ISO 27001/27701/27017/27018 certified. AI Companion included in certification scope. Same security as core Zoom products. Subprocessor requirements documented." \
  '["https://www.zoom.com/en/products/ai-assistant/resources/privacy-security/", "https://www.zoom.com/en/trust/legal-compliance/faq/"]'

patch_rating "$TIER" "tos" \
  "Zoom terms of service with Privacy Statement and DPA. Commitments to data handling documented. Third-party model interactions governed by subprocessor agreements." \
  '["https://www.zoom.com/en/blog/legal-and-compliance-guide-to-ai-companion/"]'

patch_rating "$TIER" "accessibility" \
  "Zoom has extensive accessibility features. VPAT available. AI Companion meeting summaries and transcripts aid accessibility. Screen reader compatible platform." \
  '["https://www.zoom.com/en/accessibility/"]'

patch_rating "$TIER" "pricing" \
  "AI Companion included with Zoom Workplace Pro. 50% NONPROFIT DISCOUNT through Zoom Cares program (verified by Goodstack). Workplace Pro, Business, Large Meetings, Webinar eligible. Budget cap of $10M." \
  '["https://www.zoom.com/en/zoom-cares/", "https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0080298"]'

patch_rating "$TIER" "environmental" \
  "No specific environmental policy for AI Companion. Zoom has general sustainability initiatives. Cloud infrastructure environmental impact not specifically disclosed." \
  '["https://www.zoom.com"]'

patch_rating "$TIER" "ethical_training" \
  "Customer content never used for AI training - clear and unambiguous policy. Federated AI approach with multiple processing options (ZMO, ZM+, Federated). Third-party models governed by strict subprocessor requirements." \
  '["https://www.zoom.com/en/products/ai-assistant/resources/privacy-security/", "https://www.zoom.com/en/blog/it-leaders-guide-to-zoom-ai-companion/"]'

patch_rating "$TIER" "enterprise_controls" \
  "Admin portal for AI Companion management. Can enable/disable at account and user level. Usage analytics. Integrates with existing Zoom admin controls." \
  '["https://www.zoom.com/en/blog/it-leaders-guide-to-zoom-ai-companion/"]'

echo ""
echo "=== ZOOM AI COMPANION BUSINESS ==="
TIER="aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac"

patch_rating "$TIER" "data_privacy" \
  "Zoom does NOT use customer content to train AI models. Flexible AI data processing options (ZMO, ZM+, Federated). Privacy governed by Privacy Statement and DPA. Enhanced data governance over Pro tier." \
  '["https://www.zoom.com/en/products/ai-assistant/resources/privacy-security/", "https://www.zoom.com/en/blog/legal-and-compliance-guide-to-ai-companion/"]'

patch_rating "$TIER" "security" \
  "SOC 2 Type II, ISO 27001/27701/27017/27018 certified. FedRAMP authorized for US federal agencies. HIPAA compliant with BAA. AI Companion included in all certifications." \
  '["https://www.zoom.com/en/products/ai-assistant/resources/privacy-security/", "https://www.zoom.com/en/trust/legal-compliance/faq/", "https://www.reco.ai/hub/zoom-compliance"]'

patch_rating "$TIER" "tos" \
  "Business/Enterprise terms with enhanced protections. DPA with comprehensive data handling commitments. Custom agreements available. HIPAA BAA for healthcare use." \
  '["https://www.zoom.com/en/blog/legal-and-compliance-guide-to-ai-companion/"]'

patch_rating "$TIER" "accessibility" \
  "Zoom has extensive accessibility features. VPAT available. AI Companion meeting summaries and transcripts significantly aid accessibility. Screen reader and keyboard navigation support." \
  '["https://www.zoom.com/en/accessibility/"]'

patch_rating "$TIER" "pricing" \
  "AI Companion included with Zoom Workplace Business. 50% NONPROFIT DISCOUNT through Zoom Cares program for qualifying 501(c)(3) organizations. Program moved from TechSoup to Goodstack verification (May 2025)." \
  '["https://www.zoom.com/en/zoom-cares/", "https://support.techsoup.org/hc/en-us/articles/36503175618203"]'

patch_rating "$TIER" "environmental" \
  "No specific environmental policy for AI Companion published. General Zoom sustainability information available. Cloud infrastructure environmental impact not specifically disclosed." \
  '["https://www.zoom.com"]'

patch_rating "$TIER" "ethical_training" \
  "Clear policy: Customer content never used for AI training. White paper available detailing AI security and privacy. Third-party model providers governed by strict agreements. Legal compliance guide updated February 2025." \
  '["https://www.zoom.com/en/products/ai-assistant/resources/privacy-security/", "https://www.zoom.com/en/blog/legal-and-compliance-guide-to-ai-companion/"]'

patch_rating "$TIER" "enterprise_controls" \
  "Full admin controls for AI Companion. SAML SSO available on Business tier. Can configure AI features by user/group. Advanced analytics and reporting. Compliance reporting tools." \
  '["https://www.zoom.com/en/blog/it-leaders-guide-to-zoom-ai-companion/", "https://library.zoom.com/zoom-workplace/artificial-intelligence/artificial-intelligence-bluepaper/security-and-compliance/zoom-ai-companion"]'

echo ""
echo "=== COMPLETE ==="
echo "Updated 16 Zoom AI Companion evaluations"
