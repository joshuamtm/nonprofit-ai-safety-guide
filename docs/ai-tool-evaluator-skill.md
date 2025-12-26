---
name: ai-tool-evaluator
description: Research and evaluate AI tools for the Nonprofit AI Safety Guide. Performs comprehensive due diligence across 9 evaluation criteria (data privacy, security, ToS, accessibility, pricing, environmental, ethical training, enterprise controls, sector commitment). Gathers evidence from vendor documentation, privacy policies, security certifications, and third-party sources. Generates ratings (0-3 per criterion), calculates weighted scores (0-100), and produces Supabase SQL insert statements. Use when adding a new AI tool to the guide or re-evaluating an existing tool.
---

# AI Tool Evaluator for Nonprofit AI Safety Guide

Research, evaluate, and add new AI tools to the Nonprofit AI Safety Guide with comprehensive due diligence across all 9 evaluation criteria.

## Required Inputs

Before starting evaluation, gather the following information:

### Required
1. **Tool Name** - The official name of the AI tool
2. **Vendor/Company** - The organization that makes/owns the tool
3. **Website URL** - The official tool website
4. **Categories** - One or more from: `writing`, `images`, `productivity`, `fundraising`, `data`, `communication`, `research`, `program`

### Optional (Will Be Researched If Not Provided)
- **Description** - Brief description of what the tool does (1-2 sentences)
- **Logo URL** - Direct URL to tool's logo image
- **Tiers to Evaluate** - Free, Pro, Enterprise, API (default: evaluate all available)
- **Specific Concerns** - Any particular areas to investigate deeply
- **Priority Reason** - Why this tool is being evaluated now

## Evaluation Process

### Phase 1: Information Gathering

Use web search and web fetch to gather information from these sources:

**Primary Sources (Required)**
1. **Official Privacy Policy** - Search: "[tool name] privacy policy"
2. **Terms of Service** - Search: "[tool name] terms of service"
3. **Security Documentation** - Search: "[tool name] security SOC2 compliance"
4. **Pricing Page** - Search: "[tool name] pricing nonprofit"
5. **Trust/Security Center** - Search: "[tool name] trust center security"

**Secondary Sources (Required)**
1. **Data Training Policy** - Search: "[tool name] data training AI model opt out"
2. **Enterprise Features** - Search: "[tool name] enterprise SSO admin controls"
3. **Accessibility** - Search: "[tool name] accessibility WCAG"
4. **Environmental/Sustainability** - Search: "[tool name] sustainability carbon footprint"

**Third-Party Verification (Check All)**
1. **FedRAMP Marketplace** - https://marketplace.fedramp.gov - Search for vendor
2. **Common Sense Media** - Search: "[tool name] site:commonsensemedia.org"
3. **TechSoup** - Search: "[tool name] site:techsoup.org" for nonprofit discounts
4. **Mozilla Foundation** - Search: "[tool name] site:foundation.mozilla.org"
5. **Recent News** - Search: "[tool name] data breach security incident 2024 2025"

### Phase 2: Evaluation Criteria

Rate each criterion from 0-3 based on evidence gathered:

#### 1. Data Privacy (Weight: 2x)
**What to look for:**
- Does the tool train on user data? (Check for opt-out)
- How is data stored and for how long?
- Can users delete their data?
- Is data shared with third parties?
- GDPR/CCPA compliance

**Scoring:**
- **3**: No training on user data, clear retention policies, easy deletion, no third-party sharing
- **2**: Opt-out available, reasonable retention, deletion available
- **1**: Opt-out unclear or limited, long retention, deletion difficult
- **0**: Trains on data by default with no opt-out, poor policies

#### 2. Security Posture (Weight: 2x)
**What to look for:**
- SOC 2 Type II certification
- FedRAMP authorization
- Encryption (at rest and in transit)
- Penetration testing
- Bug bounty program
- Incident response procedures

**Scoring:**
- **3**: SOC 2 Type II + additional certs (ISO 27001, FedRAMP), encryption, regular audits
- **2**: SOC 2 certified, encryption, documented security practices
- **1**: Basic security, some documentation, no major certifications
- **0**: No certifications, poor or undocumented security

#### 3. Terms of Service (Weight: 1x)
**What to look for:**
- Content ownership (who owns generated content?)
- Liability limitations
- Indemnification clauses
- Unilateral change provisions
- Arbitration requirements

**Scoring:**
- **3**: User owns content, balanced liability, clear change notification, no forced arbitration
- **2**: User owns content, reasonable terms, standard provisions
- **1**: Unclear content ownership, heavy liability disclaimers
- **0**: Vendor claims content rights, one-sided terms, problematic clauses

