-- Add missing evaluations for all tool tiers
-- Claude Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('22222222-2222-2222-2222-222222222223', 'data_privacy', 2, 'Clear privacy policy, data may be used for training unless opted out'),
('22222222-2222-2222-2222-222222222223', 'security', 2, 'SOC 2 Type II certified'),
('22222222-2222-2222-2222-222222222223', 'tos', 2, 'Generally fair terms'),
('22222222-2222-2222-2222-222222222223', 'accessibility', 2, 'Good accessibility features'),
('22222222-2222-2222-2222-222222222223', 'pricing', 3, 'Free tier available'),
('22222222-2222-2222-2222-222222222223', 'environmental', 2, 'Carbon neutral commitment'),
('22222222-2222-2222-2222-222222222223', 'ethical_training', 2, 'Constitutional AI approach'),
('22222222-2222-2222-2222-222222222223', 'enterprise_controls', 0, 'Limited in free tier');

-- Claude Pro
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('22222222-2222-2222-2222-222222222224', 'data_privacy', 2, 'Data not used for training by default'),
('22222222-2222-2222-2222-222222222224', 'security', 2, 'SOC 2 Type II certified'),
('22222222-2222-2222-2222-222222222224', 'tos', 2, 'Generally fair terms'),
('22222222-2222-2222-2222-222222222224', 'accessibility', 2, 'Good accessibility features'),
('22222222-2222-2222-2222-222222222224', 'pricing', 2, 'Reasonable pricing'),
('22222222-2222-2222-2222-222222222224', 'environmental', 2, 'Carbon neutral commitment'),
('22222222-2222-2222-2222-222222222224', 'ethical_training', 2, 'Constitutional AI approach'),
('22222222-2222-2222-2222-222222222224', 'enterprise_controls', 1, 'Basic controls available');

-- Claude Team
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('22222222-2222-2222-2222-222222222225', 'data_privacy', 3, 'Data not used for training, strong privacy controls'),
('22222222-2222-2222-2222-222222222225', 'security', 3, 'SOC 2 Type II, enterprise-grade security'),
('22222222-2222-2222-2222-222222222225', 'tos', 3, 'Business-friendly terms'),
('22222222-2222-2222-2222-222222222225', 'accessibility', 2, 'Good accessibility features'),
('22222222-2222-2222-2222-222222222225', 'pricing', 2, 'Team pricing available'),
('22222222-2222-2222-2222-222222222225', 'environmental', 2, 'Carbon neutral commitment'),
('22222222-2222-2222-2222-222222222225', 'ethical_training', 2, 'Constitutional AI approach'),
('22222222-2222-2222-2222-222222222225', 'enterprise_controls', 3, 'Full admin controls, SSO');

-- Microsoft Copilot Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('33333333-3333-3333-3333-333333333334', 'data_privacy', 1, 'Data may be used for improvement'),
('33333333-3333-3333-3333-333333333334', 'security', 2, 'Microsoft security standards'),
('33333333-3333-3333-3333-333333333334', 'tos', 2, 'Standard Microsoft terms'),
('33333333-3333-3333-3333-333333333334', 'accessibility', 3, 'Strong accessibility commitment'),
('33333333-3333-3333-3333-333333333334', 'pricing', 3, 'Free tier available'),
('33333333-3333-3333-3333-333333333334', 'environmental', 2, 'Microsoft carbon negative pledge'),
('33333333-3333-3333-3333-333333333334', 'ethical_training', 2, 'Responsible AI principles'),
('33333333-3333-3333-3333-333333333334', 'enterprise_controls', 0, 'No enterprise controls in free tier');

