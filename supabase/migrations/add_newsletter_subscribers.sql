-- Migration: Add newsletter_subscribers table
-- Run this in your Supabase SQL Editor

-- Newsletter Subscribers: Email signups
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT NOT NULL UNIQUE,
  subscribed_at TIMESTAMPTZ DEFAULT NOW(),
  unsubscribed_at TIMESTAMPTZ,
  source TEXT DEFAULT 'website' -- website, api, import
);

-- Create index for email lookups
CREATE INDEX IF NOT EXISTS idx_newsletter_email ON newsletter_subscribers(email);

-- Enable Row Level Security
ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;

-- Allow public insert (for signups from website)
CREATE POLICY "Allow public insert on newsletter_subscribers"
  ON newsletter_subscribers
  FOR INSERT
  WITH CHECK (true);

-- Verify table was created
SELECT 'newsletter_subscribers table created successfully' AS status;
