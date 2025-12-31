#!/bin/bash
# Template for updating tool evaluation notes
# Copy this file and customize for each tool
#
# Usage:
#   cp update_notes_template.sh update_TOOLNAME_notes.sh
#   # Edit the TIERS and notes
#   bash update_TOOLNAME_notes.sh

API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV2bHplcWh5YnNpaHpzdGVvYXllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2NjU3MjU3OSwiZXhwIjoyMDgyMTQ4NTc5fQ.1T3KzLsDC1ZPbO0PU4z0u6UG9Su3COzgWc9K7PjrZjs"
BASE_URL="https://evlzeqhybsihzsteoaye.supabase.co/rest/v1"

# =====================================================
# TOOL CONFIGURATION - EDIT THIS SECTION
# =====================================================
TOOL_NAME="TEMPLATE"

# Get tier IDs from database:
# curl -s "$BASE_URL/tool_tiers?select=id,tier_name,tools(name)&tools.name=eq.TOOLNAME" \
#   -H "apikey: $API_KEY" -H "Authorization: Bearer $API_KEY"

declare -A TIERS
TIERS["Free"]="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
TIERS["Pro"]="yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"
# Add more tiers as needed

# =====================================================
# UPDATE FUNCTION - DO NOT EDIT
# =====================================================
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

# =====================================================
# NOTES - EDIT THIS SECTION FOR EACH TIER
# =====================================================

update_tier() {
  local tier_name=$1
  local tier_id=${TIERS[$tier_name]}

  echo ""
  echo "=== $TOOL_NAME $tier_name ==="

  patch_rating "$tier_id" "data_privacy" \
    "REPLACE: Notes about data privacy for $tier_name tier..." \
    '["https://example.com/privacy"]'

  patch_rating "$tier_id" "security" \
    "REPLACE: Notes about security for $tier_name tier..." \
    '["https://example.com/security"]'

  patch_rating "$tier_id" "tos" \
    "REPLACE: Notes about terms of service for $tier_name tier..." \
    '["https://example.com/terms"]'

  patch_rating "$tier_id" "accessibility" \
    "REPLACE: Notes about accessibility for $tier_name tier..." \
    '["https://example.com/accessibility"]'

  patch_rating "$tier_id" "pricing" \
    "REPLACE: Notes about pricing for $tier_name tier..." \
    '["https://example.com/pricing"]'

  patch_rating "$tier_id" "environmental" \
    "REPLACE: Notes about environmental impact for $tier_name tier..." \
    '["https://example.com/sustainability"]'

  patch_rating "$tier_id" "ethical_training" \
    "REPLACE: Notes about ethical AI training for $tier_name tier..." \
    '["https://example.com/privacy"]'

  patch_rating "$tier_id" "enterprise_controls" \
    "REPLACE: Notes about enterprise controls for $tier_name tier..." \
    '["https://example.com/pricing"]'
}

# =====================================================
# EXECUTE - ADD TIERS HERE
# =====================================================

for tier in "${!TIERS[@]}"; do
  update_tier "$tier"
done

echo ""
echo "=== COMPLETE ==="
echo "Updated $TOOL_NAME ratings"