-- Microsoft Copilot M365
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('33333333-3333-3333-3333-333333333335', 'data_privacy', 3, 'Data stays within tenant'),
('33333333-3333-3333-3333-333333333335', 'security', 3, 'Full Microsoft 365 security'),
('33333333-3333-3333-3333-333333333335', 'tos', 3, 'Enterprise agreement'),
('33333333-3333-3333-3333-333333333335', 'accessibility', 3, 'Strong accessibility commitment'),
('33333333-3333-3333-3333-333333333335', 'pricing', 1, 'Premium pricing required'),
('33333333-3333-3333-3333-333333333335', 'environmental', 2, 'Microsoft carbon negative pledge'),
('33333333-3333-3333-3333-333333333335', 'ethical_training', 2, 'Responsible AI principles'),
('33333333-3333-3333-3333-333333333335', 'enterprise_controls', 3, 'Full enterprise controls');

-- Gemini Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('44444444-4444-4444-4444-444444444445', 'data_privacy', 1, 'Conversations may be used for training'),
('44444444-4444-4444-4444-444444444445', 'security', 2, 'Google security infrastructure'),
('44444444-4444-4444-4444-444444444445', 'tos', 2, 'Standard Google terms'),
('44444444-4444-4444-4444-444444444445', 'accessibility', 2, 'Moderate accessibility features'),
('44444444-4444-4444-4444-444444444445', 'pricing', 3, 'Free tier available'),
('44444444-4444-4444-4444-444444444445', 'environmental', 2, 'Google carbon neutral'),
('44444444-4444-4444-4444-444444444445', 'ethical_training', 1, 'Training data concerns'),
('44444444-4444-4444-4444-444444444445', 'enterprise_controls', 0, 'No enterprise controls');

-- Gemini Advanced
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('44444444-4444-4444-4444-444444444446', 'data_privacy', 2, 'Opt-out available'),
('44444444-4444-4444-4444-444444444446', 'security', 2, 'Google security infrastructure'),
('44444444-4444-4444-4444-444444444446', 'tos', 2, 'Standard Google terms'),
('44444444-4444-4444-4444-444444444446', 'accessibility', 2, 'Moderate accessibility features'),
('44444444-4444-4444-4444-444444444446', 'pricing', 2, 'Google One subscription required'),
('44444444-4444-4444-4444-444444444446', 'environmental', 2, 'Google carbon neutral'),
('44444444-4444-4444-4444-444444444446', 'ethical_training', 1, 'Training data concerns'),
('44444444-4444-4444-4444-444444444446', 'enterprise_controls', 1, 'Basic controls');

-- Gemini Workspace
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('44444444-4444-4444-4444-444444444447', 'data_privacy', 3, 'Enterprise data isolation'),
('44444444-4444-4444-4444-444444444447', 'security', 3, 'Google Workspace security'),
('44444444-4444-4444-4444-444444444447', 'tos', 3, 'Enterprise agreement'),
('44444444-4444-4444-4444-444444444447', 'accessibility', 2, 'Moderate accessibility features'),
('44444444-4444-4444-4444-444444444447', 'pricing', 1, 'Premium Workspace required'),
('44444444-4444-4444-4444-444444444447', 'environmental', 2, 'Google carbon neutral'),
('44444444-4444-4444-4444-444444444447', 'ethical_training', 2, 'Enterprise safeguards'),
('44444444-4444-4444-4444-444444444447', 'enterprise_controls', 3, 'Full admin controls');

-- Perplexity Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('55555555-5555-5555-5555-555555555556', 'data_privacy', 2, 'Clear privacy policy'),
('55555555-5555-5555-5555-555555555556', 'security', 2, 'Standard security practices'),
('55555555-5555-5555-5555-555555555556', 'tos', 2, 'Reasonable terms'),
('55555555-5555-5555-5555-555555555556', 'accessibility', 2, 'Basic accessibility'),
('55555555-5555-5555-5555-555555555556', 'pricing', 3, 'Free tier available'),
('55555555-5555-5555-5555-555555555556', 'environmental', 1, 'No stated environmental policy'),
('55555555-5555-5555-5555-555555555556', 'ethical_training', 2, 'Sources citations'),
('55555555-5555-5555-5555-555555555556', 'enterprise_controls', 0, 'No enterprise controls');

