-- Applied to production 2026-07-16 (via Supabase MCP, migration name: add_tool_status_and_auto_changelog)
-- Adds tool lifecycle status for deprecation support + automatic changelog on rating changes.
-- Required by the Weekly Auto-Updater routine (see docs/ADDING_TOOLS.md, "Automated Weekly Updates").

-- Tool lifecycle status: active (default), deprecated (vendor defunct/acquired/sunset), under_review
ALTER TABLE tools ADD COLUMN IF NOT EXISTS status TEXT NOT NULL DEFAULT 'active'
  CHECK (status IN ('active', 'deprecated', 'under_review'));
ALTER TABLE tools ADD COLUMN IF NOT EXISTS status_reason TEXT;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS status_changed_at TIMESTAMPTZ;

CREATE INDEX IF NOT EXISTS idx_tools_status ON tools(status);

-- Auto-log rating changes so the automation can't silently rewrite history
CREATE OR REPLACE FUNCTION log_rating_change()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.overall_rating IS DISTINCT FROM OLD.overall_rating THEN
    INSERT INTO evaluation_changelog (tool_tier_id, previous_rating, new_rating, change_reason)
    VALUES (NEW.id, OLD.overall_rating, NEW.overall_rating,
            COALESCE(NULLIF(NEW.rating_notes, OLD.rating_notes), 'Rating changed (no reason provided)'));
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS log_tool_tier_rating_change ON tool_tiers;
CREATE TRIGGER log_tool_tier_rating_change
  BEFORE UPDATE ON tool_tiers
  FOR EACH ROW
  EXECUTE FUNCTION log_rating_change();