#### 4. Accessibility (Weight: 1x)
**What to look for:**
- WCAG 2.1 compliance level (A, AA, AAA)
- Screen reader support
- Keyboard navigation
- Accessibility statement/VPAT

**Scoring:**
- **3**: WCAG 2.1 AA or higher, VPAT available, accessibility statement
- **2**: Partial WCAG compliance, some accessibility features
- **1**: Limited accessibility, no formal compliance
- **0**: Poor accessibility, no consideration for disabilities

#### 5. Nonprofit Pricing (Weight: 1x)
**What to look for:**
- Nonprofit discounts available
- Free tier functionality
- TechSoup partnership
- Educational pricing
- Feature parity across tiers

**Scoring:**
- **3**: 50%+ nonprofit discount or robust free tier, TechSoup partnership
- **2**: Meaningful discount (25-50%) or good free tier
- **1**: Small discount or limited free tier
- **0**: No discount, expensive, limited free tier

#### 6. Environmental Impact (Weight: 1x)
**What to look for:**
- Carbon neutrality claims
- Renewable energy usage
- Sustainability reports
- Efficient model architecture
- Data center practices

**Scoring:**
- **3**: Carbon neutral/negative, renewable energy, sustainability reporting
- **2**: Some sustainability initiatives, efficiency considerations
- **1**: Limited environmental information
- **0**: No environmental consideration, inefficient operations

#### 7. Ethical Training Data (Weight: 1x)
**What to look for:**
- Training data transparency
- Bias mitigation efforts
- Content moderation
- Human feedback processes
- Third-party audits

**Scoring:**
- **3**: Transparent training data, active bias mitigation, external audits
- **2**: Some transparency, documented bias efforts
- **1**: Limited transparency, basic moderation
- **0**: No transparency, known bias issues, no mitigation

#### 8. Enterprise Controls (Weight: 1x)
**What to look for:**
- SSO/SAML support
- Admin console
- Audit logs
- User provisioning (SCIM)
- Data residency options
- API access controls

**Scoring:**
- **3**: Full enterprise suite (SSO, SCIM, audit logs, admin console, data residency)
- **2**: SSO and basic admin controls
- **1**: Limited admin features
- **0**: No enterprise controls

#### 9. Sector Commitment (Weight: 1x)
**What to look for:**
- Nonprofit sector focus or programs
- TechSoup partnership
- Nonprofit case studies
- Social impact initiatives
- Nonprofit advisory boards

**Scoring:**
- **3**: Strong nonprofit focus, TechSoup partner, dedicated nonprofit team
- **2**: Nonprofit program exists, some sector engagement
- **1**: Acknowledges nonprofits, limited programs
- **0**: No nonprofit consideration

### Phase 3: Score Calculation

**Weighted Score Formula:**
```
weighted_sum = (data_privacy × 2) + (security × 2) + (tos × 1) + (accessibility × 1)
             + (pricing × 1) + (environmental × 1) + (ethical_training × 1)
             + (enterprise_controls × 1) + (sector_commitment × 1)

max_weighted_sum = (3 × 2) + (3 × 2) + (3 × 7) = 33

overall_score = (weighted_sum / max_weighted_sum) × 100
```

**Rating Thresholds:**
- **Recommended** (75-100): Safe for most nonprofit use cases
- **Caution** (50-74): Review specific concerns before using
- **Not Recommended** (0-49): Significant concerns, avoid for organizational use

### Phase 4: Output Generation

Generate the following outputs:

#### 1. Evaluation Summary (Markdown)

```markdown
# [Tool Name] Evaluation

**Vendor:** [Company]
**Website:** [URL]
**Categories:** [list]
**Evaluation Date:** [date]

## Overall Rating: [Recommended/Caution/Not Recommended]
**Score:** [X]/100

## Tier Evaluations

### [Tier Name] Tier
**Rating:** [rating]
**Score:** [X]/100
**Data Training Policy:** [yes/no/opt-out/unclear]

| Criterion | Score | Notes |
|-----------|-------|-------|
| Data Privacy (2x) | X/3 | [brief note] |
| Security (2x) | X/3 | [brief note] |
| Terms of Service | X/3 | [brief note] |
| Accessibility | X/3 | [brief note] |
| Nonprofit Pricing | X/3 | [brief note] |
| Environmental | X/3 | [brief note] |
| Ethical Training | X/3 | [brief note] |
| Enterprise Controls | X/3 | [brief note] |
| Sector Commitment | X/3 | [brief note] |

**Key Findings:**
- [Finding 1]
- [Finding 2]
- [Finding 3]

**Evidence Sources:**
- [URL 1]
- [URL 2]
- [URL 3]

## Proxy Signals
- FedRAMP: [status]
- Common Sense: [status]
- TechSoup: [status]

## Recommendation
[2-3 sentence summary of recommendation for nonprofit use]
```