-- Perplexity Pro
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('55555555-5555-5555-5555-555555555557', 'data_privacy', 2, 'Opt-out available'),
('55555555-5555-5555-5555-555555555557', 'security', 2, 'Standard security practices'),
('55555555-5555-5555-5555-555555555557', 'tos', 2, 'Reasonable terms'),
('55555555-5555-5555-5555-555555555557', 'accessibility', 2, 'Basic accessibility'),
('55555555-5555-5555-5555-555555555557', 'pricing', 2, 'Affordable pro pricing'),
('55555555-5555-5555-5555-555555555557', 'environmental', 1, 'No stated environmental policy'),
('55555555-5555-5555-5555-555555555557', 'ethical_training', 2, 'Sources citations'),
('55555555-5555-5555-5555-555555555557', 'enterprise_controls', 1, 'Basic controls');

-- Canva Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('66666666-6666-6666-6666-666666666667', 'data_privacy', 1, 'Content may be used for AI training'),
('66666666-6666-6666-6666-666666666667', 'security', 2, 'Standard security practices'),
('66666666-6666-6666-6666-666666666667', 'tos', 1, 'Broad content license'),
('66666666-6666-6666-6666-666666666667', 'accessibility', 2, 'Good accessibility features'),
('66666666-6666-6666-6666-666666666667', 'pricing', 3, 'Free tier available'),
('66666666-6666-6666-6666-666666666667', 'environmental', 2, 'Climate action commitment'),
('66666666-6666-6666-6666-666666666667', 'ethical_training', 1, 'Training data concerns'),
('66666666-6666-6666-6666-666666666667', 'enterprise_controls', 0, 'No enterprise controls');

-- Canva Pro
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('66666666-6666-6666-6666-666666666668', 'data_privacy', 2, 'Opt-out from AI training available'),
('66666666-6666-6666-6666-666666666668', 'security', 2, 'Standard security practices'),
('66666666-6666-6666-6666-666666666668', 'tos', 2, 'Clearer content ownership'),
('66666666-6666-6666-6666-666666666668', 'accessibility', 2, 'Good accessibility features'),
('66666666-6666-6666-6666-666666666668', 'pricing', 2, 'Reasonable pricing'),
('66666666-6666-6666-6666-666666666668', 'environmental', 2, 'Climate action commitment'),
('66666666-6666-6666-6666-666666666668', 'ethical_training', 1, 'Training data concerns'),
('66666666-6666-6666-6666-666666666668', 'enterprise_controls', 1, 'Basic brand controls');

-- Canva Nonprofits
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('66666666-6666-6666-6666-666666666669', 'data_privacy', 2, 'Opt-out from AI training available'),
('66666666-6666-6666-6666-666666666669', 'security', 2, 'Standard security practices'),
('66666666-6666-6666-6666-666666666669', 'tos', 2, 'Nonprofit-friendly terms'),
('66666666-6666-6666-6666-666666666669', 'accessibility', 2, 'Good accessibility features'),
('66666666-6666-6666-6666-666666666669', 'pricing', 3, 'Free for verified nonprofits'),
('66666666-6666-6666-6666-666666666669', 'environmental', 2, 'Climate action commitment'),
('66666666-6666-6666-6666-666666666669', 'ethical_training', 1, 'Training data concerns'),
('66666666-6666-6666-6666-666666666669', 'enterprise_controls', 2, 'Team management features');

-- Grammarly Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('77777777-7777-7777-7777-777777777778', 'data_privacy', 1, 'Text processed on servers'),
('77777777-7777-7777-7777-777777777778', 'security', 2, 'SOC 2 Type II certified'),
('77777777-7777-7777-7777-777777777778', 'tos', 2, 'Standard terms'),
('77777777-7777-7777-7777-777777777778', 'accessibility', 2, 'Browser extension accessibility'),
('77777777-7777-7777-7777-777777777778', 'pricing', 3, 'Free tier available'),
('77777777-7777-7777-7777-777777777778', 'environmental', 1, 'No stated policy'),
('77777777-7777-7777-7777-777777777778', 'ethical_training', 2, 'Focus on writing assistance'),
('77777777-7777-7777-7777-777777777778', 'enterprise_controls', 0, 'No enterprise controls');

