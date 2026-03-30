-- Trusted AI Tools Directory - Seed Data
-- Updated March 2026 with verified accuracy corrections
-- Run this after schema.sql to populate with evaluated tools

-- ChatGPT
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('11111111-1111-1111-1111-111111111111', 'ChatGPT', 'OpenAI', 'AI-powered conversational assistant for writing, brainstorming, research, and general productivity tasks. One of the most widely used AI tools globally. OpenAI for Nonprofits offers up to 75% off Enterprise pricing.', 'https://chat.openai.com', 'https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg', ARRAY['writing', 'productivity', 'research']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('11111111-1111-1111-1111-111111111112', '11111111-1111-1111-1111-111111111111', 'Free', 'caution', 'Free tier trains on conversations by default. Opt-out is available in Settings > Data Controls without losing chat history. Suitable for non-sensitive public content only.', 'opt-out', FALSE, FALSE, NULL),
  ('11111111-1111-1111-1111-111111111113', '11111111-1111-1111-1111-111111111111', 'Plus', 'caution', 'Plus tier trains on data by default but offers opt-out in settings. Does not lose chat history when opted out.', 'opt-out', FALSE, FALSE, NULL),
  ('11111111-1111-1111-1111-111111111114', '11111111-1111-1111-1111-111111111111', 'Enterprise', 'recommended', 'Enterprise tier does not train on customer data. SOC 2 Type II, ISO 27001/27017/27018/27701 certified. SSO and full admin console. Nonprofit pricing available (up to 75% off via OpenAI for Nonprofits through TechSoup/Goodstack, 150-seat minimum).', 'no', TRUE, TRUE, NULL);

-- ChatGPT Free tier evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('11111111-1111-1111-1111-111111111112', 'data_privacy', 1, 'Data used for model training by default. Opt-out now available without losing chat history.'),
  ('11111111-1111-1111-1111-111111111112', 'security', 1, 'Basic security. No enterprise controls.'),
  ('11111111-1111-1111-1111-111111111112', 'tos', 2, 'Clear terms, user retains content rights.'),
  ('11111111-1111-1111-1111-111111111112', 'accessibility', 2, 'Generally accessible, some screen reader issues.'),
  ('11111111-1111-1111-1111-111111111112', 'pricing', 3, 'Free tier available with reasonable functionality.'),
  ('11111111-1111-1111-1111-111111111112', 'environmental', 1, 'High computational requirements, limited transparency.'),
  ('11111111-1111-1111-1111-111111111112', 'ethical_training', 1, 'Training data concerns, some transparency.'),
  ('11111111-1111-1111-1111-111111111112', 'enterprise_controls', 0, 'No admin controls on free tier.'),
  ('11111111-1111-1111-1111-111111111112', 'sector_commitment', 2, 'OpenAI for Nonprofits program launched with TechSoup/Goodstack verification. Up to 75% off Enterprise.  Business tier at $8/user/month for nonprofits.');

-- ChatGPT Enterprise tier evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('11111111-1111-1111-1111-111111111114', 'data_privacy', 3, 'No training on customer data, data processing agreements available.'),
  ('11111111-1111-1111-1111-111111111114', 'security', 3, 'SOC 2 Type II certified, ISO 27001/27017/27018/27701, SSO support, encryption.'),
  ('11111111-1111-1111-1111-111111111114', 'tos', 3, 'Enterprise agreement with custom terms.'),
  ('11111111-1111-1111-1111-111111111114', 'accessibility', 2, 'Generally accessible interface.'),
  ('11111111-1111-1111-1111-111111111114', 'pricing', 2, 'Enterprise pricing. Nonprofit discount up to 75% via OpenAI for Nonprofits (150-seat minimum).'),
  ('11111111-1111-1111-1111-111111111114', 'environmental', 1, 'Some carbon offset commitments.'),
  ('11111111-1111-1111-1111-111111111114', 'ethical_training', 2, 'Improved transparency on enterprise tier.'),
  ('11111111-1111-1111-1111-111111111114', 'enterprise_controls', 3, 'Full admin console, usage analytics, SSO.'),
  ('11111111-1111-1111-1111-111111111114', 'sector_commitment', 2, 'OpenAI for Nonprofits launched via TechSoup/Goodstack. Formal program but relatively new.');

-- Claude
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('22222222-2222-2222-2222-222222222222', 'Claude', 'Anthropic', 'AI assistant focused on being helpful, harmless, and honest. Known for strong writing capabilities and handling long documents. Claude for Nonprofits offers up to 75% off Team and Enterprise plans.', 'https://claude.ai', 'https://upload.wikimedia.org/wikipedia/commons/1/15/Claude_AI_logo.svg', ARRAY['writing', 'research', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('22222222-2222-2222-2222-222222222223', '22222222-2222-2222-2222-222222222222', 'Free', 'caution', 'Free tier now uses conversations for training by default (changed September 2025). Opt-out available but must be actively selected.', 'opt-out', FALSE, FALSE, NULL),
  ('22222222-2222-2222-2222-222222222224', '22222222-2222-2222-2222-222222222222', 'Pro', 'caution', 'Pro tier ($20/mo) uses data for training by default (changed September 2025). Opt-out available. SOC 2 applies to API/Enterprise, not individual Pro.', 'opt-out', FALSE, FALSE, NULL),
  ('22222222-2222-2222-2222-222222222225', '22222222-2222-2222-2222-222222222222', 'Team', 'recommended', 'Team tier does NOT train on user data. Includes admin controls, SSO, and data processing agreements. SOC 2 Type II certified. Nonprofit pricing up to 75% off via Claude for Nonprofits.', 'no', TRUE, TRUE, NULL);

-- Claude Pro evaluations (updated for Sept 2025 policy change)
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('22222222-2222-2222-2222-222222222224', 'data_privacy', 2, 'Data used for training by default since September 2025. Opt-out available. Data retained up to 5 years if opted in.'),
  ('22222222-2222-2222-2222-222222222224', 'security', 2, 'Strong security practices. SOC 2 Type II applies to API/Enterprise platform, not individual Pro subscriptions.'),
  ('22222222-2222-2222-2222-222222222224', 'tos', 3, 'User-friendly terms, clear data handling disclosures.'),
  ('22222222-2222-2222-2222-222222222224', 'accessibility', 2, 'Good accessibility, ongoing improvements.'),
  ('22222222-2222-2222-2222-222222222224', 'pricing', 2, 'Competitive at $20/mo. No published nonprofit discount for Pro tier specifically.'),
  ('22222222-2222-2222-2222-222222222224', 'environmental', 2, 'Anthropic has sustainability commitments.'),
  ('22222222-2222-2222-2222-222222222224', 'ethical_training', 3, 'Constitutional AI approach, transparency on training methodology.'),
  ('22222222-2222-2222-2222-222222222224', 'enterprise_controls', 1, 'Limited admin features on Pro. Usage tracking available.'),
  ('22222222-2222-2222-2222-222222222224', 'sector_commitment', 2, 'Claude for Nonprofits launched late 2025: up to 75% off Team/Enterprise. Connectors to Blackbaud, Candid. Free AI Fluency for Nonprofits course.');

-- Microsoft Copilot
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('33333333-3333-3333-3333-333333333333', 'Microsoft Copilot', 'Microsoft', 'AI assistant integrated across Microsoft 365 apps including Word, Excel, PowerPoint, and Outlook. Enterprise-grade security with 20+ year nonprofit track record.', 'https://copilot.microsoft.com', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Microsoft_365_Copilot_Icon.svg', ARRAY['writing', 'productivity', 'data']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('33333333-3333-3333-3333-333333333334', '33333333-3333-3333-3333-333333333333', 'Free', 'caution', 'Free web version with limited Microsoft 365 integration.', 'opt-out', FALSE, FALSE, NULL),
  ('33333333-3333-3333-3333-333333333335', '33333333-3333-3333-3333-333333333333', 'Microsoft 365', 'recommended', 'Full integration with M365 apps. Data stays within M365 tenant, not used for training. FedRAMP High authorized (GCC High). Nonprofit pricing at $25.50/user/month. Note: Anthropic became a subprocessor for M365 Copilot starting January 2026.', 'no', TRUE, TRUE, 'authorized_high');

-- Microsoft Copilot M365 evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('33333333-3333-3333-3333-333333333335', 'data_privacy', 3, 'Data stays within M365 tenant, not used for training foundation models.'),
  ('33333333-3333-3333-3333-333333333335', 'security', 3, 'FedRAMP High authorized (GCC High Dec 2025), SOC 2, ISO 27001. Anthropic is a subprocessor as of Jan 2026.'),
  ('33333333-3333-3333-3333-333333333335', 'tos', 2, 'Standard Microsoft enterprise agreement.'),
  ('33333333-3333-3333-3333-333333333335', 'accessibility', 3, 'Strong accessibility across Microsoft products.'),
  ('33333333-3333-3333-3333-333333333335', 'pricing', 3, 'Nonprofit pricing at $25.50/user/month. Copilot Chat (basic) free with eligible M365 plans.'),
  ('33333333-3333-3333-3333-333333333335', 'environmental', 2, 'Microsoft carbon negative commitment since 2020.'),
  ('33333333-3333-3333-3333-333333333335', 'ethical_training', 2, 'Training data transparency improving.'),
  ('33333333-3333-3333-3333-333333333335', 'enterprise_controls', 3, 'Full admin center integration, compliance tools, DLP.'),
  ('33333333-3333-3333-3333-333333333335', 'sector_commitment', 3, 'Sector Leader: 20+ year nonprofit track record. Microsoft Philanthropies, TechSoup partnership, dedicated nonprofit teams, nonprofit-specific SKUs.');

-- Gemini
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('44444444-4444-4444-4444-444444444444', 'Gemini', 'Google', 'Google''s AI assistant with multimodal capabilities. Integrates with Google Workspace. Google for Nonprofits includes Gemini at no cost for up to 2,000 users.', 'https://gemini.google.com', 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Google_Gemini_logo.svg', ARRAY['writing', 'productivity', 'images', 'research']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('44444444-4444-4444-4444-444444444445', '44444444-4444-4444-4444-444444444444', 'Free', 'caution', 'Free personal Gemini may use conversations for model improvement. Opt-out via Gemini Apps Activity toggle. Important: Workspace nonprofit accounts do NOT train by default.', 'opt-out', FALSE, FALSE, NULL),
  ('44444444-4444-4444-4444-444444444446', '44444444-4444-4444-4444-444444444444', 'Advanced', 'caution', 'Advanced tier with more features. Same data policies as personal tier.', 'opt-out', FALSE, FALSE, NULL),
  ('44444444-4444-4444-4444-444444444447', '44444444-4444-4444-4444-444444444444', 'Workspace', 'recommended', 'Enterprise controls with Google Workspace. Data NOT used for training public models. First genAI for productivity to achieve FedRAMP High (March 2025).', 'no', TRUE, TRUE, 'authorized_high');

-- Perplexity
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('55555555-5555-5555-5555-555555555555', 'Perplexity', 'Perplexity AI', 'AI-powered search engine that provides cited answers from web sources. Useful for research and fact-checking. Now SOC 2 Type II certified.', 'https://perplexity.ai', NULL, ARRAY['research', 'writing']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('55555555-5555-5555-5555-555555555556', '55555555-5555-5555-5555-555555555555', 'Free', 'caution', 'Free tier with usage limits. Training enabled by default with opt-out toggle available in account settings.', 'opt-out', FALSE, FALSE, NULL),
  ('55555555-5555-5555-5555-555555555557', '55555555-5555-5555-5555-555555555555', 'Pro', 'caution', 'Enhanced features. Training enabled by default with opt-out available. SOC 2 Type II certified (April 2025).', 'opt-out', FALSE, TRUE, NULL),
  ('55555555-5555-5555-5555-555555555558', '55555555-5555-5555-5555-555555555555', 'Enterprise Pro', 'recommended', 'Zero Data Retention (ZDR). Data not used for training. SSO, admin controls, HIPAA-eligible. SOC 2 Type II.', 'no', TRUE, TRUE, NULL);

-- Canva
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('66666666-6666-6666-6666-666666666666', 'Canva', 'Canva', 'Design platform with AI features including Magic Write for text generation and AI image tools. Canva for Nonprofits provides free Canva Pro for eligible 501(c)(3) organizations.', 'https://canva.com', 'https://upload.wikimedia.org/wikipedia/en/3/3b/Canva_Logo.png', ARRAY['images', 'writing', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('66666666-6666-6666-6666-666666666667', '66666666-6666-6666-6666-666666666666', 'Free', 'caution', 'Free tier. AI content training requires OPT-IN (not on by default). User must explicitly allow content for AI training via Privacy Settings.', 'opt-out', FALSE, FALSE, NULL),
  ('66666666-6666-6666-6666-666666666668', '66666666-6666-6666-6666-666666666666', 'Pro', 'recommended', 'Full AI features. Content never used for AI training on Teams/Business/Enterprise/Education plans.', 'no', FALSE, TRUE, NULL),
  ('66666666-6666-6666-6666-666666666669', '66666666-6666-6666-6666-666666666666', 'Nonprofits', 'recommended', 'Free Canva Pro for eligible 501(c)(3) nonprofits through Canva for Nonprofits (up to 50 users, 100GB). SOC 2 Type II and ISO 27001 certified. Content never used for AI training.', 'no', FALSE, TRUE, NULL);

-- Grammarly
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('77777777-7777-7777-7777-777777777777', 'Grammarly', 'Grammarly Inc.', 'AI writing assistant for grammar, spelling, tone, and style. Integrates with browsers, email, and document editors. SOC 2, ISO 27001, and HIPAA certified.', 'https://grammarly.com', 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Grammarly_logo.svg', ARRAY['writing', 'communication']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('77777777-7777-7777-7777-777777777778', '77777777-7777-7777-7777-777777777777', 'Free', 'caution', 'Basic corrections only. Product Improvement and Training is ON by default. Users can opt out via account settings.', 'opt-out', FALSE, FALSE, NULL),
  ('77777777-7777-7777-7777-777777777779', '77777777-7777-7777-7777-777777777777', 'Premium', 'caution', 'Enhanced features. Training ON by default with opt-out available.', 'opt-out', FALSE, FALSE, NULL),
  ('77777777-7777-7777-7777-77777777777a', '77777777-7777-7777-7777-777777777777', 'Business', 'recommended', 'Admin controls, team management. SOC 2 Type II, ISO 27001/27017/27018/27701, HIPAA. Training can be disabled by admin.', 'opt-out', TRUE, TRUE, NULL);

-- Otter.ai
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('88888888-8888-8888-8888-888888888888', 'Otter.ai', 'Otter.ai Inc.', 'AI transcription service for meetings and conversations. Integrates with Zoom, Google Meet, and Microsoft Teams.', 'https://otter.ai', NULL, ARRAY['communication', 'productivity', 'meeting']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('88888888-8888-8888-8888-888888888889', '88888888-8888-8888-8888-888888888888', 'Free', 'not_recommended', 'Free tier data may be used for service improvement including model training. Not appropriate for sensitive organizational meetings.', 'yes', FALSE, FALSE, NULL),
  ('88888888-8888-8888-8888-88888888888a', '88888888-8888-8888-8888-888888888888', 'Pro', 'caution', 'More features. Individual Pro plan data may still be used for improvement.', 'opt-out', FALSE, FALSE, NULL),
  ('88888888-8888-8888-8888-88888888888b', '88888888-8888-8888-8888-888888888888', 'Business', 'recommended', 'Business and Enterprise accounts explicitly excluded from training. SOC 2 Type II compliant.', 'no', TRUE, TRUE, NULL);

-- Otter.ai Free tier evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('88888888-8888-8888-8888-888888888889', 'data_privacy', 0, 'Transcripts may be used for model training on free tier. Meeting content is highly sensitive.'),
  ('88888888-8888-8888-8888-888888888889', 'security', 1, 'Basic security measures.'),
  ('88888888-8888-8888-8888-888888888889', 'tos', 1, 'Concerning data usage clauses for free tier.'),
  ('88888888-8888-8888-8888-888888888889', 'accessibility', 2, 'Reasonable accessibility.'),
  ('88888888-8888-8888-8888-888888888889', 'pricing', 3, 'Free tier available.'),
  ('88888888-8888-8888-8888-888888888889', 'environmental', 1, 'Limited environmental information.'),
  ('88888888-8888-8888-8888-888888888889', 'ethical_training', 0, 'Uses customer transcripts for training on free/individual tiers.'),
  ('88888888-8888-8888-8888-888888888889', 'enterprise_controls', 0, 'No admin controls on free tier.'),
  ('88888888-8888-8888-8888-888888888889', 'sector_commitment', 0, 'No specific nonprofit programs or pricing identified.');

-- Notion AI
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('99999999-9999-9999-9999-999999999999', 'Notion AI', 'Notion Labs', 'AI writing assistant integrated into Notion workspace. Helps with summarization, writing, and brainstorming. SOC 2 Type II and ISO 27001 certified.', 'https://notion.so', 'https://upload.wikimedia.org/wikipedia/commons/4/45/Notion_app_logo.png', ARRAY['writing', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('99999999-9999-9999-9999-99999999999a', '99999999-9999-9999-9999-999999999999', 'Plus', 'caution', 'AI add-on for Notion. LLM subprocessors prohibited from using customer data for training. Non-Enterprise: providers retain data up to 30 days.', 'no', FALSE, TRUE, NULL),
  ('99999999-9999-9999-9999-99999999999b', '99999999-9999-9999-9999-999999999999', 'Business', 'recommended', 'Enhanced admin controls. SOC 2 Type II, ISO 27001. Enterprise workspaces: Zero Data Retention with LLM providers. HIPAA available.', 'no', TRUE, TRUE, NULL);

-- Zoom AI Companion
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Zoom AI Companion', 'Zoom', 'AI features within Zoom including meeting summaries, smart recording, and real-time transcription. Zoom does NOT use customer content to train AI models. Included free in paid plans. Zoom Cares offers up to 50% off for nonprofits.', 'https://zoom.us', 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Zoom_Communications_Logo.svg', ARRAY['communication', 'productivity', 'meeting']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Pro', 'caution', 'AI Companion included in paid plans at no extra cost. Zoom categorically does NOT use customer audio, video, chat, or attachments to train AI models. FedRAMP Moderate applies to Zoom for Government platform only, not standard commercial.', 'no', FALSE, TRUE, NULL),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Business', 'recommended', 'Enterprise controls with categorical exclusion from AI training. FedRAMP Moderate (Zoom for Government). Zoom Cares: up to 50% off for 501(c)(3) orgs with budgets under $10M.', 'no', TRUE, TRUE, 'authorized_moderate');

-- Midjourney
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Midjourney', 'Midjourney Inc.', 'AI image generation tool accessed through Discord or web. Creates high-quality images from text prompts. All images public by default.', 'https://midjourney.com', NULL, ARRAY['images']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Basic', 'caution', 'All images public by default and appear on Explore page. Not suitable for confidential work.', 'yes', FALSE, FALSE, NULL),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Pro', 'caution', 'Stealth mode available ($60/mo) to hide images on midjourney.com. Note: stealth does NOT hide images in shared Discord channels. Use private Discord servers or web Create page for true privacy.', 'yes', FALSE, FALSE, NULL);

-- DALL-E
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'DALL-E', 'OpenAI', 'AI image generation tool from OpenAI. Note: DALL-E 3 API is scheduled for deprecation May 12, 2026. Successor is gpt-image-1.', 'https://openai.com/dall-e-3', NULL, ARRAY['images']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccd', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'API', 'caution', 'API access with usage-based pricing. DALL-E 3 does NOT support Zero Data Retention (ZDR). Only gpt-image-1 (successor) supports ZDR. DALL-E 3 API deprecating May 2026.', 'opt-out', FALSE, TRUE, NULL),
  ('cccccccc-cccc-cccc-cccc-ccccccccccce', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'ChatGPT Plus', 'caution', 'Accessed through ChatGPT Plus. Same data policies as ChatGPT Plus tier.', 'opt-out', FALSE, FALSE, NULL);

-- Fathom (NEW - added based on research)
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'Fathom', 'Fathom Video Inc.', 'AI meeting notetaker with free unlimited recording and 5 AI summaries/month on free tier. Strongest privacy posture in the meeting AI category: data NOT used for training, SOC 2 Type II certified. Recommended by RoundTable Technology for nonprofits.', 'https://fathom.video', NULL, ARRAY['communication', 'meeting', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'Free', 'recommended', 'Free tier with unlimited recording and 5 AI summaries/month. Data NOT used for training. SOC 2 Type II certified even on free tier. Exceptional privacy posture.', 'no', FALSE, TRUE, NULL),
  ('dddddddd-dddd-dddd-dddd-ddddddddddef', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'Standard', 'recommended', 'Unlimited AI summaries, CRM integrations. Same strong privacy posture. SOC 2 Type II.', 'no', FALSE, TRUE, NULL);

-- Fathom Free tier evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'data_privacy', 3, 'Data NOT used for training even on free tier. Exceptional for this category.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'security', 2, 'SOC 2 Type II certified. Strong security practices.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'tos', 3, 'Clear terms. User retains all content rights.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'accessibility', 2, 'Good accessibility for web-based tool.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'pricing', 3, 'Generous free tier with unlimited recording. 5 AI summaries/month.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'environmental', 1, 'Limited environmental information available.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'ethical_training', 3, 'Does not train on customer data at any tier.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'enterprise_controls', 1, 'Limited admin features on free tier.'),
  ('dddddddd-dddd-dddd-dddd-ddddddddddde', 'sector_commitment', 1, 'No specific nonprofit pricing. Recommended by nonprofit tech advisors.');

-- Proxy Signals
INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url) VALUES
  ('11111111-1111-1111-1111-111111111111', 'soc2', 'certification', 'certified', 'https://openai.com/security'),
  ('33333333-3333-3333-3333-333333333333', 'fedramp', 'authorization', 'authorized_high', 'https://marketplace.fedramp.gov'),
  ('33333333-3333-3333-3333-333333333333', 'soc2', 'certification', 'certified', 'https://microsoft.com/trust-center'),
  ('44444444-4444-4444-4444-444444444444', 'fedramp', 'authorization', 'authorized_high', 'https://marketplace.fedramp.gov'),
  ('22222222-2222-2222-2222-222222222222', 'soc2', 'certification', 'certified', 'https://anthropic.com/security'),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'fedramp', 'authorization', 'authorized_moderate', 'https://marketplace.fedramp.gov'),
  ('55555555-5555-5555-5555-555555555555', 'soc2', 'certification', 'certified', 'https://docs.perplexity.ai/guides/privacy-security'),
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'soc2', 'certification', 'certified', 'https://fathom.video/security');