#### 2. Supabase SQL Insert Statements

Generate SQL that can be run in Supabase to add the tool:

```sql
-- Insert Tool
INSERT INTO tools (name, vendor, description, website_url, logo_url, categories)
VALUES (
  '[Tool Name]',
  '[Vendor]',
  '[Description]',
  '[Website URL]',
  '[Logo URL]',
  ARRAY['category1', 'category2']
)
RETURNING id;

-- Store the returned ID, then insert tiers
-- For each tier evaluated:

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
  '[tool_id from above]',
  '[Free/Pro/Enterprise]',
  '[approved/caution/not_recommended]',
  '[Rating notes]',
  '[yes/no/opt-out/unclear]',
  [true/false],
  [true/false],
  '[null/in_progress/authorized_low/authorized_moderate]'
)
RETURNING id;

-- Store the returned tier ID, then insert evaluations
-- For each criterion:

INSERT INTO evaluations (tool_tier_id, criteria_key, rating, notes, evidence_urls)
VALUES
  ('[tier_id]', 'data_privacy', [0-3], '[Notes]', ARRAY['[url1]', '[url2]']),
  ('[tier_id]', 'security', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'tos', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'accessibility', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'pricing', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'environmental', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'ethical_training', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'enterprise_controls', [0-3], '[Notes]', ARRAY['[url1]']),
  ('[tier_id]', 'sector_commitment', [0-3], '[Notes]', ARRAY['[url1]']);

-- Insert proxy signals if found
INSERT INTO proxy_signals (tool_id, source, signal_type, signal_value, source_url)
VALUES
  ('[tool_id]', 'fedramp', 'authorization', '[status]', '[url]'),
  ('[tool_id]', 'techsoup', 'partnership', '[yes/no]', '[url]');
```

## Quality Checks

Before finalizing, verify:

1. **Evidence Quality**
   - [ ] All ratings have supporting evidence URLs
   - [ ] Primary sources (official docs) used where possible
   - [ ] Information is current (within last 12 months)

2. **Completeness**
   - [ ] All 9 criteria evaluated
   - [ ] All available tiers assessed
   - [ ] Proxy signals checked

3. **Accuracy**
   - [ ] Scores align with rubric definitions
   - [ ] No contradictions between notes and scores
   - [ ] Calculations verified

4. **Nonprofit Lens**
   - [ ] Considered nonprofit-specific use cases
   - [ ] Noted relevant concerns for mission-driven orgs
   - [ ] Highlighted any nonprofit programs/discounts

## Red Flags to Highlight

Immediately flag these concerns in the evaluation:

- **Data Training**: Tool trains on user data with no opt-out
- **Security Incidents**: Recent breaches or security issues
- **Ownership Claims**: Vendor claims rights to user-generated content
- **Forced Arbitration**: Users waive right to sue
- **Dark Patterns**: Deceptive practices in UI or billing
- **Vendor Lock-in**: Difficult data export or migration
- **Hidden Costs**: Unexpected fees or aggressive upselling

## Workflow Summary

1. **Gather Required Inputs** - Confirm tool name, vendor, URL, categories
2. **Research Primary Sources** - Privacy policy, ToS, security docs
3. **Check Third-Party Sources** - FedRAMP, Common Sense, TechSoup
4. **Score Each Criterion** - Apply rubric with evidence
5. **Calculate Overall Score** - Use weighted formula
6. **Generate Outputs** - Markdown summary + SQL statements
7. **Quality Check** - Verify completeness and accuracy
8. **Present for Review** - Show evaluation before database insert

## Example Usage

**User Input:**
```
Evaluate Perplexity AI for the directory
- Categories: research, writing
- Focus on: data privacy concerns
```

**Process:**
1. Search for Perplexity AI privacy policy, ToS, security info
2. Check FedRAMP, Common Sense, TechSoup
3. Evaluate all 9 criteria across Free and Pro tiers
4. Calculate scores
5. Generate evaluation summary and SQL
6. Flag any data privacy concerns (per user request)
7. Present findings with recommendation
