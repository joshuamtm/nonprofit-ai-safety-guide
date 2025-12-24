-- Trusted AI Tools Directory - Seed Data
-- Run this after schema.sql to populate with sample tools

-- ChatGPT
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('11111111-1111-1111-1111-111111111111', 'ChatGPT', 'OpenAI', 'AI-powered conversational assistant for writing, brainstorming, research, and general productivity tasks. One of the most widely used AI tools globally.', 'https://chat.openai.com', 'https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg', ARRAY['writing', 'productivity', 'research']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('11111111-1111-1111-1111-111111111112', '11111111-1111-1111-1111-111111111111', 'Free', 'caution', 'Free tier uses conversations for model training. Suitable for non-sensitive public content only.', 'yes', FALSE, FALSE, NULL),
  ('11111111-1111-1111-1111-111111111113', '11111111-1111-1111-1111-111111111111', 'Plus', 'caution', 'Plus tier still uses data for training by default but offers opt-out in settings.', 'opt-out', FALSE, FALSE, NULL),
  ('11111111-1111-1111-1111-111111111114', '11111111-1111-1111-1111-111111111111', 'Enterprise', 'approved', 'Enterprise tier does not train on customer data, includes SSO, and provides SOC 2 compliance.', 'no', TRUE, TRUE, NULL);

-- ChatGPT Free tier evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('11111111-1111-1111-1111-111111111112', 'data_privacy', 1, 'Data used for model training. No opt-out on free tier.'),
  ('11111111-1111-1111-1111-111111111112', 'security', 1, 'Basic security. No enterprise controls.'),
  ('11111111-1111-1111-1111-111111111112', 'tos', 2, 'Clear terms, user retains content rights.'),
  ('11111111-1111-1111-1111-111111111112', 'accessibility', 2, 'Generally accessible, some screen reader issues.'),
  ('11111111-1111-1111-1111-111111111112', 'pricing', 3, 'Free tier available with reasonable functionality.'),
  ('11111111-1111-1111-1111-111111111112', 'environmental', 1, 'High computational requirements, limited transparency.'),
  ('11111111-1111-1111-1111-111111111112', 'ethical_training', 1, 'Training data concerns, some transparency.'),
  ('11111111-1111-1111-1111-111111111112', 'enterprise_controls', 0, 'No admin controls on free tier.');

-- ChatGPT Enterprise tier evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('11111111-1111-1111-1111-111111111114', 'data_privacy', 3, 'No training on customer data, data processing agreements available.'),
  ('11111111-1111-1111-1111-111111111114', 'security', 3, 'SOC 2 Type II certified, SSO support, encryption.'),
  ('11111111-1111-1111-1111-111111111114', 'tos', 3, 'Enterprise agreement with custom terms.'),
  ('11111111-1111-1111-1111-111111111114', 'accessibility', 2, 'Generally accessible interface.'),
  ('11111111-1111-1111-1111-111111111114', 'pricing', 2, 'Enterprise pricing, no nonprofit discount published.'),
  ('11111111-1111-1111-1111-111111111114', 'environmental', 1, 'Some carbon offset commitments.'),
  ('11111111-1111-1111-1111-111111111114', 'ethical_training', 2, 'Improved transparency on enterprise tier.'),
  ('11111111-1111-1111-1111-111111111114', 'enterprise_controls', 3, 'Full admin console, usage analytics, SSO.');

-- Claude
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('22222222-2222-2222-2222-222222222222', 'Claude', 'Anthropic', 'AI assistant focused on being helpful, harmless, and honest. Known for strong writing capabilities and handling long documents.', 'https://claude.ai', 'https://upload.wikimedia.org/wikipedia/commons/1/15/Claude_AI_logo.svg', ARRAY['writing', 'research', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('22222222-2222-2222-2222-222222222223', '22222222-2222-2222-2222-222222222222', 'Free', 'caution', 'Free tier has usage limits but does not train on conversations by default.', 'no', FALSE, FALSE, NULL),
  ('22222222-2222-2222-2222-222222222224', '22222222-2222-2222-2222-222222222222', 'Pro', 'approved', 'Pro tier offers enhanced features without training on user data.', 'no', FALSE, TRUE, NULL),
  ('22222222-2222-2222-2222-222222222225', '22222222-2222-2222-2222-222222222222', 'Team', 'approved', 'Team tier includes admin controls, SSO, and data processing agreements.', 'no', TRUE, TRUE, NULL);

-- Claude Pro evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('22222222-2222-2222-2222-222222222224', 'data_privacy', 3, 'Does not train on user conversations.'),
  ('22222222-2222-2222-2222-222222222224', 'security', 2, 'Strong security practices, SOC 2 certified.'),
  ('22222222-2222-2222-2222-222222222224', 'tos', 3, 'User-friendly terms, clear data handling.'),
  ('22222222-2222-2222-2222-222222222224', 'accessibility', 2, 'Good accessibility, ongoing improvements.'),
  ('22222222-2222-2222-2222-222222222224', 'pricing', 2, 'Competitive pricing, no published nonprofit discount.'),
  ('22222222-2222-2222-2222-222222222224', 'environmental', 2, 'Anthropic has sustainability commitments.'),
  ('22222222-2222-2222-2222-222222222224', 'ethical_training', 3, 'Constitutional AI approach, transparency on training.'),
  ('22222222-2222-2222-2222-222222222224', 'enterprise_controls', 2, 'Usage tracking, some admin features.');

-- Microsoft Copilot
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('33333333-3333-3333-3333-333333333333', 'Microsoft Copilot', 'Microsoft', 'AI assistant integrated across Microsoft 365 apps including Word, Excel, PowerPoint, and Outlook. Enterprise-grade security.', 'https://copilot.microsoft.com', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Microsoft_365_Copilot_Icon.svg', ARRAY['writing', 'productivity', 'data']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('33333333-3333-3333-3333-333333333334', '33333333-3333-3333-3333-333333333333', 'Free', 'caution', 'Free web version with limited Microsoft 365 integration.', 'opt-out', FALSE, FALSE, NULL),
  ('33333333-3333-3333-3333-333333333335', '33333333-3333-3333-3333-333333333333', 'Microsoft 365', 'approved', 'Full integration with M365 apps, enterprise data protection.', 'no', TRUE, TRUE, 'authorized_moderate');

-- Microsoft Copilot M365 evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('33333333-3333-3333-3333-333333333335', 'data_privacy', 3, 'Data stays within M365 tenant, not used for training.'),
  ('33333333-3333-3333-3333-333333333335', 'security', 3, 'FedRAMP authorized, SOC 2, ISO 27001.'),
  ('33333333-3333-3333-3333-333333333335', 'tos', 2, 'Standard Microsoft enterprise agreement.'),
  ('33333333-3333-3333-3333-333333333335', 'accessibility', 3, 'Strong accessibility across Microsoft products.'),
  ('33333333-3333-3333-3333-333333333335', 'pricing', 3, 'Nonprofit pricing available through Microsoft.'),
  ('33333333-3333-3333-3333-333333333335', 'environmental', 2, 'Microsoft carbon negative commitment.'),
  ('33333333-3333-3333-3333-333333333335', 'ethical_training', 2, 'Training data transparency improving.'),
  ('33333333-3333-3333-3333-333333333335', 'enterprise_controls', 3, 'Full admin center integration, compliance tools.');

-- Gemini
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('44444444-4444-4444-4444-444444444444', 'Gemini', 'Google', 'Google''s AI assistant with multimodal capabilities. Integrates with Google Workspace and offers coding assistance.', 'https://gemini.google.com', 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Google_Gemini_logo.svg', ARRAY['writing', 'productivity', 'images', 'research']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('44444444-4444-4444-4444-444444444445', '44444444-4444-4444-4444-444444444444', 'Free', 'caution', 'Free tier may use conversations for improvement. Review privacy settings.', 'opt-out', FALSE, FALSE, NULL),
  ('44444444-4444-4444-4444-444444444446', '44444444-4444-4444-4444-444444444444', 'Advanced', 'caution', 'Advanced tier with more features but similar data policies.', 'opt-out', FALSE, FALSE, NULL),
  ('44444444-4444-4444-4444-444444444447', '44444444-4444-4444-4444-444444444444', 'Workspace', 'approved', 'Enterprise controls with Google Workspace integration.', 'no', TRUE, TRUE, 'authorized_moderate');

-- Perplexity
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('55555555-5555-5555-5555-555555555555', 'Perplexity', 'Perplexity AI', 'AI-powered search engine that provides cited answers from web sources. Useful for research and fact-checking.', 'https://perplexity.ai', NULL, ARRAY['research', 'writing']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('55555555-5555-5555-5555-555555555556', '55555555-5555-5555-5555-555555555555', 'Free', 'caution', 'Free tier with usage limits. Data practices improving.', 'unclear', FALSE, FALSE, NULL),
  ('55555555-5555-5555-5555-555555555557', '55555555-5555-5555-5555-555555555555', 'Pro', 'caution', 'Enhanced features, but enterprise controls limited.', 'opt-out', FALSE, FALSE, NULL);

-- Canva
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('66666666-6666-6666-6666-666666666666', 'Canva', 'Canva', 'Design platform with AI features including Magic Write for text generation and AI image tools. Popular for marketing materials.', 'https://canva.com', 'https://upload.wikimedia.org/wikipedia/en/3/3b/Canva_Logo.png', ARRAY['images', 'writing', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('66666666-6666-6666-6666-666666666667', '66666666-6666-6666-6666-666666666666', 'Free', 'caution', 'Free tier with limited AI features. Review content ownership terms.', 'opt-out', FALSE, FALSE, NULL),
  ('66666666-6666-6666-6666-666666666668', '66666666-6666-6666-6666-666666666666', 'Pro', 'approved', 'Full AI features with better content rights.', 'opt-out', FALSE, TRUE, NULL),
  ('66666666-6666-6666-6666-666666666669', '66666666-6666-6666-6666-666666666666', 'Nonprofits', 'approved', 'Free Canva Pro for eligible nonprofits through Canva for Nonprofits program.', 'opt-out', FALSE, TRUE, NULL);

-- Grammarly
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('77777777-7777-7777-7777-777777777777', 'Grammarly', 'Grammarly Inc.', 'AI writing assistant for grammar, spelling, tone, and style. Integrates with browsers, email, and document editors.', 'https://grammarly.com', 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Grammarly_logo.svg', ARRAY['writing', 'communication']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('77777777-7777-7777-7777-777777777778', '77777777-7777-7777-7777-777777777777', 'Free', 'caution', 'Basic corrections only. Review data practices carefully.', 'opt-out', FALSE, FALSE, NULL),
  ('77777777-7777-7777-7777-777777777779', '77777777-7777-7777-7777-777777777777', 'Premium', 'caution', 'Enhanced features but consumer-focused data practices.', 'opt-out', FALSE, FALSE, NULL),
  ('77777777-7777-7777-7777-77777777777a', '77777777-7777-7777-7777-777777777777', 'Business', 'approved', 'Admin controls, team management, improved data protection.', 'no', TRUE, TRUE, NULL);

-- Otter.ai
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('88888888-8888-8888-8888-888888888888', 'Otter.ai', 'Otter.ai Inc.', 'AI transcription service for meetings and conversations. Integrates with Zoom, Google Meet, and Microsoft Teams.', 'https://otter.ai', NULL, ARRAY['communication', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('88888888-8888-8888-8888-888888888889', '88888888-8888-8888-8888-888888888888', 'Free', 'not_recommended', 'Free tier has significant data sharing for training purposes.', 'yes', FALSE, FALSE, NULL),
  ('88888888-8888-8888-8888-88888888888a', '88888888-8888-8888-8888-888888888888', 'Pro', 'caution', 'More features but review data practices.', 'opt-out', FALSE, FALSE, NULL),
  ('88888888-8888-8888-8888-88888888888b', '88888888-8888-8888-8888-888888888888', 'Business', 'approved', 'Enterprise controls and data protection available.', 'no', TRUE, TRUE, NULL);

-- Otter.ai Free tier evaluations (showing "Not Recommended" example)
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
  ('88888888-8888-8888-8888-888888888889', 'data_privacy', 0, 'Transcripts used for model training on free tier.'),
  ('88888888-8888-8888-8888-888888888889', 'security', 1, 'Basic security measures only.'),
  ('88888888-8888-8888-8888-888888888889', 'tos', 1, 'Concerning data usage clauses.'),
  ('88888888-8888-8888-8888-888888888889', 'accessibility', 2, 'Reasonable accessibility.'),
  ('88888888-8888-8888-8888-888888888889', 'pricing', 3, 'Free tier available.'),
  ('88888888-8888-8888-8888-888888888889', 'environmental', 1, 'Limited environmental information.'),
  ('88888888-8888-8888-8888-888888888889', 'ethical_training', 0, 'Uses customer transcripts for training.'),
  ('88888888-8888-8888-8888-888888888889', 'enterprise_controls', 0, 'No admin controls on free tier.');

-- Notion AI
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('99999999-9999-9999-9999-999999999999', 'Notion AI', 'Notion Labs', 'AI writing assistant integrated into Notion workspace. Helps with summarization, writing, and brainstorming.', 'https://notion.so', 'https://upload.wikimedia.org/wikipedia/commons/4/45/Notion_app_logo.png', ARRAY['writing', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('99999999-9999-9999-9999-99999999999a', '99999999-9999-9999-9999-999999999999', 'Plus', 'caution', 'AI add-on for Notion. Review data practices.', 'opt-out', FALSE, TRUE, NULL),
  ('99999999-9999-9999-9999-99999999999b', '99999999-9999-9999-9999-999999999999', 'Business', 'approved', 'Enhanced admin controls and data protection.', 'no', TRUE, TRUE, NULL);

-- Zoom AI Companion
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Zoom AI Companion', 'Zoom', 'AI features within Zoom including meeting summaries, smart recording, and real-time transcription.', 'https://zoom.us', 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Zoom_Communications_Logo.svg', ARRAY['communication', 'productivity']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Pro', 'caution', 'Review AI data usage settings carefully.', 'opt-out', FALSE, TRUE, NULL),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Business', 'approved', 'Enterprise controls with opt-out from AI training.', 'no', TRUE, TRUE, 'authorized_moderate');

-- Midjourney (example of more cautious rating)
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Midjourney', 'Midjourney Inc.', 'AI image generation tool accessed through Discord. Creates high-quality images from text prompts.', 'https://midjourney.com', NULL, ARRAY['images']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Basic', 'caution', 'All images are public by default. Not suitable for confidential work.', 'yes', FALSE, FALSE, NULL),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Pro', 'caution', 'Stealth mode available for private images, but review terms.', 'yes', FALSE, FALSE, NULL);

-- DALL-E
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'DALL-E', 'OpenAI', 'AI image generation tool from OpenAI. Creates and edits images from natural language descriptions.', 'https://openai.com/dall-e-3', NULL, ARRAY['images']);

INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccd', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'API', 'caution', 'API access with usage-based pricing. Review data retention.', 'opt-out', FALSE, TRUE, NULL),
  ('cccccccc-cccc-cccc-cccc-ccccccccccce', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'ChatGPT Plus', 'caution', 'Accessed through ChatGPT Plus. Same data policies apply.', 'opt-out', FALSE, FALSE, NULL);

-- Proxy Signals examples
INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url) VALUES
  ('11111111-1111-1111-1111-111111111111', 'soc2', 'certification', 'certified', 'https://openai.com/security'),
  ('33333333-3333-3333-3333-333333333333', 'fedramp', 'authorization', 'authorized_moderate', 'https://marketplace.fedramp.gov'),
  ('33333333-3333-3333-3333-333333333333', 'soc2', 'certification', 'certified', 'https://microsoft.com/trust-center'),
  ('44444444-4444-4444-4444-444444444444', 'fedramp', 'authorization', 'authorized_moderate', 'https://marketplace.fedramp.gov'),
  ('22222222-2222-2222-2222-222222222222', 'soc2', 'certification', 'certified', 'https://anthropic.com/security'),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'fedramp', 'authorization', 'authorized_moderate', 'https://marketplace.fedramp.gov');