-- Grammarly Premium
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('77777777-7777-7777-7777-777777777779', 'data_privacy', 2, 'More control over data'),
('77777777-7777-7777-7777-777777777779', 'security', 2, 'SOC 2 Type II certified'),
('77777777-7777-7777-7777-777777777779', 'tos', 2, 'Standard terms'),
('77777777-7777-7777-7777-777777777779', 'accessibility', 2, 'Browser extension accessibility'),
('77777777-7777-7777-7777-777777777779', 'pricing', 2, 'Reasonable premium pricing'),
('77777777-7777-7777-7777-777777777779', 'environmental', 1, 'No stated policy'),
('77777777-7777-7777-7777-777777777779', 'ethical_training', 2, 'Focus on writing assistance'),
('77777777-7777-7777-7777-777777777779', 'enterprise_controls', 1, 'Some admin features');

-- Grammarly Business
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('77777777-7777-7777-7777-77777777777a', 'data_privacy', 3, 'Enterprise data controls'),
('77777777-7777-7777-7777-77777777777a', 'security', 3, 'SOC 2 Type II, enterprise security'),
('77777777-7777-7777-7777-77777777777a', 'tos', 3, 'Business agreement'),
('77777777-7777-7777-7777-77777777777a', 'accessibility', 2, 'Browser extension accessibility'),
('77777777-7777-7777-7777-77777777777a', 'pricing', 1, 'Per-seat business pricing'),
('77777777-7777-7777-7777-77777777777a', 'environmental', 1, 'No stated policy'),
('77777777-7777-7777-7777-77777777777a', 'ethical_training', 2, 'Focus on writing assistance'),
('77777777-7777-7777-7777-77777777777a', 'enterprise_controls', 3, 'Full admin console, SSO');

-- Otter.ai Free
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('88888888-8888-8888-8888-888888888889', 'data_privacy', 1, 'Audio processed and stored'),
('88888888-8888-8888-8888-888888888889', 'security', 2, 'Standard security'),
('88888888-8888-8888-8888-888888888889', 'tos', 2, 'Standard terms'),
('88888888-8888-8888-8888-888888888889', 'accessibility', 2, 'Transcription aids accessibility'),
('88888888-8888-8888-8888-888888888889', 'pricing', 3, 'Free tier available'),
('88888888-8888-8888-8888-888888888889', 'environmental', 1, 'No stated policy'),
('88888888-8888-8888-8888-888888888889', 'ethical_training', 2, 'Meeting-focused'),
('88888888-8888-8888-8888-888888888889', 'enterprise_controls', 0, 'No enterprise controls');

-- Otter.ai Pro
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('88888888-8888-8888-8888-88888888888a', 'data_privacy', 2, 'More data controls'),
('88888888-8888-8888-8888-88888888888a', 'security', 2, 'Standard security'),
('88888888-8888-8888-8888-88888888888a', 'tos', 2, 'Standard terms'),
('88888888-8888-8888-8888-88888888888a', 'accessibility', 2, 'Transcription aids accessibility'),
('88888888-8888-8888-8888-88888888888a', 'pricing', 2, 'Reasonable pro pricing'),
('88888888-8888-8888-8888-88888888888a', 'environmental', 1, 'No stated policy'),
('88888888-8888-8888-8888-88888888888a', 'ethical_training', 2, 'Meeting-focused'),
('88888888-8888-8888-8888-88888888888a', 'enterprise_controls', 1, 'Basic team features');

