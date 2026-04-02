-- =============================================================
-- MIGRATION: Add AI Note-Takers (Read.ai, Granola, Fireflies.ai)
-- Run this in Supabase SQL Editor:
-- https://supabase.com/dashboard/project/evlzeqhybsihzsteoaye/sql
-- =============================================================

-- 1. ADD READ.AI - AI Meeting Notetaker
-- Key concerns: University bans (UW, Chapman) for joining meetings
-- without account holder present. TrustPilot 2.2/5.
-- Positives: SOC 2 Type II, HIPAA-eligible on Enterprise+, no training by default.
-- -------------------------------------------------------------
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Read.ai',
  'Read AI Inc.',
  'AI meeting notetaker that joins Zoom, Google Meet, and Microsoft Teams to transcribe, summarize, and extract action items. SOC 2 Type II certified with HIPAA eligibility on Enterprise+. Caution: multiple universities have banned Read.ai due to the bot joining meetings without account holder presence and distributing summaries without participant consent.',
  'https://www.read.ai',
  NULL,
  ARRAY['meeting', 'communication', 'productivity']
);

DO $$
DECLARE
  readai_id UUID;
  readai_free_id UUID;
  readai_pro_id UUID;
  readai_ent_id UUID;
BEGIN
  SELECT id INTO readai_id FROM tools WHERE name = 'Read.ai';

  -- Free Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (readai_id, 'Free', 'not_recommended',
    'Not Recommended: Limited to 5 meetings/month. Multiple universities (UW, Chapman) have banned Read.ai for joining and recording meetings without the account holder present, and distributing AI summaries to participants without explicit consent. TrustPilot rating 2.2/5 with 84% of 1-star reviewers describing behavior as "virus-like." Training opt-in only (~10-15% participation rate).',
    'opt-out', false, true, null)
  RETURNING id INTO readai_free_id;

  -- Pro Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (readai_id, 'Pro', 'caution',
    'Unlimited meetings at $15/user/month (annual). Same consent concerns as Free tier. SOC 2 Type II certified. Does not train on user data by default. No HIPAA compliance at this tier.',
    'opt-out', false, true, null)
  RETURNING id INTO readai_pro_id;

  -- Enterprise+ Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (readai_id, 'Enterprise+', 'caution',
    'HIPAA-eligible with BAA ($29.75/user/month). SSO/SAML, data retention controls. Same underlying consent model concerns remain. Requires SAML and domain capture setup for HIPAA compliance — non-trivial IT lift.',
    'no', true, true, null)
  RETURNING id INTO readai_ent_id;

  -- Read.ai Free Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (readai_free_id, 'data_privacy', 1, 'Does not train on user data by default (opt-in, ~10-15% rate). However, Google Workspace data may be used for personalized models. University of Washington banned Read.ai for recording meetings without account holder present.', ARRAY['https://www.read.ai/privacy-policy', 'https://it.uw.edu/guides/security-authentication/read-ai-deactivation/']),
    (readai_free_id, 'security', 2, 'SOC 2 Type II certified. AES-256 encryption at rest, TLS 1.2 in transit. Data stored in AWS us-east-1.', ARRAY['https://www.read.ai/privacy']),
    (readai_free_id, 'tos', 1, 'Consent model is problematic: bot can join meetings, record, and distribute summaries without all participants'' awareness. Multiple institutional bans.', ARRAY['https://it.uw.edu/guides/security-authentication/read-ai-deactivation/', 'https://blogs.chapman.edu/information-systems/2025/08/13/security-notice-regarding-read-ai/']),
    (readai_free_id, 'accessibility', 2, 'Web-based with Chrome extension. Reasonable accessibility.', ARRAY['https://www.read.ai']),
    (readai_free_id, 'pricing', 2, 'Free tier limited to 5 meetings/month.', ARRAY['https://www.read.ai/plans-pricing']),
    (readai_free_id, 'environmental', 1, 'Limited environmental information available.', ARRAY['https://www.read.ai']),
    (readai_free_id, 'ethical_training', 1, 'Opt-in training model, but Google Workspace data usage for personalized models raises concerns. Consent issues with non-user recording.', ARRAY['https://www.read.ai/privacy-policy']),
    (readai_free_id, 'enterprise_controls', 0, 'No admin controls on free tier.', ARRAY['https://www.read.ai/plans-pricing']),
    (readai_free_id, 'sector_commitment', 0, 'No nonprofit pricing or programs identified.', ARRAY['https://www.read.ai']);

  -- Read.ai Pro Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (readai_pro_id, 'data_privacy', 2, 'Same opt-in training policy. Premium integrations available. Consent concerns remain.', ARRAY['https://www.read.ai/privacy-policy']),
    (readai_pro_id, 'security', 2, 'SOC 2 Type II. AES-256/TLS 1.2. No HIPAA at this tier.', ARRAY['https://www.read.ai/privacy']),
    (readai_pro_id, 'tos', 1, 'Same consent model issues as Free tier.', ARRAY['https://it.uw.edu/guides/security-authentication/read-ai-deactivation/']),
    (readai_pro_id, 'accessibility', 2, 'Same as Free tier.', ARRAY['https://www.read.ai']),
    (readai_pro_id, 'pricing', 1, '$15/user/month (annual). No nonprofit discount.', ARRAY['https://www.read.ai/plans-pricing']),
    (readai_pro_id, 'environmental', 1, 'Limited environmental information available.', ARRAY['https://www.read.ai']),
    (readai_pro_id, 'ethical_training', 2, 'Opt-in training only. Better than default-on competitors.', ARRAY['https://www.read.ai/privacy-policy']),
    (readai_pro_id, 'enterprise_controls', 1, 'Basic admin features. No SSO.', ARRAY['https://www.read.ai/plans-pricing']),
    (readai_pro_id, 'sector_commitment', 0, 'No nonprofit pricing or programs.', ARRAY['https://www.read.ai']);

  -- Read.ai Enterprise+ Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (readai_ent_id, 'data_privacy', 2, 'HIPAA-eligible with BAA. Data retention controls. No training on enterprise data. Consent model concerns still apply to meeting participants.', ARRAY['https://www.accountablehq.com/post/is-read-ai-hipaa-compliant-baa-phi-and-security-explained']),
    (readai_ent_id, 'security', 3, 'SOC 2 Type II, HIPAA-eligible, GDPR compliant. SSO/SAML. AES-256/TLS 1.2.', ARRAY['https://www.read.ai/privacy']),
    (readai_ent_id, 'tos', 2, 'Enterprise agreement available. Consent model still a concern for organizations with external meeting participants.', ARRAY['https://www.read.ai']),
    (readai_ent_id, 'accessibility', 2, 'Same as other tiers.', ARRAY['https://www.read.ai']),
    (readai_ent_id, 'pricing', 1, '$29.75/user/month. Requires non-trivial SAML/domain setup for HIPAA. No nonprofit discount.', ARRAY['https://www.read.ai/plans-pricing']),
    (readai_ent_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://www.read.ai']),
    (readai_ent_id, 'ethical_training', 2, 'No training on enterprise data. Clear contractual exclusion.', ARRAY['https://www.read.ai/privacy-policy']),
    (readai_ent_id, 'enterprise_controls', 3, 'SSO/SAML, data retention controls, admin console, domain capture.', ARRAY['https://www.read.ai/plans-pricing']),
    (readai_ent_id, 'sector_commitment', 0, 'No nonprofit programs or pricing.', ARRAY['https://www.read.ai']);

  -- Read.ai Proxy Signal
  INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url)
  VALUES (readai_id, 'soc2', 'certification', 'certified', 'https://www.read.ai/privacy');

