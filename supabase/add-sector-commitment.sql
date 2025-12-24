-- Add Sector Commitment evaluations for all tool tiers
-- Based on research: AI Sector Commitment Research Brief, Vendor Nonprofit Commitment Scores,
-- and Sector Commitment Scoring Framework

-- Scoring Guide:
-- 3 = Sector Leader: Transformational commitment with 5+ year track record, dedicated teams, deep TechSoup/NTEN integration
-- 2 = Committed Partner: Material investment with active programs, sector partnerships, genuine engagement
-- 1 = Aware but Limited: Performative or transactional engagement, generic discounts, crisis-timed announcements
-- 0 = No Commitment: No nonprofit programs, discontinued support, or regressive policies

-- ===========================================
-- ChatGPT (OpenAI) - Score: 1
-- Crisis-timed nonprofit initiatives, grantwashing concerns, limited sector integration
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('11111111-1111-1111-1111-111111111112', 'sector_commitment', 1, 'OpenAI for Nonprofits announced post-layoffs (Jan 2024). Crisis-timed initiative with limited track record. No TechSoup partnership.'),
('11111111-1111-1111-1111-111111111113', 'sector_commitment', 1, 'Same crisis-timed nonprofit program. Generic API credits without sector expertise.'),
('11111111-1111-1111-1111-111111111114', 'sector_commitment', 1, 'Enterprise tier has same limited nonprofit commitment. No dedicated nonprofit team.');

-- ===========================================
-- Claude (Anthropic) - Score: 2
-- New but substantive program, genuine commitment indicators, growing sector engagement
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('22222222-2222-2222-2222-222222222223', 'sector_commitment', 2, 'Anthropic shows genuine nonprofit interest with Claude for Good initiative. New but substantive engagement.'),
('22222222-2222-2222-2222-222222222224', 'sector_commitment', 2, 'Active nonprofit community engagement. Growing TechSoup relationship. Not crisis-timed.'),
('22222222-2222-2222-2222-222222222225', 'sector_commitment', 2, 'Team tier includes nonprofit-friendly pricing. Building sector expertise.');

-- ===========================================
-- Microsoft Copilot - Score: 3
-- 20+ year track record, TechSoup validated, dedicated nonprofit teams, sector leader
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('33333333-3333-3333-3333-333333333334', 'sector_commitment', 3, 'Microsoft has 20+ year nonprofit commitment. Tech for Social Impact division. Deep TechSoup integration.'),
('33333333-3333-3333-3333-333333333335', 'sector_commitment', 3, 'Microsoft 365 for Nonprofits is gold standard. Dedicated nonprofit team, NTEN presence, sector-specific features.');

-- ===========================================
-- Gemini (Google) - Score: 3
-- 22+ years of nonprofit support, Google for Nonprofits, sector leader
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('44444444-4444-4444-4444-444444444445', 'sector_commitment', 3, 'Google for Nonprofits since 2003 (22+ years). Deep TechSoup partnership. Dedicated nonprofit team.'),
('44444444-4444-4444-4444-444444444446', 'sector_commitment', 3, 'Same sector-leading commitment. Google.org extends AI tools to nonprofits.'),
('44444444-4444-4444-4444-444444444447', 'sector_commitment', 3, 'Workspace for Nonprofits is comprehensive. Long-term sector investment with measurable outcomes.');

-- ===========================================
-- Perplexity - Score: 1
-- Limited nonprofit programs, no sector expertise
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('55555555-5555-5555-5555-555555555556', 'sector_commitment', 1, 'No formal nonprofit program. Limited sector awareness.'),
('55555555-5555-5555-5555-555555555557', 'sector_commitment', 1, 'Pro tier has no nonprofit discount or sector-specific features.');

-- ===========================================
-- Canva - Score: 3
-- 100% free for nonprofits, deep sector commitment, TechSoup validated
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('66666666-6666-6666-6666-666666666667', 'sector_commitment', 2, 'Free tier available to all. Canva for Nonprofits program shows commitment.'),
('66666666-6666-6666-6666-666666666668', 'sector_commitment', 3, 'Strong nonprofit program but requires verification.'),
('66666666-6666-6666-6666-666666666669', 'sector_commitment', 3, '100% free Canva Pro for verified nonprofits. TechSoup validated. Dedicated nonprofit resources and templates.');

-- ===========================================
-- Grammarly - Score: 0
-- Discontinued nonprofit program, regressive policies
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('77777777-7777-7777-7777-777777777778', 'sector_commitment', 0, 'Grammarly discontinued their nonprofit program. No current sector support.'),
('77777777-7777-7777-7777-777777777779', 'sector_commitment', 0, 'No nonprofit discount available. Program was discontinued.'),
('77777777-7777-7777-7777-77777777777a', 'sector_commitment', 0, 'Business tier has no nonprofit pricing. Regressive change from prior support.');

-- ===========================================
-- Otter.ai - Score: 1
-- Limited nonprofit focus, basic discounts only
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('88888888-8888-8888-8888-888888888889', 'sector_commitment', 1, 'Limited nonprofit awareness. No dedicated program.'),
('88888888-8888-8888-8888-88888888888a', 'sector_commitment', 1, 'Some nonprofit users but no formal program or sector expertise.'),
('88888888-8888-8888-8888-88888888888b', 'sector_commitment', 1, 'Business tier may offer case-by-case discounts but no formal program.');

-- ===========================================
-- Notion AI - Score: 2
-- Active nonprofit program, growing sector engagement
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('99999999-9999-9999-9999-99999999999a', 'sector_commitment', 2, 'Notion for Nonprofits offers discounted pricing. Growing sector presence.'),
('99999999-9999-9999-9999-99999999999b', 'sector_commitment', 2, 'Business tier has nonprofit pricing through application process.');

-- ===========================================
-- Zoom AI Companion - Score: 2
-- Good nonprofit pricing, sector engagement
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'sector_commitment', 2, 'Zoom for Nonprofits program with discounted pricing. Active sector engagement.'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'sector_commitment', 2, 'Business tier includes nonprofit pricing. TechSoup partnership for discounts.');

-- ===========================================
-- Midjourney - Score: 0
-- No nonprofit programs, no sector awareness
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'sector_commitment', 0, 'No nonprofit program or pricing. No sector awareness.'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'sector_commitment', 0, 'Pro tier has no nonprofit considerations. Discord-based with no organizational features.');

-- ===========================================
-- DALL-E (OpenAI) - Score: 1
-- Same OpenAI concerns, crisis-timed initiatives
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'sector_commitment', 1, 'OpenAI for Nonprofits applies but with limited track record and crisis-timed launch.'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'sector_commitment', 1, 'ChatGPT Plus access shares same limited nonprofit commitment.');

-- ===========================================
-- Fathom - Score: 2
-- Good value for nonprofits, emerging commitment
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'sector_commitment', 2, 'Generous free tier benefits nonprofits. Growing awareness of sector needs.'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'sector_commitment', 2, 'Reasonable pricing accessible to nonprofits. No formal program but good value.'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'sector_commitment', 2, 'Pro features at nonprofit-friendly pricing. Emerging sector commitment.');