-- Otter.ai Business
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('88888888-8888-8888-8888-88888888888b', 'data_privacy', 2, 'Business data controls'),
('88888888-8888-8888-8888-88888888888b', 'security', 2, 'SOC 2 Type II'),
('88888888-8888-8888-8888-88888888888b', 'tos', 2, 'Business terms'),
('88888888-8888-8888-8888-88888888888b', 'accessibility', 2, 'Transcription aids accessibility'),
('88888888-8888-8888-8888-88888888888b', 'pricing', 2, 'Per-seat pricing'),
('88888888-8888-8888-8888-88888888888b', 'environmental', 1, 'No stated policy'),
('88888888-8888-8888-8888-88888888888b', 'ethical_training', 2, 'Meeting-focused'),
('88888888-8888-8888-8888-88888888888b', 'enterprise_controls', 2, 'Admin controls available');

-- Notion AI Plus
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('99999999-9999-9999-9999-99999999999a', 'data_privacy', 2, 'Data used within workspace only'),
('99999999-9999-9999-9999-99999999999a', 'security', 2, 'SOC 2 Type II certified'),
('99999999-9999-9999-9999-99999999999a', 'tos', 2, 'Reasonable terms'),
('99999999-9999-9999-9999-99999999999a', 'accessibility', 2, 'Good accessibility'),
('99999999-9999-9999-9999-99999999999a', 'pricing', 2, 'Add-on pricing'),
('99999999-9999-9999-9999-99999999999a', 'environmental', 1, 'No stated policy'),
('99999999-9999-9999-9999-99999999999a', 'ethical_training', 2, 'Workspace AI assistance'),
('99999999-9999-9999-9999-99999999999a', 'enterprise_controls', 1, 'Basic controls');

-- Notion AI Business
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('99999999-9999-9999-9999-99999999999b', 'data_privacy', 3, 'Enterprise data controls'),
('99999999-9999-9999-9999-99999999999b', 'security', 3, 'SOC 2 Type II, enterprise security'),
('99999999-9999-9999-9999-99999999999b', 'tos', 3, 'Business agreement'),
('99999999-9999-9999-9999-99999999999b', 'accessibility', 2, 'Good accessibility'),
('99999999-9999-9999-9999-99999999999b', 'pricing', 2, 'Business pricing'),
('99999999-9999-9999-9999-99999999999b', 'environmental', 1, 'No stated policy'),
('99999999-9999-9999-9999-99999999999b', 'ethical_training', 2, 'Workspace AI assistance'),
('99999999-9999-9999-9999-99999999999b', 'enterprise_controls', 3, 'Full admin controls, SSO');

-- Zoom AI Companion Pro
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'data_privacy', 2, 'Meeting data processing'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'security', 2, 'E2EE available'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'tos', 2, 'Standard Zoom terms'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'accessibility', 3, 'Strong accessibility features'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'pricing', 2, 'Included with Zoom plans'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'environmental', 1, 'No stated policy'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'ethical_training', 2, 'Meeting-focused AI'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', 'enterprise_controls', 2, 'Admin controls available');

-- Zoom AI Companion Business
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'data_privacy', 3, 'Enterprise data controls'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'security', 3, 'E2EE, SOC 2 Type II'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'tos', 3, 'Business agreement'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'accessibility', 3, 'Strong accessibility features'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'pricing', 2, 'Business tier required'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'environmental', 1, 'No stated policy'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'ethical_training', 2, 'Meeting-focused AI'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'enterprise_controls', 3, 'Full enterprise controls');

-- Midjourney Basic
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'data_privacy', 0, 'All images public by default'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'security', 1, 'Discord-based'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'tos', 1, 'Complex ownership terms'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'accessibility', 1, 'Discord interface challenges'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'pricing', 2, 'Subscription required'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'environmental', 0, 'No stated policy'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'ethical_training', 0, 'Training data concerns'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'enterprise_controls', 0, 'No enterprise controls');

-- Midjourney Pro
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'data_privacy', 1, 'Stealth mode for private images'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'security', 1, 'Discord-based'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'tos', 1, 'Complex ownership terms'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'accessibility', 1, 'Discord interface challenges'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'pricing', 1, 'Higher subscription cost'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'environmental', 0, 'No stated policy'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'ethical_training', 0, 'Training data concerns'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbd', 'enterprise_controls', 1, 'Stealth mode only');

