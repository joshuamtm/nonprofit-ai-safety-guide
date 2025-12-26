-- Grok (xAI) - SQL Insert Statements for Supabase
-- Generated: December 26, 2025
-- Rating: Not Recommended (36/100)
-- NOTE: Grok (with a 'k') is xAI/Elon Musk's chatbot. Different from Groq (with a 'q').

-- Step 1: Insert the tool
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Grok',
  'xAI (Elon Musk)',
  'AI chatbot from xAI, integrated with X (Twitter). Known for "unfiltered" responses. Significant concerns around training data ethics, environmental impact, and documented bias incidents.',
  'https://grok.com',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Grok_logo_%282025%29.svg/512px-Grok_logo_%282025%29.svg.png',
  ARRAY['writing', 'research', 'productivity']
)
RETURNING id;

-- Step 2: Insert tiers (replace [TOOL_ID] with the ID returned above)

-- Free Tier (via X)
INSERT INTO tool_tiers (
  tool_id,
  tier_name,
  overall_rating,
  rating_notes,
  data_training_policy,
  requires_contract,
  soc2_certified,
  fedramp_status
)
VALUES (
  '[TOOL_ID]',
  'Free',
  'not_recommended',
  'Not Recommended due to: training on user data by default, documented bias incidents (Holocaust denial, antisemitic content), no safety transparency, environmental concerns (methane-powered data center exceeding permit limits), and "anti-woke" training instructions.',
  'yes',
  false,
  false,
  null
)
RETURNING id;
-- Save this as [FREE_TIER_ID]

-- SuperGrok ($30/month)
INSERT INTO tool_tiers (
  tool_id,
  tier_name,
  overall_rating,
  rating_notes,
  data_training_policy,
  requires_contract,
  soc2_certified,
  fedramp_status
)
VALUES (
  '[TOOL_ID]',
  'SuperGrok',
  'not_recommended',
  'Same fundamental concerns as Free tier. Opt-out available but underlying model and training issues remain.',
  'opt-out',
  false,
  true,
  null
)
RETURNING id;
-- Save this as [SUPER_TIER_ID]

-- Business Tier ($30/user/month)
INSERT INTO tool_tiers (
  tool_id,
  tier_name,
  overall_rating,
  rating_notes,
  data_training_policy,
  requires_contract,
  soc2_certified,
  fedramp_status
)
VALUES (
  '[TOOL_ID]',
  'Business',
  'caution',
  'Better data handling (business data not used for training), enterprise controls (SSO, audit logs), but fundamental model concerns around bias and ethics remain. Environmental impact still problematic.',
  'no',
  true,
  true,
  null
)
RETURNING id;
-- Save this as [BIZ_TIER_ID]

-- Step 3: Insert evaluations for Free Tier (replace [FREE_TIER_ID])

INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls)
VALUES
  ('[FREE_TIER_ID]', 'data_privacy', 1, 'Trains on user data by default on X platform. Opt-out buried in settings. "Private Chat" mode available but limited.', ARRAY['https://x.ai/legal/privacy-policy', 'https://help.x.com/en/using-x/about-grok']),
  ('[FREE_TIER_ID]', 'security', 2, 'SOC 2 Type 2 for API. TLS encryption. But Grok 4 security testing revealed "not suitable for enterprise usage with no system prompt."', ARRAY['https://x.ai/security', 'https://promptfoo.dev/models/reports/grok-4']),
  ('[FREE_TIER_ID]', 'tos', 1, 'User owns content, but X ToS changes (Jan 2026) expand "Content" to include AI interactions. Reduced claim window from 2 years to 1 year.', ARRAY['https://x.ai/legal/terms-of-service', 'https://cryptoslate.com/how-the-new-x-terms-of-service-gives-grok-permission-to-use-anything-you-say-forever-with-no-opt-out/']),
  ('[FREE_TIER_ID]', 'accessibility', 1, 'Read-aloud feature exists. No official WCAG compliance. Elon Musk fired Twitter accessibility team after acquisition.', ARRAY['https://vi.ie/we-spoke-to-grok-about-accessibility-and-elon-musk/']),
  ('[FREE_TIER_ID]', 'pricing', 2, 'Free tier available with limits (10 prompts/2 hours). Paid tiers from $3-$40/month. No nonprofit discount.', ARRAY['https://grok.com/plans']),
  ('[FREE_TIER_ID]', 'environmental', 0, 'Memphis data center runs 33 methane gas turbines (permitted for 15). Located in disadvantaged community. Plans for 2GW expansion. No sustainability commitments.', ARRAY['https://tennesseelookout.com/2025/07/07/a-billionaire-an-ai-supercomputer-toxic-emissions-and-a-memphis-community-that-did-nothing-wrong/', 'https://sustainabilitymag.com/news/elon-musks-xai-imports-overseas-power-to-fuel-data-centre']),
  ('[FREE_TIER_ID]', 'ethical_training', 0, 'Trained on unfiltered X data. Multiple bias incidents (Holocaust denial, antisemitic content, "MechaHitler"). No safety reports published. "Anti-woke" training instructions revealed.', ARRAY['https://aimagazine.com/news/the-story-behind-elon-musks-xai-grok-4-ethical-concerns', 'https://theconversation.com/how-do-you-stop-an-ai-model-turning-nazi-what-the-grok-drama-reveals-about-ai-training-261001']),
  ('[FREE_TIER_ID]', 'enterprise_controls', 1, 'Limited controls on free tier. Basic data settings available.', ARRAY['https://x.ai/legal/faq']),
  ('[FREE_TIER_ID]', 'sector_commitment', 0, 'No nonprofit programs. No TechSoup partnership. Government pricing subsidized but no nonprofit focus.', ARRAY['https://grok.com']);

-- Step 4: Insert evaluations for Business Tier (replace [BIZ_TIER_ID])

INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls)
VALUES
  ('[BIZ_TIER_ID]', 'data_privacy', 2, 'Business data NOT used for training. Zero Data Retention available. 30-day auto-delete.', ARRAY['https://x.ai/legal/faq-enterprise']),
  ('[BIZ_TIER_ID]', 'security', 2, 'SOC 2 Type 2. GDPR/CCPA compliance. SSO with SAML. Defense-in-depth controls.', ARRAY['https://x.ai/security', 'https://x.ai/legal/faq-enterprise']),
  ('[BIZ_TIER_ID]', 'tos', 1, 'Better enterprise terms. User owns inputs/outputs. But parent company practices remain concerning.', ARRAY['https://x.ai/legal/terms-of-service-enterprise']),
  ('[BIZ_TIER_ID]', 'accessibility', 1, 'Same as consumer tiers. Read-aloud available. No WCAG documentation.', ARRAY['https://x.ai']),
  ('[BIZ_TIER_ID]', 'pricing', 1, '$30/user/month. No nonprofit discount found.', ARRAY['https://grok.com/plans']),
  ('[BIZ_TIER_ID]', 'environmental', 0, 'Same data center concerns as consumer tiers.', ARRAY['https://sustainabilitymag.com/news/elon-musks-xai-imports-overseas-power-to-fuel-data-centre']),
  ('[BIZ_TIER_ID]', 'ethical_training', 0, 'Same fundamental model with documented bias issues. No safety reports.', ARRAY['https://aimagazine.com/news/the-story-behind-elon-musks-xai-grok-4-ethical-concerns']),
  ('[BIZ_TIER_ID]', 'enterprise_controls', 3, 'SSO (SAML) with Okta, OneLogin, GSuite. 90-day audit trail. Admin console. Zero Data Retention option.', ARRAY['https://x.ai/legal/faq-enterprise']),
  ('[BIZ_TIER_ID]', 'sector_commitment', 0, 'No nonprofit programs or sector focus.', ARRAY['https://x.ai']);
