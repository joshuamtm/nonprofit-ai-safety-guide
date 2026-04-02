-- =============================================================
-- MIGRATION: Full Tool Review Update — April 2, 2026
-- All 20 tools re-evaluated with current research.
-- Run in Supabase SQL Editor:
-- https://supabase.com/dashboard/project/evlzeqhybsihzsteoaye/sql
-- =============================================================

-- =====================================================
-- BATCH 1: CRITICAL CORRECTIONS — Claude & Fathom
-- Claude: Training default changed August 2025 (opt-in by default)
-- Fathom: Now uses de-identified data for internal training
-- =====================================================

UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Free tier now trains on conversations by default since August 2025. Users must explicitly opt out in privacy settings. Opt-out available but pre-checked "On" during consent flow. Not suitable for sensitive nonprofit data without opting out.',
  overall_rating = 'caution'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Claude') AND tier_name = 'Free';

UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Pro tier ($20/mo) trains on data by default since August 2025. Opt-out available in settings. SOC 2 Type II applies to API/Enterprise platform. Claude for Nonprofits offers up to 75% off Team/Enterprise.',
  overall_rating = 'caution'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Claude') AND tier_name = 'Pro';

UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Max tier trains on data by default since August 2025. Opt-out available. Higher usage limits. Same training policy concerns as Pro.',
  overall_rating = 'caution'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Claude') AND tier_name = 'Max';

INSERT INTO evaluation_changelog (tool_tier_id, previous_rating, new_rating, change_reason) VALUES
  ((SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'Claude' AND tt.tier_name = 'Pro'),
   'recommended', 'caution', 'Anthropic changed training default to opt-in for Free/Pro/Max tiers in August 2025.'),
  ((SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'Claude' AND tt.tier_name = 'Max'),
   'recommended', 'caution', 'Same August 2025 training policy change as Pro tier.');

UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Free tier with unlimited recording and 5 AI summaries/month. Fathom now uses de-identified meeting data to train in-house AI models (opt-out available in account settings). Third-party AI providers (Anthropic, OpenAI, Google) contractually barred from training. SOC 2 Type II certified. HIPAA compliant.',
  overall_rating = 'caution'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Fathom') AND tier_name = 'Free';

UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Standard tier ($19/mo) with unlimited AI summaries. Opt-out for internal model training available. Third-party providers barred from training. SOC 2 Type II. Team admins can opt out org-wide.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Fathom') AND tier_name = 'Standard';

UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Pro tier ($39/mo) with Team Edition features. Org-wide training opt-out available for admins. Third-party providers barred from training. SOC 2 Type II. HIPAA compliant.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Fathom') AND tier_name = 'Pro';

INSERT INTO evaluation_changelog (tool_tier_id, previous_rating, new_rating, change_reason) VALUES
  ((SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'Fathom' AND tt.tier_name = 'Free'),
   'recommended', 'caution', 'Fathom privacy policy updated August 2025: de-identified meeting data may be used to train in-house models.');

UPDATE evaluations SET rating = 2, notes = 'De-identified data used for in-house model training (opt-out available). Third-party AI providers contractually barred from training. Opt-out not default.'
WHERE tool_tier_id = (SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'Fathom' AND tt.tier_name = 'Free') AND criteria_key = 'data_privacy';

UPDATE evaluations SET rating = 2, notes = 'Opt-out training on de-identified data. Third-party providers prohibited from training. Improved from "no training" but opt-out default is a concern.'
WHERE tool_tier_id = (SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'Fathom' AND tt.tier_name = 'Free') AND criteria_key = 'ethical_training';


-- =====================================================
-- BATCH 2: NEW TIERS — ChatGPT Go, NotebookLM Plus, Copilot Business
-- =====================================================

-- ChatGPT Free: update training policy
UPDATE tool_tiers SET
  data_training_policy = 'opt-out',
  rating_notes = 'Free tier trains on conversations by default. Opt-out available in Settings > Data Controls but disabling training also disables chat history on Free tier. Suitable for non-sensitive public content only.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'ChatGPT') AND tier_name = 'Free';

-- ChatGPT Go tier
DO $$
DECLARE
  chatgpt_id UUID;
  go_tier_id UUID;