END $$;


-- 2. ADD GRANOLA - Bot-Free AI Note-Taker
-- Key distinction: Runs locally, captures system audio, no visible bot.
-- Key concerns: Training opt-out NOT default on Free/Business.
-- Positives: SOC 2 Type 2, audio not stored permanently.
-- -------------------------------------------------------------
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Granola',
  'Granola Inc.',
  'Bot-free AI meeting notetaker that runs as a native desktop app, capturing system audio without joining meetings as a visible participant. SOC 2 Type 2 certified. Audio is transcribed in real-time and discarded — not stored permanently. Important: model training opt-out is NOT on by default for Free/Business tiers.',
  'https://www.granola.ai',
  NULL,
  ARRAY['meeting', 'productivity']
);

DO $$
DECLARE
  granola_id UUID;
  granola_free_id UUID;
  granola_biz_id UUID;
  granola_ent_id UUID;
BEGIN
  SELECT id INTO granola_id FROM tools WHERE name = 'Granola';

  -- Free Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (granola_id, 'Free', 'caution',
    'Caution: 25 lifetime meetings (not monthly). Model training opt-out available but NOT on by default — users must manually enable in settings. Audio discarded after transcription. SOC 2 Type 2. Third-party AI providers (OpenAI, Anthropic) contractually barred from training on data.',
    'opt-out', false, true, null)
  RETURNING id INTO granola_free_id;

  -- Business Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (granola_id, 'Business', 'caution',
    '$14/user/month. Unlimited meetings, integrations (Slack, Notion, HubSpot). Training opt-out available but still not default. No HIPAA compliance.',
    'opt-out', false, true, null)
  RETURNING id INTO granola_biz_id;

  -- Enterprise Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (granola_id, 'Enterprise', 'recommended',
    '$35/user/month. SSO, org-wide training opt-out by default, admin controls. SOC 2 Type 2. No HIPAA. Bot-free architecture is a genuine privacy advantage.',
    'no', true, true, null)
  RETURNING id INTO granola_ent_id;

  -- Granola Free Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (granola_free_id, 'data_privacy', 1, 'Training opt-out available but NOT on by default. Anonymized data used internally. Audio discarded after transcription. Third-party providers contractually barred from training.', ARRAY['https://www.granola.ai/security', 'https://help.granola.ai/article/privacy-policy']),
    (granola_free_id, 'security', 2, 'SOC 2 Type 2 (July 2025, independently audited). US-based AWS. Encrypted at rest and in transit. Penetration tested.', ARRAY['https://www.granola.ai/security', 'https://www.vanta.com/customers/granola']),
    (granola_free_id, 'tos', 2, 'Reasonable terms. GDPR-compliant DPA available. Users can delete notes and request full account deletion.', ARRAY['https://help.granola.ai/article/privacy-policy']),
    (granola_free_id, 'accessibility', 2, 'Desktop app (Mac primary, iOS). Reasonable accessibility.', ARRAY['https://www.granola.ai']),
    (granola_free_id, 'pricing', 1, 'Free tier severely limited: 25 lifetime meetings total (not per month).', ARRAY['https://www.granola.ai/pricing']),
    (granola_free_id, 'environmental', 1, 'Limited environmental information. Local processing reduces server load.', ARRAY['https://www.granola.ai']),
    (granola_free_id, 'ethical_training', 1, 'Trains on anonymized user data internally. Opt-out not default. Anonymization methodology not publicly documented.', ARRAY['https://blog.buildbetter.ai/do-they-own-your-data-granola-ai-privacy-policy-reviewed/']),
    (granola_free_id, 'enterprise_controls', 0, 'No admin controls on free tier.', ARRAY['https://www.granola.ai/pricing']),
    (granola_free_id, 'sector_commitment', 0, 'No nonprofit pricing or programs.', ARRAY['https://www.granola.ai']);

  -- Granola Business Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (granola_biz_id, 'data_privacy', 1, 'Same training opt-out issue as Free. Integrations add data surface area (Slack, HubSpot).', ARRAY['https://www.granola.ai/security']),
    (granola_biz_id, 'security', 2, 'SOC 2 Type 2. Same security posture as Free tier.', ARRAY['https://www.granola.ai/security']),
    (granola_biz_id, 'tos', 2, 'Same terms as Free tier. DPA available.', ARRAY['https://help.granola.ai/article/privacy-policy']),
    (granola_biz_id, 'accessibility', 2, 'Same as Free tier.', ARRAY['https://www.granola.ai']),
    (granola_biz_id, 'pricing', 2, '$14/user/month with unlimited meetings. Reasonable pricing but no nonprofit discount.', ARRAY['https://www.granola.ai/pricing']),
    (granola_biz_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://www.granola.ai']),
    (granola_biz_id, 'ethical_training', 1, 'Same training concerns as Free. Opt-out still not default.', ARRAY['https://www.granola.ai/security']),
    (granola_biz_id, 'enterprise_controls', 1, 'Basic team features. No SSO.', ARRAY['https://www.granola.ai/pricing']),
    (granola_biz_id, 'sector_commitment', 0, 'No nonprofit pricing or programs.', ARRAY['https://www.granola.ai']);

  -- Granola Enterprise Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (granola_ent_id, 'data_privacy', 3, 'Org-wide training opt-out enabled by default. Audio never stored. Third-party providers contractually excluded from training.', ARRAY['https://www.granola.ai/security']),
    (granola_ent_id, 'security', 2, 'SOC 2 Type 2. No HIPAA compliance available.', ARRAY['https://www.granola.ai/security']),
    (granola_ent_id, 'tos', 3, 'Enterprise agreement. DPA. Full data deletion rights.', ARRAY['https://www.granola.ai']),
    (granola_ent_id, 'accessibility', 2, 'Same as other tiers.', ARRAY['https://www.granola.ai']),
    (granola_ent_id, 'pricing', 1, '$35/user/month. No nonprofit discount.', ARRAY['https://www.granola.ai/pricing']),
    (granola_ent_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://www.granola.ai']),
    (granola_ent_id, 'ethical_training', 3, 'Org-wide training exclusion by default on Enterprise. Clear contractual protections.', ARRAY['https://www.granola.ai/security']),
    (granola_ent_id, 'enterprise_controls', 3, 'SSO, org-wide settings, admin controls.', ARRAY['https://www.granola.ai/pricing']),
    (granola_ent_id, 'sector_commitment', 0, 'No nonprofit programs or pricing.', ARRAY['https://www.granola.ai']);

  -- Granola Proxy Signal
  INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url)
  VALUES (granola_id, 'soc2', 'certification', 'certified', 'https://www.granola.ai/security');

END $$;


-- 3. ADD FIREFLIES.AI - AI Meeting Notetaker
-- Key concerns: March 2026 BIPA class action lawsuit (biometric data
-- collection from non-consenting participants).
-- Positives: SOC 2 Type II, no AI training, zero-data-retention with subprocessors.
-- -------------------------------------------------------------
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  'Fireflies.ai',
  'Fireflies.ai Inc.',
  'AI meeting notetaker that joins video meetings to record, transcribe, and generate summaries with action items. SOC 2 Type II certified. Does not train on meeting content. Caution: facing a March 2026 BIPA class action lawsuit alleging biometric data (voiceprints) collection from non-consenting meeting participants.',
  'https://fireflies.ai',
  NULL,
  ARRAY['meeting', 'communication', 'productivity']
);

