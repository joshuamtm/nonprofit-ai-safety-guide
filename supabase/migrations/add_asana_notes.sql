-- Add evaluation notes for Asana
-- Generated from research of Asana's official documentation
-- Run in Supabase SQL Editor: https://supabase.com/dashboard/project/evlzeqhybsihzsteoaye/sql

-- =====================================================
-- ASANA BASIC (Free/Personal tier)
-- Tier ID: eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1
-- =====================================================

UPDATE evaluations SET
  notes = 'Free tier data is subject to AI processing for Asana AI features using metadata. Users cannot disable AI features without admin console (not available on free tier). Privacy policy applies equally across tiers but free users have limited control options.',
  evidence_urls = ARRAY['https://asana.com/privacy', 'https://asana.com/terms']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'data_privacy';

UPDATE evaluations SET
  notes = 'SOC 2 Type II certified across all tiers. Multi-factor authentication available. However, no SSO options and no admin console on free tier limits organizational security controls.',
  evidence_urls = ARRAY['https://asana.com/pricing', 'https://trustcenter.asana.com']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'security';

UPDATE evaluations SET
  notes = 'Standard consumer terms apply. $100 aggregate liability cap regardless of damages. Users retain content ownership but grant Asana broad usage license. Asana can terminate access unilaterally.',
  evidence_urls = ARRAY['https://asana.com/terms']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'tos';

UPDATE evaluations SET
  notes = 'Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features.',
  evidence_urls = ARRAY['https://asana.com/accessibility', 'https://assets.asana.biz/m/2deaaed23d6f6bba/original/Asana-Web-App-April-2024-VPAT-Google-Docs.pdf']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'accessibility';