-- DALL-E API
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'data_privacy', 2, 'API data not used for training'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'security', 2, 'OpenAI security standards'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'tos', 2, 'API terms of service'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'accessibility', 1, 'API-only, no interface'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'pricing', 2, 'Pay-per-use'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'environmental', 1, 'No stated policy'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'ethical_training', 1, 'Training data concerns'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'enterprise_controls', 2, 'API access controls');

-- DALL-E ChatGPT Plus
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'data_privacy', 1, 'May be used for training'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'security', 2, 'OpenAI security standards'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'tos', 2, 'ChatGPT terms apply'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'accessibility', 2, 'ChatGPT interface'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'pricing', 2, 'Included with ChatGPT Plus'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'environmental', 1, 'No stated policy'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'ethical_training', 1, 'Training data concerns'),
('cccccccc-cccc-cccc-cccc-ccccccccccce', 'enterprise_controls', 0, 'No enterprise controls');

-- Add Fathom.video as new tool
INSERT INTO tools (id, name, vendor, description, website_url, logo_url, categories) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddddd', 'Fathom', 'Fathom Video Inc.', 'AI meeting assistant that records, transcribes, and summarizes meetings. Integrates with Zoom, Google Meet, and Microsoft Teams.', 'https://fathom.video', 'https://fathom.video/favicon.ico', ARRAY['productivity', 'communication', 'meetings']);

-- Fathom tiers
INSERT INTO tool_tiers (id, tool_id, tier_name, overall_rating, rating_notes, last_reviewed_at, data_training_policy, requires_contract, soc2_certified, fedramp_status) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'Free', 'recommended', 'Generous free tier with excellent privacy stance. Does not use meeting data for AI training.', NOW(), 'no', false, true, NULL),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'Standard', 'recommended', 'Solid security and privacy with team features. Good value for nonprofits.', NOW(), 'no', false, true, NULL),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'Pro', 'recommended', 'Full feature set with CRM integrations and advanced analytics.', NOW(), 'no', false, true, NULL);

-- Fathom Free evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'data_privacy', 3, 'Does NOT train on user data. Clear privacy policy.'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'security', 3, 'SOC 2 Type II certified. Encrypted storage.'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'tos', 3, 'User-friendly terms. Clear data ownership.'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'accessibility', 2, 'Good transcription accuracy aids accessibility'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'pricing', 3, 'Generous free tier with unlimited recordings'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'environmental', 1, 'No stated environmental policy'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'ethical_training', 3, 'Does not use customer data for training'),
('dddddddd-dddd-dddd-dddd-dddddddddde1', 'enterprise_controls', 1, 'Basic sharing controls');

-- Fathom Standard evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'data_privacy', 3, 'Does NOT train on user data. Clear privacy policy.'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'security', 3, 'SOC 2 Type II certified. Encrypted storage.'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'tos', 3, 'User-friendly terms. Clear data ownership.'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'accessibility', 2, 'Good transcription accuracy aids accessibility'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'pricing', 2, 'Reasonable team pricing'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'environmental', 1, 'No stated environmental policy'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'ethical_training', 3, 'Does not use customer data for training'),
('dddddddd-dddd-dddd-dddd-dddddddddde2', 'enterprise_controls', 2, 'Team management features');

-- Fathom Pro evaluations
INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'data_privacy', 3, 'Does NOT train on user data. Clear privacy policy.'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'security', 3, 'SOC 2 Type II certified. Encrypted storage.'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'tos', 3, 'User-friendly terms. Clear data ownership.'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'accessibility', 2, 'Good transcription accuracy aids accessibility'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'pricing', 2, 'Premium pricing for advanced features'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'environmental', 1, 'No stated environmental policy'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'ethical_training', 3, 'Does not use customer data for training'),
('dddddddd-dddd-dddd-dddd-dddddddddde3', 'enterprise_controls', 3, 'Full admin controls, CRM integrations');
