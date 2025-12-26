-- =============================================================
-- COMPLETE MIGRATION: Add Groq, Grok, and Newsletter Subscribers
-- Run this in Supabase SQL Editor:
-- https://supabase.com/dashboard/project/evlzeqhybsihzsteoaye/sql
-- =============================================================

-- 1. CREATE NEWSLETTER SUBSCRIBERS TABLE
-- -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT NOT NULL UNIQUE,
  subscribed_at TIMESTAMPTZ DEFAULT NOW(),
  unsubscribed_at TIMESTAMPTZ,
  source TEXT DEFAULT 'website'
);

CREATE INDEX IF NOT EXISTS idx_newsletter_email ON newsletter_subscribers(email);
ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;

-- Drop policy if exists, then create
DROP POLICY IF EXISTS "Allow public insert on newsletter_subscribers" ON newsletter_subscribers;
CREATE POLICY "Allow public insert on newsletter_subscribers"
  ON newsletter_subscribers FOR INSERT WITH CHECK (true);

-- 2. ADD GROQ (with a 'q') - AI Inference Platform - RECOMMENDED (76/100)
-- -------------------------------------------------------------
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Groq',
  'Groq, Inc.',
  'Ultra-fast AI inference platform powered by LPU (Language Processing Unit) technology. Provides API access to run various LLMs with industry-leading speed and strong privacy controls. Note: Different from Grok (xAI).',
  'https://groq.com',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Groq_logo.svg/512px-Groq_logo.svg.png',
  ARRAY['research', 'data', 'productivity', 'writing']
);

-- Get Groq's ID for tier inserts
DO $$
DECLARE
  groq_id UUID;
  groq_free_tier_id UUID;
  groq_dev_tier_id UUID;
  groq_ent_tier_id UUID;
BEGIN
  SELECT id INTO groq_id FROM tools WHERE name = 'Groq';

  -- Insert Groq Free Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (groq_id, 'Free', 'approved',
    'Strong privacy controls with Zero Data Retention option. SOC 2 Type II certified. User owns all prompts and outputs. No training on user data. 10x more energy efficient than GPU inference.',
    'no', false, true, null)
  RETURNING id INTO groq_free_tier_id;

  -- Insert Groq Developer Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (groq_id, 'Developer', 'approved',
    'Same privacy controls as Free tier plus 10x rate limits, 25% cost discount, and Batch API access (50% discount). Self-serve upgrade available.',
    'no', false, true, null)
  RETURNING id INTO groq_dev_tier_id;

  -- Insert Groq Enterprise Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (groq_id, 'Enterprise', 'approved',
    'Dedicated or multi-tenant instances. Contact sales for SSO/SCIM details and custom data residency options. Same strong privacy foundation as other tiers.',
    'no', true, true, null)
  RETURNING id INTO groq_ent_tier_id;

  -- Insert Groq Free Tier Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (groq_free_tier_id, 'data_privacy', 3, 'No training on user data. Zero Data Retention option available. Default: no retention. GDPR/CCPA compliant.', ARRAY['https://console.groq.com/docs/your-data', 'https://groq.com/privacy-policy']),
    (groq_free_tier_id, 'security', 3, 'SOC 2 Type II certified. Trust Center available. Encryption in transit and at rest. Bug bounty program.', ARRAY['https://trust.groq.com/', 'https://groq.com/security']),
    (groq_free_tier_id, 'tos', 3, 'User owns prompts and retains all IP rights. Groq assigns IP rights in outputs to user. Reasonable terms.', ARRAY['https://groq.com/terms-of-use']),
    (groq_free_tier_id, 'accessibility', 1, 'No accessibility statement found. No WCAG compliance documentation. No VPAT available.', ARRAY['https://groq.com']),
    (groq_free_tier_id, 'pricing', 2, 'Free tier available with rate limits, no credit card required. Developer tier offers 25% discount. No nonprofit-specific pricing.', ARRAY['https://groq.com/pricing']),
    (groq_free_tier_id, 'environmental', 3, 'LPU technology is 10x more energy efficient than GPUs (1-3 vs 10-30 Joules per token). Partnership with DOE on sustainability.', ARRAY['https://groq.com/lpu-architecture']),
    (groq_free_tier_id, 'ethical_training', 1, 'Groq is an inference platform, not a model trainer. Training data transparency depends on hosted models.', ARRAY['https://console.groq.com/docs/legal/ai-policy']),
    (groq_free_tier_id, 'enterprise_controls', 2, 'Data Controls settings in console. Zero Data Retention option. SSO/SCIM details require contacting sales.', ARRAY['https://console.groq.com/docs/your-data']),
    (groq_free_tier_id, 'sector_commitment', 1, 'No nonprofit-specific programs. No TechSoup partnership. Enterprise sales available but not nonprofit-specific.', ARRAY['https://groq.com']);

END $$;

-- 3. ADD GROK (with a 'k') - xAI Chatbot - NOT RECOMMENDED (36/100)
-- -------------------------------------------------------------
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Grok',
  'xAI (Elon Musk)',
  'AI chatbot from xAI, integrated with X (Twitter). Known for "unfiltered" responses. Significant concerns around training data ethics, environmental impact, and documented bias incidents. Note: Different from Groq (inference platform).',
  'https://grok.com',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Grok_logo_%282025%29.svg/512px-Grok_logo_%282025%29.svg.png',
  ARRAY['writing', 'research', 'productivity']
);

