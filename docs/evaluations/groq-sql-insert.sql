-- Groq AI - SQL Insert Statements for Supabase
-- Generated: December 26, 2025
-- Rating: Recommended (76/100)

-- Step 1: Insert the tool
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Groq',
  'Groq, Inc.',
  'Ultra-fast AI inference platform powered by LPU (Language Processing Unit) technology. Provides API access to run various LLMs with industry-leading speed and strong privacy controls.',
  'https://groq.com',
  'https://groq.com/wp-content/uploads/2024/01/groq-logo-white.svg',
  ARRAY['research', 'data', 'productivity', 'writing']
)
RETURNING id;

-- Step 2: Insert tiers (replace [TOOL_ID] with the ID returned above)

-- Free Tier
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
  'approved',
  'Strong privacy controls with Zero Data Retention option. SOC 2 Type II certified. User owns all prompts and outputs. No training on user data. 10x more energy efficient than GPU-based inference.',
  'no',
  false,
  true,
  null
)
RETURNING id;
-- Save this as [FREE_TIER_ID]

-- Developer Tier
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
  'Developer',
  'approved',
  'Same privacy controls as Free tier plus 10x rate limits, 25% cost discount, and Batch API access (50% discount). Self-serve upgrade available.',
  'no',
  false,
  true,
  null
)
RETURNING id;
-- Save this as [DEV_TIER_ID]

-- Enterprise Tier
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
  'Enterprise',
  'approved',
  'Dedicated or multi-tenant instances. Contact sales for SSO/SCIM details and custom data residency options. Same strong privacy foundation as other tiers.',
  'no',
  true,
  true,
  null
)
RETURNING id;
-- Save this as [ENT_TIER_ID]

-- Step 3: Insert evaluations for Free Tier (replace [FREE_TIER_ID])

INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls)
VALUES
  ('[FREE_TIER_ID]', 'data_privacy', 3, 'No training on user data. Zero Data Retention option available. Default: no retention. Temporary 30-day logs only for troubleshooting (can be disabled). GDPR/CCPA compliant.', ARRAY['https://console.groq.com/docs/your-data', 'https://groq.com/privacy-policy']),
  ('[FREE_TIER_ID]', 'security', 3, 'SOC 2 Type II certified. Trust Center available. Encryption in transit and at rest. Data stored in GCP (US). Bug bounty program.', ARRAY['https://trust.groq.com/', 'https://groq.com/security', 'https://www.linkedin.com/posts/groq_big-news-groq-is-now-soc-2-type-ii-compliant-activity-7225190193073373185-ZyPL']),
  ('[FREE_TIER_ID]', 'tos', 3, 'User owns prompts and retains all IP rights. Groq assigns IP rights in outputs to user. Limited license to Groq only for providing service. Reasonable terms overall.', ARRAY['https://groq.com/terms-of-use', 'https://console.groq.com/docs/legal/services-agreement']),
  ('[FREE_TIER_ID]', 'accessibility', 1, 'No accessibility statement found. No WCAG compliance documentation. No VPAT available.', ARRAY['https://groq.com']),
  ('[FREE_TIER_ID]', 'pricing', 2, 'Free tier available with rate limits, no credit card required. Developer tier offers 25% discount. No specific nonprofit discount or TechSoup partnership found.', ARRAY['https://groq.com/pricing', 'https://community.groq.com/t/is-there-a-free-tier-and-what-are-its-limits/790']),
  ('[FREE_TIER_ID]', 'environmental', 3, 'LPU technology is 10x more energy efficient than GPUs (1-3 vs 10-30 Joules per token). Partnership with DOE on sustainability. Explicit environmental focus in company mission.', ARRAY['https://groq.com/lpu-architecture', 'https://groq.com/newsroom/groq-partners-with-us-department-of-energy-to-advance-ai-inference-and-next-generation-computing-infrastructure']),
  ('[FREE_TIER_ID]', 'ethical_training', 1, 'Groq is an inference platform, not a model trainer. Training data transparency depends on hosted models (Llama, Mistral, etc.). Responsible AI policy exists but limited model-specific info.', ARRAY['https://console.groq.com/docs/legal/ai-policy']),
  ('[FREE_TIER_ID]', 'enterprise_controls', 2, 'Data Controls settings in console. Zero Data Retention option. Organization-level settings. SSO/SCIM details require contacting sales.', ARRAY['https://console.groq.com/docs/your-data']),
  ('[FREE_TIER_ID]', 'sector_commitment', 1, 'No nonprofit-specific programs. No TechSoup partnership. No nonprofit case studies or sector focus found. Enterprise sales available but not nonprofit-specific.', ARRAY['https://groq.com']);