BEGIN
  SELECT id INTO chatgpt_id FROM tools WHERE name = 'ChatGPT';
  IF NOT EXISTS (SELECT 1 FROM tool_tiers WHERE tool_id = chatgpt_id AND tier_name = 'Go') THEN
    INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
    VALUES (chatgpt_id, 'Go', 'caution',
      'New tier ($8/mo, launched January 2026). Trains on data by default, opt-out available. Sits between Free and Plus with higher usage limits.',
      'opt-out', false, false, null)
    RETURNING id INTO go_tier_id;

    INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
      (go_tier_id, 'data_privacy', 1, 'Trains on conversations by default. Opt-out available in Settings > Data Controls.'),
      (go_tier_id, 'security', 1, 'Basic security. No enterprise controls.'),
      (go_tier_id, 'tos', 2, 'Clear terms, user retains content rights.'),
      (go_tier_id, 'accessibility', 2, 'Generally accessible interface.'),
      (go_tier_id, 'pricing', 3, 'Affordable at $8/month.'),
      (go_tier_id, 'environmental', 1, 'High computational requirements, limited transparency.'),
      (go_tier_id, 'ethical_training', 1, 'Training data concerns, opt-out required.'),
      (go_tier_id, 'enterprise_controls', 0, 'No admin controls.'),
      (go_tier_id, 'sector_commitment', 2, 'OpenAI for Nonprofits: up to 75% off Business tier via Goodstack.');
  END IF;
END $$;

-- ChatGPT Enterprise: update nonprofit info
UPDATE tool_tiers SET
  rating_notes = 'Enterprise tier does not train on customer data. SOC 2 Type II, ISO 27001/27017/27018/27701 certified. SSO and full admin console. OpenAI for Nonprofits: up to 75% off Business tier ($8/user/month effective) via Goodstack verification.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'ChatGPT') AND tier_name = 'Enterprise';

-- NotebookLM Plus tier
DO $$
DECLARE
  nbklm_id UUID;
  plus_tier_id UUID;
BEGIN
  SELECT id INTO nbklm_id FROM tools WHERE name = 'NotebookLM';
  IF NOT EXISTS (SELECT 1 FROM tool_tiers WHERE tool_id = nbklm_id AND tier_name = 'Plus (Workspace)') THEN
    INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
    VALUES (nbklm_id, 'Plus (Workspace)', 'recommended',
      'Available via Google One AI Premium or Google Workspace. Enterprise-grade data protections: no model training on user data. Free for Google Workspace for Nonprofits users (up to 2,000 seats). Audio Overviews and Deep Research included.',
      'no', false, true, null)
    RETURNING id INTO plus_tier_id;

    INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
      (plus_tier_id, 'data_privacy', 3, 'No model training on user data. Enterprise-grade protections via Workspace.'),
      (plus_tier_id, 'security', 3, 'Google Workspace security: SOC 1/2/3, ISO 27001, ISO 42001.'),
      (plus_tier_id, 'tos', 3, 'Workspace terms apply. Core Service designation for education users.'),
      (plus_tier_id, 'accessibility', 2, 'Good web-based accessibility.'),
      (plus_tier_id, 'pricing', 3, 'Free for Workspace for Nonprofits users (up to 2,000 seats).'),
      (plus_tier_id, 'environmental', 2, 'Google carbon neutral commitment.'),
      (plus_tier_id, 'ethical_training', 3, 'No training on uploaded content or generated outputs.'),
      (plus_tier_id, 'enterprise_controls', 2, 'Workspace admin controls apply.'),
      (plus_tier_id, 'sector_commitment', 3, 'Free for nonprofits via Google Workspace for Nonprofits. Up to 2,000 users.');
  END IF;
END $$;

-- Microsoft Copilot Business tier
DO $$
DECLARE
  copilot_id UUID;
  biz_tier_id UUID;