DO $$
DECLARE
  fireflies_id UUID;
  fireflies_free_id UUID;
  fireflies_pro_id UUID;
  fireflies_biz_id UUID;
  fireflies_ent_id UUID;
BEGIN
  SELECT id INTO fireflies_id FROM tools WHERE name = 'Fireflies.ai';

  -- Free Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (fireflies_id, 'Free', 'not_recommended',
    'Not Recommended: 800 min/seat storage limit. Auto-join bot records non-users without their consent — subject of March 2026 BIPA class action lawsuit. No admin controls. Limited AI summaries. Despite strong stated privacy policy, the consent model is fundamentally problematic for nonprofits serving vulnerable populations.',
    'no', false, true, null)
  RETURNING id INTO fireflies_free_id;

  -- Pro Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (fireflies_id, 'Pro', 'caution',
    '$10/user/month (annual). Unlimited transcription. SOC 2 Type II. Does not train on content. Zero-data-retention with subprocessors. Same consent model concerns as Free.',
    'no', false, true, null)
  RETURNING id INTO fireflies_pro_id;

  -- Business Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (fireflies_id, 'Business', 'caution',
    '$19/user/month (annual). Advanced admin controls. SOC 2 Type II. No HIPAA at this tier. Consent concerns remain.',
    'no', false, true, null)
  RETURNING id INTO fireflies_biz_id;

  -- Enterprise Tier
  INSERT INTO tool_tiers (tool_id, tier_name, overall_rating, rating_notes, data_training_policy, requires_contract, soc2_certified, fedramp_status)
  VALUES (fireflies_id, 'Enterprise', 'recommended',
    'Custom pricing. HIPAA BAA available. SSO. Private storage at preferred location. SOC 2 Type II. Strongest controls, but organizations should implement explicit consent protocols for meeting recording.',
    'no', true, true, null)
  RETURNING id INTO fireflies_ent_id;

  -- Fireflies Free Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (fireflies_free_id, 'data_privacy', 1, 'Does not train on content. Zero-data-retention with subprocessors. However, auto-join bot collects voiceprints from non-consenting participants — basis of March 2026 BIPA class action.', ARRAY['https://fireflies.ai/privacy-policy', 'https://www.ebglaw.com/insights/publications/ai-meeting-assistants-and-biometric-privacy-lessons-from-the-fireflies-ai-lawsuit']),
    (fireflies_free_id, 'security', 1, 'SOC 2 Type II certified but free tier lacks admin controls. AES-256 at rest, TLS 1.2 in transit.', ARRAY['https://fireflies.ai/security']),
    (fireflies_free_id, 'tos', 1, 'Active BIPA lawsuit raises legal risk. Bot may continue joining meetings after account deactivation per user reports.', ARRAY['https://natlawreview.com/article/lawsuit-alleges-firefliesai-corp-illegally-collects-biometric-data-virtual-meetings']),
    (fireflies_free_id, 'accessibility', 2, 'Web-based with reasonable accessibility.', ARRAY['https://fireflies.ai']),
    (fireflies_free_id, 'pricing', 3, 'Free tier with 800 min/seat. No credit card required.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_free_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://fireflies.ai']),
    (fireflies_free_id, 'ethical_training', 3, 'Does not train on meeting content. Contractual zero-data-retention with all subprocessors including OpenAI.', ARRAY['https://guide.fireflies.ai/articles/2154538358-policy-on-keeping-information-safe']),
    (fireflies_free_id, 'enterprise_controls', 0, 'No admin controls on free tier.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_free_id, 'sector_commitment', 0, 'No nonprofit pricing or programs identified.', ARRAY['https://fireflies.ai']);

  -- Fireflies Pro Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (fireflies_pro_id, 'data_privacy', 2, 'No training. Zero-data-retention with subprocessors. Consent model still problematic.', ARRAY['https://fireflies.ai/privacy-policy']),
    (fireflies_pro_id, 'security', 2, 'SOC 2 Type II. Google Cloud (US) storage. AWS VPC for database.', ARRAY['https://fireflies.ai/security']),
    (fireflies_pro_id, 'tos', 2, 'Better than Free but BIPA lawsuit applies to the platform broadly.', ARRAY['https://fireflies.ai']),
    (fireflies_pro_id, 'accessibility', 2, 'Same as Free tier.', ARRAY['https://fireflies.ai']),
    (fireflies_pro_id, 'pricing', 2, '$10/user/month (annual). Competitive pricing. No nonprofit discount.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_pro_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://fireflies.ai']),
    (fireflies_pro_id, 'ethical_training', 3, 'Same strong no-training policy as Free.', ARRAY['https://guide.fireflies.ai/articles/2154538358-policy-on-keeping-information-safe']),
    (fireflies_pro_id, 'enterprise_controls', 1, 'Basic admin features. No SSO.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_pro_id, 'sector_commitment', 0, 'No nonprofit pricing or programs.', ARRAY['https://fireflies.ai']);

  -- Fireflies Business Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (fireflies_biz_id, 'data_privacy', 2, 'Same strong data policies. Admin controls for team management.', ARRAY['https://fireflies.ai/privacy-policy']),
    (fireflies_biz_id, 'security', 2, 'SOC 2 Type II. GDPR compliant. No HIPAA at this tier.', ARRAY['https://fireflies.ai/security']),
    (fireflies_biz_id, 'tos', 2, 'Advanced admin controls improve organizational governance.', ARRAY['https://fireflies.ai']),
    (fireflies_biz_id, 'accessibility', 2, 'Same as other tiers.', ARRAY['https://fireflies.ai']),
    (fireflies_biz_id, 'pricing', 2, '$19/user/month (annual). No nonprofit discount.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_biz_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://fireflies.ai']),
    (fireflies_biz_id, 'ethical_training', 3, 'Same strong no-training policy.', ARRAY['https://guide.fireflies.ai/articles/2154538358-policy-on-keeping-information-safe']),
    (fireflies_biz_id, 'enterprise_controls', 2, 'Admin console, team management. No SSO.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_biz_id, 'sector_commitment', 0, 'No nonprofit pricing or programs.', ARRAY['https://fireflies.ai']);

  -- Fireflies Enterprise Evaluations
  INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls) VALUES
    (fireflies_ent_id, 'data_privacy', 3, 'HIPAA BAA available. Private storage. No training. Zero-data-retention. Strongest data controls.', ARRAY['https://fireflies.ai/security']),
    (fireflies_ent_id, 'security', 3, 'SOC 2 Type II. HIPAA-eligible. OWASP-aligned. Private storage at preferred location. SSO.', ARRAY['https://fireflies.ai/security']),
    (fireflies_ent_id, 'tos', 3, 'Enterprise agreement with custom terms. HIPAA BAA.', ARRAY['https://fireflies.ai']),
    (fireflies_ent_id, 'accessibility', 2, 'Same as other tiers.', ARRAY['https://fireflies.ai']),
    (fireflies_ent_id, 'pricing', 1, 'Custom pricing — contact required. No published nonprofit discount.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_ent_id, 'environmental', 1, 'Limited environmental information.', ARRAY['https://fireflies.ai']),
    (fireflies_ent_id, 'ethical_training', 3, 'Same strong no-training policy across all tiers.', ARRAY['https://guide.fireflies.ai/articles/2154538358-policy-on-keeping-information-safe']),
    (fireflies_ent_id, 'enterprise_controls', 3, 'SSO, private storage, admin console, custom retention policies.', ARRAY['https://fireflies.ai/pricing']),
    (fireflies_ent_id, 'sector_commitment', 0, 'No nonprofit programs or pricing.', ARRAY['https://fireflies.ai']);

  -- Fireflies Proxy Signal
  INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url)
  VALUES (fireflies_id, 'soc2', 'certification', 'certified', 'https://fireflies.ai/security');

END $$;


-- 4. VERIFY
-- -------------------------------------------------------------
SELECT 'New AI Note-Takers added:' as status, name, vendor FROM tools WHERE name IN ('Read.ai', 'Granola', 'Fireflies.ai');
SELECT 'All AI Note-Takers:' as status, name, vendor FROM tools WHERE 'meeting' = ANY(categories) ORDER BY name;
