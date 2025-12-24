-- Trusted AI Tools Directory - Supabase Schema
-- Run this in your Supabase SQL editor to create the database structure

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tools: Core AI tool information
CREATE TABLE IF NOT EXISTS tools (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  vendor TEXT,
  description TEXT,
  website_url TEXT,
  logo_url TEXT,
  categories TEXT[], -- writing, images, productivity, fundraising, etc.
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tool Tiers: Free, Pro, Enterprise versions
CREATE TABLE IF NOT EXISTS tool_tiers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tool_id UUID REFERENCES tools(id) ON DELETE CASCADE,
  tier_name TEXT NOT NULL, -- "Free", "Pro", "Enterprise", "API"
  overall_rating TEXT, -- approved, caution, not_recommended, under_review
  rating_notes TEXT,
  last_reviewed_at TIMESTAMPTZ DEFAULT NOW(),
  data_training_policy TEXT, -- yes, no, opt-out, unclear
  requires_contract BOOLEAN DEFAULT FALSE,
  soc2_certified BOOLEAN DEFAULT FALSE,
  fedramp_status TEXT -- null, in_progress, authorized_low, authorized_moderate
);

-- Evaluations: Scores per category per tier
CREATE TABLE IF NOT EXISTS evaluations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tool_tier_id UUID REFERENCES tool_tiers(id) ON DELETE CASCADE,
  criteria_key TEXT NOT NULL, -- data_privacy, security, tos, accessibility, etc.
  rating INTEGER CHECK (rating >= 0 AND rating <= 3), -- 0-3
  notes TEXT,
  evidence_urls TEXT[],
  reviewed_at TIMESTAMPTZ DEFAULT NOW()
);

-- Proxy Signals: External verification sources
CREATE TABLE IF NOT EXISTS proxy_signals (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tool_id UUID REFERENCES tools(id) ON DELETE CASCADE,
  source TEXT NOT NULL, -- fedramp, common_sense, mozilla, govai_coalition
  signal_type TEXT,
  signal_value TEXT,
  source_url TEXT,
  last_checked_at TIMESTAMPTZ DEFAULT NOW()
);

-- Review Requests: User submissions
CREATE TABLE IF NOT EXISTS review_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tool_name TEXT NOT NULL,
  tool_url TEXT,
  requester_email TEXT,
  requester_org TEXT,
  priority_reason TEXT,
  status TEXT DEFAULT 'pending', -- pending, in_progress, completed, declined
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Evaluation Changelog: Rating history
CREATE TABLE IF NOT EXISTS evaluation_changelog (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tool_tier_id UUID REFERENCES tool_tiers(id) ON DELETE CASCADE,
  previous_rating TEXT,
  new_rating TEXT,
  change_reason TEXT,
  changed_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_tools_name ON tools(name);
CREATE INDEX IF NOT EXISTS idx_tools_categories ON tools USING GIN(categories);
CREATE INDEX IF NOT EXISTS idx_tool_tiers_tool_id ON tool_tiers(tool_id);
CREATE INDEX IF NOT EXISTS idx_tool_tiers_rating ON tool_tiers(overall_rating);
CREATE INDEX IF NOT EXISTS idx_evaluations_tier_id ON evaluations(tool_tier_id);
CREATE INDEX IF NOT EXISTS idx_proxy_signals_tool_id ON proxy_signals(tool_id);
CREATE INDEX IF NOT EXISTS idx_review_requests_status ON review_requests(status);

-- Enable Row Level Security (RLS)
ALTER TABLE tools ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_tiers ENABLE ROW LEVEL SECURITY;
ALTER TABLE evaluations ENABLE ROW LEVEL SECURITY;
ALTER TABLE proxy_signals ENABLE ROW LEVEL SECURITY;
ALTER TABLE review_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE evaluation_changelog ENABLE ROW LEVEL SECURITY;

-- Public read access policies
CREATE POLICY "Allow public read access on tools" ON tools FOR SELECT USING (true);
CREATE POLICY "Allow public read access on tool_tiers" ON tool_tiers FOR SELECT USING (true);
CREATE POLICY "Allow public read access on evaluations" ON evaluations FOR SELECT USING (true);
CREATE POLICY "Allow public read access on proxy_signals" ON proxy_signals FOR SELECT USING (true);

-- Public insert for review requests
CREATE POLICY "Allow public insert on review_requests" ON review_requests FOR INSERT WITH CHECK (true);

-- Updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Add trigger to tools table
DROP TRIGGER IF EXISTS update_tools_updated_at ON tools;
CREATE TRIGGER update_tools_updated_at
  BEFORE UPDATE ON tools
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
