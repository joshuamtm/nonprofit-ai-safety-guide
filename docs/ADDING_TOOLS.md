# Adding Tools to the Nonprofit AI Safety Guide

This guide explains how to research, evaluate, and add new AI tools to the directory.

## Quick Start

To evaluate a new AI tool, provide the following information:

### Required Inputs

| Input | Description | Example |
|-------|-------------|---------|
| **Tool Name** | Official name of the AI tool | "Perplexity AI" |
| **Vendor** | Company that makes the tool | "Perplexity Labs" |
| **Website URL** | Official website | "https://perplexity.ai" |
| **Categories** | One or more from the list below | "research, writing" |

### Available Categories

- `writing` - Writing & Content
- `images` - Image Generation
- `productivity` - Productivity
- `fundraising` - Fundraising & Donor Management
- `data` - Data Analysis
- `communication` - Communication
- `research` - Research
- `program` - Program Delivery

### Optional Inputs

| Input | Description |
|-------|-------------|
| **Description** | 1-2 sentence description (will be researched if not provided) |
| **Logo URL** | Direct URL to logo image |
| **Tiers** | Specific tiers to evaluate (default: all available) |
| **Concerns** | Specific areas to investigate deeply |
| **Priority Reason** | Why this tool is being evaluated |

## Evaluation Criteria

Each tool is evaluated across 9 criteria, scored 0-3:

| Criterion | Weight | What We Evaluate |
|-----------|--------|------------------|
| **Data Privacy** | 2x | Training policies, data retention, deletion rights |
| **Security** | 2x | SOC 2, FedRAMP, encryption, audits |
| **Terms of Service** | 1x | Content ownership, liability, arbitration |
| **Accessibility** | 1x | WCAG compliance, screen reader support |
| **Nonprofit Pricing** | 1x | Discounts, free tier, TechSoup partnership |
| **Environmental** | 1x | Carbon footprint, sustainability |
| **Ethical Training** | 1x | Training data transparency, bias mitigation |
| **Enterprise Controls** | 1x | SSO, admin console, audit logs |
| **Sector Commitment** | 1x | Nonprofit programs, sector engagement |

## Rating Thresholds

| Rating | Score Range | Meaning |
|--------|-------------|---------|
| Recommended | 75-100 | Safe for most nonprofit use cases |
| Caution | 50-74 | Review specific concerns before using |
| Not Recommended | 0-49 | Significant concerns, avoid for org use |

## Using the Claude Code Skill

If you have Claude Code, you can use the `ai-tool-evaluator` skill:

```
/ai-tool-evaluator

Evaluate [Tool Name] for the directory
- Vendor: [Company]
- URL: [website]
- Categories: [category1, category2]
```

The skill will:
1. Research the tool across all 9 criteria
2. Check third-party sources (FedRAMP, TechSoup, Common Sense)
3. Generate a detailed evaluation report
4. Produce SQL insert statements for Supabase

## Manual Process

If not using the skill, follow these steps:

### Step 1: Research Primary Sources

- [ ] Privacy Policy
- [ ] Terms of Service
- [ ] Security/Trust Center
- [ ] Pricing Page
- [ ] Accessibility Statement

### Step 2: Check Third-Party Sources

- [ ] [FedRAMP Marketplace](https://marketplace.fedramp.gov)
- [ ] Common Sense Media
- [ ] TechSoup
- [ ] Recent security news

### Step 3: Score Each Criterion

Use the detailed rubric in `ai-tool-evaluator-skill.md` to score each criterion 0-3.

### Step 4: Calculate Overall Score

```
weighted_sum = (data_privacy × 2) + (security × 2) + sum(other_criteria × 1)
overall_score = (weighted_sum / 33) × 100
```

### Step 5: Add to Database

Use the Supabase SQL Editor to insert:
1. Tool record in `tools` table
2. Tier records in `tool_tiers` table
3. Evaluation records in `evaluations` table
4. Any proxy signals in `proxy_signals` table

## Questions?

Open an issue or contact the MTM team.