BEGIN
  SELECT id INTO copilot_id FROM tools WHERE name = 'Microsoft Copilot';
  IF NOT EXISTS (SELECT 1 FROM tool_tiers WHERE tool_id = copilot_id AND tier_name = 'Business') THEN
    INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
    VALUES (copilot_id, 'Business', 'caution',
      'Copilot Business ($21/user/month, launched December 2025). Consumer-grade data handling. Training opt-out available. For enterprise-grade protections, use M365 Business tier instead.',
      'opt-out', false, false, null)
    RETURNING id INTO biz_tier_id;

    INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
      (biz_tier_id, 'data_privacy', 2, 'Training opt-out available. Does not include M365 tenant-level data isolation.'),
      (biz_tier_id, 'security', 2, 'Microsoft security infrastructure. Not M365 enterprise-grade controls.'),
      (biz_tier_id, 'tos', 2, 'Standard Microsoft consumer/business terms.'),
      (biz_tier_id, 'accessibility', 3, 'Strong accessibility across Microsoft products.'),
      (biz_tier_id, 'pricing', 2, '$21/user/month. No confirmed nonprofit discount yet.'),
      (biz_tier_id, 'environmental', 2, 'Microsoft carbon negative commitment since 2020.'),
      (biz_tier_id, 'ethical_training', 2, 'Opt-out available but not default.'),
      (biz_tier_id, 'enterprise_controls', 1, 'Limited admin controls compared to M365 Business tier.'),
      (biz_tier_id, 'sector_commitment', 2, 'Microsoft Philanthropies. No confirmed nonprofit pricing for this tier yet.');
  END IF;
END $$;


-- =====================================================
-- BATCH 3: UPGRADES — Gamma SOC 2, Perplexity HIPAA, Grammarly ISO
-- =====================================================

UPDATE tool_tiers SET soc2_certified = true
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Gamma') AND tier_name IN ('Business', 'Enterprise');

UPDATE tool_tiers SET
  overall_rating = 'recommended',
  rating_notes = 'Business tier with SOC 2 Type II certification (October 2025). No AI training on customer data. Enterprise-grade security controls.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Gamma') AND tier_name = 'Business';

UPDATE tool_tiers SET
  overall_rating = 'recommended',
  rating_notes = 'Enterprise tier with SOC 2 Type II certification (October 2025). Custom agreements. No AI training. Full admin controls.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Gamma') AND tier_name = 'Enterprise';

INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url)
SELECT (SELECT id FROM tools WHERE name = 'Gamma'), 'soc2', 'certification', 'certified', 'https://trust.gamma.app/'
WHERE NOT EXISTS (SELECT 1 FROM proxy_signals WHERE tool_id = (SELECT id FROM tools WHERE name = 'Gamma') AND source = 'soc2');

UPDATE tool_tiers SET
  rating_notes = 'Zero Data Retention (ZDR). Data not used for training. SSO, admin controls, HIPAA BAA available. SOC 2 Type II.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Perplexity') AND tier_name = 'Enterprise';

UPDATE tool_tiers SET
  rating_notes = 'Admin controls, team management. SOC 2 Type II, ISO 27001/27017/27018/27701, ISO/IEC 42001:2023 (AI management standard), HIPAA. Training can be disabled by admin.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Grammarly') AND tier_name = 'Business';

UPDATE tool_tiers SET
  rating_notes = 'Strong privacy controls with Zero Data Retention — now self-serve for all tiers via Console Data Controls. SOC 2 Type II certified. User owns all prompts and outputs. No training on user data. 10x more energy efficient than GPU inference.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Groq') AND tier_name = 'Free';


-- =====================================================
-- BATCH 4: CONTEXT UPDATES — Otter, DALL-E, Gemini, Zoom, Asana, Notion, Grok
-- =====================================================

-- Otter.ai lawsuit
UPDATE tools SET
  description = 'AI transcription service for meetings and conversations. Integrates with Zoom, Google Meet, and Microsoft Teams. Caution: facing active federal class-action lawsuit (Brewer v. Otter.ai, August 2025) alleging recording without all-participant consent.'
WHERE name = 'Otter.ai';

UPDATE tool_tiers SET
  rating_notes = 'Not Recommended: Free tier data used for model training. Subject of federal class-action lawsuit Brewer v. Otter.ai (Case No. 5:25-cv-06911, N.D. Cal., filed August 2025) alleging secret recording and processing of private conversations without all-participant consent. Claims invoke ECPA, CFAA, and California Invasion of Privacy Act.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Otter.ai') AND tier_name = 'Free';

UPDATE tool_tiers SET
  rating_notes = 'More features but individual Pro data may still be used for improvement. Caution: subject of active federal class-action lawsuit (Brewer v. Otter.ai, Case No. 5:25-cv-06911) alleging recording without all-participant consent.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Otter.ai') AND tier_name = 'Pro';