-- Get Grok's ID for tier inserts
DO $$
DECLARE
  grok_id UUID;
  grok_free_tier_id UUID;
  grok_biz_tier_id UUID;
BEGIN
  SELECT id INTO grok_id FROM tools WHERE name = 'Grok';

  -- Insert Grok Free Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (grok_id, 'Free', 'not_recommended',
    'Not Recommended due to: training on user data by default, documented bias incidents (Holocaust denial, antisemitic content), no safety transparency, environmental concerns (methane-powered data center exceeding permit limits).',
    'yes', false, false, null)
  RETURNING id INTO grok_free_tier_id;

  -- Insert Grok Business Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (grok_id, 'Business', 'caution',
    'Better data handling (business data not used for training), enterprise controls (SSO, audit logs), but fundamental model concerns around bias and ethics remain. Environmental impact still problematic.',
    'no', true, true, null)
  RETURNING id INTO grok_biz_tier_id;

  -- Insert Grok Free Tier Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (grok_free_tier_id, 'data_privacy', 1, 'Trains on user data by default on X platform. Opt-out buried in settings. "Private Chat" mode available but limited.', ARRAY['https://x.ai/legal/privacy-policy']),
    (grok_free_tier_id, 'security', 2, 'SOC 2 Type 2 for API. TLS encryption. But Grok 4 security testing revealed concerns without proper system prompts.', ARRAY['https://x.ai/security']),
    (grok_free_tier_id, 'tos', 1, 'User owns content, but X ToS changes (Jan 2026) expand "Content" to include AI interactions. Reduced claim window.', ARRAY['https://x.ai/legal/terms-of-service']),
    (grok_free_tier_id, 'accessibility', 1, 'Read-aloud feature exists. No official WCAG compliance. Elon Musk fired Twitter accessibility team after acquisition.', ARRAY['https://x.ai']),
    (grok_free_tier_id, 'pricing', 2, 'Free tier available with limits (10 prompts/2 hours). Paid tiers from $3-$40/month. No nonprofit discount.', ARRAY['https://grok.com/plans']),
    (grok_free_tier_id, 'environmental', 0, 'Memphis data center runs 33 methane gas turbines (permitted for 15). Located in disadvantaged community. Plans for 2GW expansion.', ARRAY['https://tennesseelookout.com/2025/07/07/a-billionaire-an-ai-supercomputer-toxic-emissions-and-a-memphis-community-that-did-nothing-wrong/']),
    (grok_free_tier_id, 'ethical_training', 0, 'Trained on unfiltered X data. Multiple bias incidents (Holocaust denial, antisemitic content). No safety reports published.', ARRAY['https://aimagazine.com/news/the-story-behind-elon-musks-xai-grok-4-ethical-concerns']),
    (grok_free_tier_id, 'enterprise_controls', 1, 'Limited controls on free tier. Basic data settings available.', ARRAY['https://x.ai/legal/faq']),
    (grok_free_tier_id, 'sector_commitment', 0, 'No nonprofit programs. No TechSoup partnership.', ARRAY['https://grok.com']);

  -- Insert Grok Business Tier Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (grok_biz_tier_id, 'data_privacy', 2, 'Business data NOT used for training. Zero Data Retention available. 30-day auto-delete.', ARRAY['https://x.ai/legal/faq-enterprise']),
    (grok_biz_tier_id, 'security', 2, 'SOC 2 Type 2. GDPR/CCPA compliance. SSO with SAML.', ARRAY['https://x.ai/security']),
    (grok_biz_tier_id, 'tos', 1, 'Better enterprise terms but parent company practices remain concerning.', ARRAY['https://x.ai/legal/terms-of-service-enterprise']),
    (grok_biz_tier_id, 'accessibility', 1, 'Same as consumer tiers. Read-aloud available. No WCAG documentation.', ARRAY['https://x.ai']),
    (grok_biz_tier_id, 'pricing', 1, '$30/user/month. No nonprofit discount found.', ARRAY['https://grok.com/plans']),
    (grok_biz_tier_id, 'environmental', 0, 'Same data center concerns as consumer tiers.', ARRAY['https://sustainabilitymag.com/news/elon-musks-xai-imports-overseas-power-to-fuel-data-centre']),
    (grok_biz_tier_id, 'ethical_training', 0, 'Same fundamental model with documented bias issues. No safety reports.', ARRAY['https://aimagazine.com/news/the-story-behind-elon-musks-xai-grok-4-ethical-concerns']),
    (grok_biz_tier_id, 'enterprise_controls', 3, 'SSO (SAML) with Okta, OneLogin, GSuite. 90-day audit trail. Admin console. Zero Data Retention option.', ARRAY['https://x.ai/legal/faq-enterprise']),
    (grok_biz_tier_id, 'sector_commitment', 0, 'No nonprofit programs or sector focus.', ARRAY['https://x.ai']);

END $$;

-- 4. VERIFY
-- -------------------------------------------------------------
SELECT 'Tools added:' as status, name, vendor FROM tools WHERE name IN ('Groq', 'Grok');
SELECT 'Newsletter table exists:' as status, COUNT(*) as count FROM newsletter_subscribers;
