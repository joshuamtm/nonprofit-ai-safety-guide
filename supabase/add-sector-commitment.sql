-- Add Sector Commitment evaluations for all tool tiers
-- Uses dynamic lookups to find correct tool_tier IDs
-- Based on research: AI Sector Commitment Research Brief, Vendor Nonprofit Commitment Scores

-- Scoring Guide:
-- 3 = Sector Leader: Transformational commitment with 5+ year track record
-- 2 = Committed Partner: Material investment with active programs
-- 1 = Aware but Limited: Performative or transactional engagement
-- 0 = No Commitment: No nonprofit programs or discontinued support

-- ===========================================
-- ChatGPT (OpenAI) - Score: 1
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 1, 'OpenAI for Nonprofits announced post-layoffs (Jan 2024). Crisis-timed initiative with limited track record. No TechSoup partnership.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'ChatGPT'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Claude (Anthropic) - Score: 2
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 2, 'Anthropic shows genuine nonprofit interest with Claude for Good initiative. New but substantive engagement. Growing TechSoup relationship.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Claude'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Microsoft Copilot - Score: 3
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 3, 'Microsoft has 20+ year nonprofit commitment. Tech for Social Impact division. Deep TechSoup integration. NTEN presence.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Microsoft Copilot'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Gemini (Google) - Score: 3
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 3, 'Google for Nonprofits since 2003 (22+ years). Deep TechSoup partnership. Dedicated nonprofit team. Google.org AI initiatives.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Gemini'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Perplexity - Score: 1
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 1, 'No formal nonprofit program. Limited sector awareness. No TechSoup partnership.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Perplexity'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Canva - Score: 3 for Nonprofits tier, 2 for others
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment',
  CASE WHEN tt.tier_name = 'Nonprofits' THEN 3 ELSE 2 END,
  CASE WHEN tt.tier_name = 'Nonprofits'
    THEN '100% free Canva Pro for verified nonprofits. TechSoup validated. Dedicated nonprofit resources and templates.'
    ELSE 'Canva for Nonprofits program shows commitment. TechSoup partnership available.'
  END
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Canva'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Grammarly - Score: 0
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 0, 'Grammarly discontinued their nonprofit program. No current sector support. Regressive change from prior support.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Grammarly'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Otter.ai - Score: 1
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 1, 'Limited nonprofit awareness. No dedicated program. Case-by-case discounts only.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Otter.ai'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Notion AI - Score: 2
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 2, 'Notion for Nonprofits offers discounted pricing. Growing sector presence and engagement.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Notion AI'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Zoom AI Companion - Score: 2
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 2, 'Zoom for Nonprofits program with discounted pricing. Active sector engagement. TechSoup partnership.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Zoom AI Companion'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Midjourney - Score: 0
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 0, 'No nonprofit program or pricing. No sector awareness. Discord-based with no organizational features.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Midjourney'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- DALL-E (OpenAI) - Score: 1
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 1, 'OpenAI for Nonprofits applies but with limited track record and crisis-timed launch.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'DALL-E'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Fathom - Score: 2
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 2, 'Generous free tier benefits nonprofits. Reasonable pricing accessible to sector. Growing awareness of nonprofit needs.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Fathom'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Google NotebookLM - Score: 3
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 3, 'Part of Google for Nonprofits ecosystem (22+ years). Free for all users. Deep TechSoup integration through Google.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Google NotebookLM'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');

-- ===========================================
-- Asana (if exists) - Score: 2
-- ===========================================
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes)
SELECT tt.id, 'sector_commitment', 2, 'Asana for Nonprofits program with 50% discount. Active nonprofit community engagement.'
FROM tool_tiers tt
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Asana'
AND NOT EXISTS (SELECT 1 FROM evaluations e WHERE e.tool_tier_id = tt.id AND e.criteria_key = 'sector_commitment');