UPDATE tool_tiers SET
  rating_notes = 'Business and Enterprise accounts explicitly excluded from training. SOC 2 Type II compliant. Note: Otter.ai faces an active federal class-action lawsuit (Brewer v. Otter.ai, August 2025) alleging consent violations.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Otter.ai') AND tier_name = 'Business';

UPDATE evaluations SET
  rating = 0,
  notes = 'Active federal class-action lawsuit (Brewer v. Otter.ai, Case No. 5:25-cv-06911, N.D. Cal.) alleging violations of ECPA, CFAA, and California Invasion of Privacy Act.'
WHERE tool_tier_id = (SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'Otter.ai' AND tt.tier_name = 'Free') AND criteria_key = 'tos';

-- DALL-E deprecation
UPDATE tools SET
  description = 'AI image generation tool from OpenAI. DALL-E 3 API deprecated May 12, 2026. Successor gpt-image-1 supports Zero Data Retention (ZDR). ChatGPT Plus users already use gpt-image-1.5 since December 2025.'
WHERE name = 'DALL-E';

UPDATE tool_tiers SET
  rating_notes = 'DALL-E 3 API deprecated May 12, 2026. Successor gpt-image-1 supports Zero Data Retention (ZDR). For new implementations, use gpt-image-1 instead.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'DALL-E') AND tier_name = 'API';

UPDATE tool_tiers SET
  rating_notes = 'ChatGPT Plus now uses gpt-image-1.5 (since December 2025). Same data policies as ChatGPT Plus tier. ZDR supported on gpt-image-1 via API.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'DALL-E') AND tier_name = 'ChatGPT Plus';

-- Gemini nonprofit expansion
UPDATE tools SET
  description = 'Google''s AI assistant with multimodal capabilities. Integrates with Google Workspace. Google for Nonprofits includes Gemini, NotebookLM, Deep Research, and 10+ AI features free for up to 2,000 users with enterprise-grade data protections.'
WHERE name = 'Gemini';

UPDATE tool_tiers SET
  rating_notes = 'Enterprise controls with Google Workspace. Data NOT used for training public models. FedRAMP High (March 2025). Free for nonprofits via Google for Nonprofits (up to 2,000 users) with Gemini, NotebookLM, and Deep Research included.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Gemini') AND tier_name = 'Workspace';

-- Asana tier names
UPDATE tool_tiers SET tier_name = 'Personal'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Asana') AND tier_name = 'Basic';

UPDATE tool_tiers SET tier_name = 'Starter',
  rating_notes = 'Starter tier ($10.99/mo, formerly Premium). AI features use org metadata, not user-generated content. Third-party AI providers barred from training. Admin can disable AI entirely. Nonprofit pricing: 50% off.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Asana') AND tier_name = 'Premium';

UPDATE tool_tiers SET tier_name = 'Advanced',
  rating_notes = 'Advanced tier ($24.99/mo, formerly Business). AI features with third-party providers barred from training. Full admin controls. Nonprofit pricing: 50% off.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Asana') AND tier_name = 'Business';

UPDATE tools SET
  description = 'Project management platform with AI features. SOC 2 Type II certified. AI uses org metadata only — third-party AI providers contractually barred from training on customer data. Admins can disable AI on all paid tiers. 50% off for nonprofits.'
WHERE name = 'Asana';

-- Grok updates
UPDATE tool_tiers SET
  rating_notes = 'Grok Business ($30/user/month, launched December 2025). No training on customer data. SOC 2 Type II, GDPR/CCPA compliant. Note: Irish DPC opened formal inquiry into X/xAI EU data handling (April 2025). Fundamental model bias concerns remain.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Grok') AND tier_name = 'Business';

UPDATE tool_tiers SET
  rating_notes = 'Not Recommended: trains on user data by default on X platform. Opt-out buried in settings. Irish DPC opened formal statutory inquiry into X/xAI EU data handling. Multiple documented bias incidents. Environmental concerns with Memphis data center.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Grok') AND tier_name = 'Free';

-- Notion AI Plus tier (AI removed)
UPDATE tool_tiers SET
  rating_notes = 'Plus tier no longer includes Notion AI features (removed May 2025). AI is now exclusively available on Business ($20/user/month) and Enterprise plans. Nonprofit discount: 50% off Plus only ($5/user/month) via TechSoup.',
  overall_rating = 'caution'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Notion AI') AND tier_name = 'Plus';

