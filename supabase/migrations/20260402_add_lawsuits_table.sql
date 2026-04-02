-- =============================================================
-- MIGRATION: Add tool_lawsuits table and populate known lawsuits
-- =============================================================

CREATE TABLE IF NOT EXISTS tool_lawsuits (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tool_id UUID REFERENCES tools(id) ON DELETE CASCADE,
  case_name TEXT NOT NULL,
  description TEXT,
  status TEXT DEFAULT 'active', -- active, settled, dismissed, resolved
  filed_date TEXT,
  source_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_tool_lawsuits_tool_id ON tool_lawsuits(tool_id);
ALTER TABLE tool_lawsuits ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read access on tool_lawsuits" ON tool_lawsuits;
CREATE POLICY "Allow public read access on tool_lawsuits" ON tool_lawsuits FOR SELECT USING (true);

-- Populate known lawsuits (April 2026)
INSERT INTO tool_lawsuits (tool_id, case_name, description, status, filed_date, source_url) VALUES
  ((SELECT id FROM tools WHERE name = 'ChatGPT'),
   'In re OpenAI Copyright Infringement Litigation (MDL, SDNY)',
   'Consolidated 16 copyright suits. Court ordered OpenAI to produce 20M anonymized chat logs (Jan 2026).',
   'active', 'Consolidated 2024',
   'https://www.dataprivacyandsecurityinsider.com/2026/01/when-chats-become-evidence-court-affirms-order-requiring-openai-to-produce-20-million-de-identified-chatgpt-logs/'),

  ((SELECT id FROM tools WHERE name = 'ChatGPT'),
   'OpenAI / Mixpanel Data Breach Class Action',
   'Class action alleging 2025 data breach exposed names, emails, and device info of users.',
   'active', '2025',
   'https://topclassactions.com/lawsuit-settlements/lawsuit-news/class-action-claims-openai-mixpanel-exposed-user-information-in-2025-data-breach/'),

  ((SELECT id FROM tools WHERE name = 'Claude'),
   'Bartz v. Anthropic (Training Data Settlement)',
   'Settled for $1.5B over use of pirated ebooks (LibGen) to train Claude. Fairness hearing set for April 2026.',
   'settled', 'Sept 2025',
   'https://www.npr.org/2025/09/05/nx-s1-5529404/anthropic-settlement-authors-copyright-ai'),

  ((SELECT id FROM tools WHERE name = 'Claude'),
   'BMG v. Anthropic',
   'Active suit over use of music lyrics to train Claude without authorization.',
   'active', 'Early 2026',
   'https://www.rollingstone.com/music/music-news/bmg-anthropic-copyright-lawsuit-justin-bieber-bruno-mars-1235533474/'),

  ((SELECT id FROM tools WHERE name = 'Gemini'),
   'Thele v. Google LLC (N.D. Cal.)',
   'Class action alleging Google secretly enabled Gemini across Gmail, Chat, and Meet without user consent. Claims California Invasion of Privacy Act, Stored Communications Act violations.',
   'active', 'Nov 2025',
   'https://natlawreview.com/article/silent-switch-new-lawsuit-alleges-google-uses-gemini-ai-secretly-read-gmail-chat'),

  ((SELECT id FROM tools WHERE name = 'Microsoft Copilot'),
   'GitHub Copilot Copyright Litigation (N.D. Cal., now 9th Circuit)',
   'Surviving claims include DMCA violations and CCPA (reproducing personal data from training data). Active at appellate level.',
   'active', '2022',
   'https://www.saverilawfirm.com/our-cases/github-copilot-intellectual-property-litigation'),

  ((SELECT id FROM tools WHERE name = 'Midjourney'),
   'Disney & Universal v. Midjourney',
   'Copyright infringement suit over training on copyrighted characters. Warner Bros. joined Sept 2025. Trial set for late 2026.',
   'active', 'June 2025',
   'https://ipwatchdog.com/2025/06/11/disney-universal-become-latest-sue-midjourney-generative-ai/id=189579/'),

  ((SELECT id FROM tools WHERE name = 'Perplexity'),
   'Data-Sharing Class Action (Utah)',
   'Alleges Perplexity routes user queries to Meta and Google via hidden trackers without disclosure, including in Incognito mode.',
   'active', 'April 2026',
   'https://www.bloomberg.com/news/articles/2026-04-01/perplexity-ai-machine-accused-of-sharing-data-with-meta-google'),

  ((SELECT id FROM tools WHERE name = 'Grammarly'),
   'Expert Review Identity Misappropriation Class Action',
   'Alleges "Expert Review" feature misappropriated names and identities of journalists and authors without consent for commercial use.',
   'active', '2025',
   'https://topclassactions.com/lawsuit-settlements/lawsuit-news/grammarly-class-action-claims-ai-tool-used-writers-identities-without-consent/'),

  ((SELECT id FROM tools WHERE name = 'Otter.ai'),
   'Brewer v. Otter.ai, Inc. (Case No. 5:25-cv-06911, N.D. Cal.)',
   'Alleges Otter secretly records meeting participants who never consented and uses transcripts to train AI. Claims ECPA, CFAA, and California Invasion of Privacy Act violations.',
   'active', 'August 2025',
   'https://natlawreview.com/article/ai-notetaking-tools-under-fire-lessons-otterai-class-action-complaint'),

  ((SELECT id FROM tools WHERE name = 'Fireflies.ai'),
   'BIPA Class Action (N.D. Ill.)',
   'Alleges collection of voiceprints (biometric data) from meeting participants who never agreed to Fireflies terms, violating Illinois Biometric Information Privacy Act.',
   'active', 'March 2026',
   'https://www.ebglaw.com/insights/publications/ai-meeting-assistants-and-biometric-privacy-lessons-from-the-fireflies-ai-lawsuit');