UPDATE evaluations SET
  notes = 'Personal tier is free forever with core task management features. Excellent option for small nonprofits getting started with project management.',
  evidence_urls = ARRAY['https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'pricing';

UPDATE evaluations SET
  notes = 'Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards.',
  evidence_urls = ARRAY['https://asana.com/inside-asana/fy25-asana-esg-report', 'https://asana.com/inside-asana/asana-carbon-offsets']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'environmental';

UPDATE evaluations SET
  notes = 'Asana AI features use metadata from workspaces. AI Partner-powered features may use task titles and descriptions. Users can opt out but require admin console access (not available on free tier). Some transparency on data usage in privacy policy.',
  evidence_urls = ARRAY['https://asana.com/privacy']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'ethical_training';

UPDATE evaluations SET
  notes = 'No admin console on free tier. No SSO options. No organizational controls or user management. Limited to individual use or informal team coordination.',
  evidence_urls = ARRAY['https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1' AND criteria_key = 'enterprise_controls';

-- =====================================================
-- ASANA PREMIUM (Starter tier)
-- Tier ID: eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2
-- =====================================================

UPDATE evaluations SET
  notes = 'Admin console allows disabling AI features. Data processing follows standard privacy policy. Improved control over organizational data compared to free tier, but no DPA or custom data handling options.',
  evidence_urls = ARRAY['https://asana.com/privacy', 'https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'data_privacy';

UPDATE evaluations SET
  notes = 'SOC 2 Type II certified. Google SSO available. Admin console for basic user management and security settings. MFA supported. No SAML SSO at this tier.',
  evidence_urls = ARRAY['https://asana.com/pricing', 'https://trustcenter.asana.com']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'security';

UPDATE evaluations SET
  notes = 'Standard consumer terms apply with $100 liability cap. Customer retains content ownership. Better than free tier but no custom enterprise agreement available.',
  evidence_urls = ARRAY['https://asana.com/terms']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'tos';

UPDATE evaluations SET
  notes = 'Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features.',
  evidence_urls = ARRAY['https://asana.com/accessibility', 'https://assets.asana.biz/m/2deaaed23d6f6bba/original/Asana-Web-App-April-2024-VPAT-Google-Docs.pdf']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'accessibility';

UPDATE evaluations SET
  notes = '50% nonprofit discount available through Goodstack verification. $10.99/user/month (annual) before discount. Discount lasts forever for qualifying 501(c)(3) organizations.',
  evidence_urls = ARRAY['https://asana.com/nonprofit', 'https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'pricing';

UPDATE evaluations SET
  notes = 'Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards.',
  evidence_urls = ARRAY['https://asana.com/inside-asana/fy25-asana-esg-report', 'https://asana.com/inside-asana/asana-carbon-offsets']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'environmental';

UPDATE evaluations SET
  notes = 'Asana AI features use metadata from workspaces. Admin console allows disabling AI features. Some transparency on data sources in privacy policy, though training data origins for underlying models not fully disclosed.',
  evidence_urls = ARRAY['https://asana.com/privacy']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'ethical_training';

UPDATE evaluations SET
  notes = 'Basic admin console included. Google SSO only (no SAML). User management and basic security settings. No audit logs or advanced compliance features.',
  evidence_urls = ARRAY['https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2' AND criteria_key = 'enterprise_controls';

-- =====================================================
-- ASANA BUSINESS (Advanced tier)
-- Tier ID: eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3
-- =====================================================

UPDATE evaluations SET
  notes = 'Full admin console control over AI features. Standard Data Processing Addendum available. Can disable all AI processing. Better organizational data control than lower tiers.',
  evidence_urls = ARRAY['https://asana.com/privacy', 'https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'data_privacy';

UPDATE evaluations SET
  notes = 'SOC 2 Type II certified. ISO 27001 compliant. Google SSO included. Full admin console with advanced security settings. MFA enforced option. Still no SAML SSO at this tier.',
  evidence_urls = ARRAY['https://asana.com/pricing', 'https://trustcenter.asana.com']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'security';

UPDATE evaluations SET
  notes = 'Customer agreement available with improved terms over consumer ToS. Data Processing Addendum incorporates EU-US privacy frameworks. Still has liability limitations but better protections than lower tiers.',
  evidence_urls = ARRAY['https://asana.com/terms', 'https://asana.com/privacy']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'tos';

UPDATE evaluations SET
  notes = 'Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features.',
  evidence_urls = ARRAY['https://asana.com/accessibility', 'https://assets.asana.biz/m/2deaaed23d6f6bba/original/Asana-Web-App-April-2024-VPAT-Google-Docs.pdf']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'accessibility';

UPDATE evaluations SET
  notes = '50% nonprofit discount available through Goodstack verification. $24.99/user/month (annual) before discount. Discount lasts forever for qualifying 501(c)(3) organizations.',
  evidence_urls = ARRAY['https://asana.com/nonprofit', 'https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'pricing';

UPDATE evaluations SET
  notes = 'Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards.',
  evidence_urls = ARRAY['https://asana.com/inside-asana/fy25-asana-esg-report', 'https://asana.com/inside-asana/asana-carbon-offsets']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'environmental';

UPDATE evaluations SET
  notes = 'Full control to disable AI features via admin console. Asana AI uses workspace metadata only; AI Partner features use content with transparency. Training data for underlying models (likely third-party) not fully disclosed.',
  evidence_urls = ARRAY['https://asana.com/privacy']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'ethical_training';

UPDATE evaluations SET
  notes = 'Full admin console with advanced permissions. Google SSO included. Custom branding. Advanced reporting and analytics. No SAML SSO or audit log API at this tier.',
  evidence_urls = ARRAY['https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee3' AND criteria_key = 'enterprise_controls';

-- =====================================================
-- ASANA ENTERPRISE
-- Tier ID: eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4
-- =====================================================

UPDATE evaluations SET
  notes = 'Enterprise Data Processing Addendum with EU-US, UK, and Swiss privacy framework compliance. Full control over AI features. Data residency options available on Enterprise+. Custom data handling agreements negotiable.',
  evidence_urls = ARRAY['https://asana.com/privacy', 'https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'data_privacy';

UPDATE evaluations SET
  notes = 'SOC 2 Type II, ISO 27001, ISO 27018, ISO 27701 certified. SAML SSO included. Full admin console with advanced security. Audit log API and SIEM integration on Enterprise+. Enterprise-grade security controls.',
  evidence_urls = ARRAY['https://asana.com/pricing', 'https://trustcenter.asana.com']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'security';

UPDATE evaluations SET
  notes = 'Custom enterprise agreement with negotiable terms. Data Processing Addendum with comprehensive privacy framework compliance. Better liability protections and custom SLAs available.',
  evidence_urls = ARRAY['https://asana.com/terms', 'https://asana.com/privacy']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'tos';

UPDATE evaluations SET
  notes = 'Working toward WCAG 2.2 AA compliance with many core workflows already conforming. VPAT published (April 2024). Supports NVDA/JAWS screen readers, offers color-blind mode, dark mode, and keyboard navigation for most features.',
  evidence_urls = ARRAY['https://asana.com/accessibility', 'https://assets.asana.biz/m/2deaaed23d6f6bba/original/Asana-Web-App-April-2024-VPAT-Google-Docs.pdf']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'accessibility';

UPDATE evaluations SET
  notes = 'Enterprise pricing requires contacting sales. No published nonprofit discount for Enterprise tier - must negotiate directly. May be cost-prohibitive for smaller nonprofits.',
  evidence_urls = ARRAY['https://asana.com/nonprofit', 'https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'pricing';

UPDATE evaluations SET
  notes = 'Carbon neutral since FY22, 100% renewable electricity across all operations. Net-zero emissions target by 2030. LEED Gold (SF HQ) and LEED Platinum (Dublin) certified offices. Published ESG reports following SASB, GRI, and TCFD standards.',
  evidence_urls = ARRAY['https://asana.com/inside-asana/fy25-asana-esg-report', 'https://asana.com/inside-asana/asana-carbon-offsets']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'environmental';

UPDATE evaluations SET
  notes = 'Full control over AI features with granular admin settings. Enterprise DPA provides transparency on data processing. Asana AI uses metadata only; can fully disable AI Partner features that use content.',
  evidence_urls = ARRAY['https://asana.com/privacy']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'ethical_training';

UPDATE evaluations SET
  notes = 'Full enterprise admin suite. SAML SSO, SCIM provisioning. Audit log API (Enterprise+). SIEM integration support. Data residency options. Custom domains. Organization-wide JSON export.',
  evidence_urls = ARRAY['https://asana.com/pricing']
WHERE tool_tier_id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee4' AND criteria_key = 'enterprise_controls';

-- Verify the updates
SELECT
  t.name as tool_name,
  tt.tier_name,
  e.criteria_key,
  e.rating,
  SUBSTRING(e.notes, 1, 50) as notes_preview,
  array_length(e.evidence_urls, 1) as num_sources
FROM evaluations e
JOIN tool_tiers tt ON e.tool_tier_id = tt.id
JOIN tools t ON tt.tool_id = t.id
WHERE t.name = 'Asana'
ORDER BY tt.tier_name, e.criteria_key;