-- Zoom AI Companion 3.0
UPDATE tool_tiers SET
  rating_notes = 'AI Companion included in paid plans at no extra cost. Zoom categorically does NOT use customer audio, video, chat, or attachments to train AI models. AI Companion 3.0 launched with agentic workflows — same data protections apply.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Zoom AI Companion') AND tier_name = 'Pro';

UPDATE tool_tiers SET
  rating_notes = 'Enterprise controls with categorical exclusion from AI training. AI Companion 3.0 with agentic workflows — no policy changes. FedRAMP Moderate (Zoom for Government). Zoom Cares: nonprofit discount for verified 501(c)(3) organizations.'
WHERE tool_id = (SELECT id FROM tools WHERE name = 'Zoom AI Companion') AND tier_name = 'Business';

-- ChatGPT nonprofit update
UPDATE evaluations SET
  rating = 3,
  notes = 'OpenAI for Nonprofits expanded 2026: up to 75% off Business tier ($8/user/month effective) via Goodstack verification.'
WHERE tool_tier_id = (SELECT tt.id FROM tool_tiers tt JOIN tools t ON tt.tool_id = t.id WHERE t.name = 'ChatGPT' AND tt.tier_name = 'Enterprise')
  AND criteria_key = 'sector_commitment';


-- =====================================================
-- BATCH 5: LAWSUIT DISCLOSURES IN TOOL DESCRIPTIONS
-- =====================================================

UPDATE tools SET
  description = 'AI-powered conversational assistant for writing, brainstorming, research, and general productivity tasks. One of the most widely used AI tools globally. OpenAI for Nonprofits offers up to 75% off Business pricing via Goodstack. Note: OpenAI faces consolidated copyright litigation (MDL, SDNY) and a class action over a 2025 data breach (OpenAI/Mixpanel).'
WHERE name = 'ChatGPT';

UPDATE tools SET
  description = 'AI assistant focused on being helpful, harmless, and honest. Known for strong writing capabilities and handling long documents. Claude for Nonprofits offers up to 75% off Team and Enterprise plans. Note: Anthropic settled Bartz v. Anthropic for $1.5B (Sept 2025, training on pirated ebooks) and faces BMG v. Anthropic (2026, music lyrics training).'
WHERE name = 'Claude';

UPDATE tools SET
  description = 'Google''s AI assistant with multimodal capabilities. Integrates with Google Workspace. Google for Nonprofits includes Gemini, NotebookLM, Deep Research, and 10+ AI features free for up to 2,000 users. Note: facing Thele v. Google LLC (N.D. Cal., Nov 2025) class action alleging Gemini was enabled across Gmail/Chat/Meet without user consent.'
WHERE name = 'Gemini';

UPDATE tools SET
  description = 'AI assistant integrated across Microsoft 365 apps including Word, Excel, PowerPoint, and Outlook. Enterprise-grade security with 20+ year nonprofit track record. Note: GitHub Copilot copyright litigation (N.D. Cal., 2022) remains active at 9th Circuit with surviving DMCA and CCPA claims.'
WHERE name = 'Microsoft Copilot';

UPDATE tools SET
  description = 'AI image generation tool accessed through Discord or web. Creates high-quality images from text prompts. All images public by default. Note: facing Disney & Universal v. Midjourney (June 2025) copyright infringement suit over training on copyrighted characters. Trial set for late 2026.'
WHERE name = 'Midjourney';

UPDATE tools SET
  description = 'AI-powered search engine that provides cited answers from web sources. Useful for research and fact-checking. SOC 2 Type II certified. HIPAA BAA available on Enterprise Pro. Note: class action filed April 2026 alleging Perplexity routes user queries to Meta and Google via hidden trackers without disclosure.'
WHERE name = 'Perplexity';

UPDATE tools SET
  description = 'AI writing assistant for grammar, spelling, tone, and style. Integrates with browsers, email, and document editors. SOC 2 Type II, ISO 27001, ISO/IEC 42001:2023, and HIPAA certified. Note: facing class action alleging "Expert Review" feature misappropriated journalist/author identities without consent.'
WHERE name = 'Grammarly';


-- =====================================================
-- FINAL: Update all review dates
-- =====================================================
UPDATE tool_tiers SET last_reviewed_at = NOW();