-- Step 4: Insert evaluations for Developer Tier (replace [DEV_TIER_ID])
-- (Same scores as Free tier - copy and adjust tier_id)

INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls)
VALUES
  ('[DEV_TIER_ID]', 'data_privacy', 3, 'Same as Free tier. No training on user data. Zero Data Retention option available.', ARRAY['https://console.groq.com/docs/your-data']),
  ('[DEV_TIER_ID]', 'security', 3, 'Same as Free tier. SOC 2 Type II certified.', ARRAY['https://trust.groq.com/']),
  ('[DEV_TIER_ID]', 'tos', 3, 'Same as Free tier. User owns prompts and outputs.', ARRAY['https://groq.com/terms-of-use']),
  ('[DEV_TIER_ID]', 'accessibility', 1, 'Same as Free tier. No accessibility documentation.', ARRAY['https://groq.com']),
  ('[DEV_TIER_ID]', 'pricing', 2, '25% discount on tokens. 10x higher rate limits. Batch API with 50% discount. Still no nonprofit-specific pricing.', ARRAY['https://groq.com/pricing', 'https://groq.com/blog/developer-tier-now-available-on-groqcloud']),
  ('[DEV_TIER_ID]', 'environmental', 3, 'Same as Free tier. LPU 10x more efficient than GPUs.', ARRAY['https://groq.com/lpu-architecture']),
  ('[DEV_TIER_ID]', 'ethical_training', 1, 'Same as Free tier. Inference platform, training depends on models.', ARRAY['https://console.groq.com/docs/legal/ai-policy']),
  ('[DEV_TIER_ID]', 'enterprise_controls', 2, 'Same as Free tier plus higher limits.', ARRAY['https://console.groq.com/docs/your-data']),
  ('[DEV_TIER_ID]', 'sector_commitment', 1, 'Same as Free tier. No nonprofit programs.', ARRAY['https://groq.com']);

-- Step 5: Insert evaluations for Enterprise Tier (replace [ENT_TIER_ID])

INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls)
VALUES
  ('[ENT_TIER_ID]', 'data_privacy', 3, 'Same strong foundation plus dedicated instances available. Custom data handling options.', ARRAY['https://console.groq.com/docs/your-data']),
  ('[ENT_TIER_ID]', 'security', 3, 'Same as other tiers. SOC 2 Type II. Potential for additional enterprise security controls.', ARRAY['https://trust.groq.com/']),
  ('[ENT_TIER_ID]', 'tos', 3, 'Custom enterprise agreements available. User owns content.', ARRAY['https://console.groq.com/docs/legal/services-agreement']),
  ('[ENT_TIER_ID]', 'accessibility', 1, 'Same as other tiers. No accessibility documentation.', ARRAY['https://groq.com']),
  ('[ENT_TIER_ID]', 'pricing', 2, 'Custom pricing available. Likely volume discounts. No confirmed nonprofit discount.', ARRAY['https://groq.com/pricing']),
  ('[ENT_TIER_ID]', 'environmental', 3, 'Same as other tiers. LPU efficiency applies to enterprise deployments.', ARRAY['https://groq.com/lpu-architecture']),
  ('[ENT_TIER_ID]', 'ethical_training', 1, 'Same as other tiers. Inference platform.', ARRAY['https://console.groq.com/docs/legal/ai-policy']),
  ('[ENT_TIER_ID]', 'enterprise_controls', 3, 'Dedicated instances. Custom data residency options. SSO/SCIM likely available (confirm with sales). Admin console.', ARRAY['https://groq.humain.ai/enterprise-access/']),
  ('[ENT_TIER_ID]', 'sector_commitment', 1, 'Same as other tiers. No nonprofit focus.', ARRAY['https://groq.com']);

-- Step 6: Insert proxy signals (replace [TOOL_ID])

-- Note: No positive proxy signals found for Groq
-- Not on FedRAMP, no TechSoup partnership, no Common Sense review
