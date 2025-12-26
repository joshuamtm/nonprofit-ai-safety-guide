# Nonprofit AI Tools Safety Guide

A searchable directory of AI tools evaluated against a nonprofit-specific rubric for trust, safety, privacy, and responsibility. Tools are rated Recommended, Caution, or Not Recommended based on comprehensive evaluation.

**Built by [Meet the Moment (MTM)](https://mtm.now)**

## Features

- **Tool Directory**: Browse AI tools with clear Approved/Caution/Not Recommended ratings
- **8-Category Evaluation**: Each tool evaluated on data privacy, security, ToS, accessibility, pricing, environmental impact, ethical training, and enterprise controls
- **Tier-Based Ratings**: Separate evaluations for Free, Pro, and Enterprise tiers
- **Policy Matrix Generator**: Create customized AI usage policies for your organization
- **Request Reviews**: Submit tools for evaluation

## Tech Stack

- **Frontend**: React + Vite
- **Styling**: Tailwind CSS v3
- **Database**: Supabase (PostgreSQL)
- **Hosting**: Netlify

## Getting Started

### Prerequisites

- Node.js 18+
- npm or yarn
- Supabase account

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/joshuamtm/nonprofit-ai-safety-guide.git
   cd nonprofit-ai-safety-guide
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up Supabase**
   - Create a new Supabase project at [supabase.com](https://supabase.com)
   - Go to SQL Editor and run `supabase/schema.sql` to create tables
   - Run `supabase/seed.sql` to populate sample data
   - Copy your project URL and anon key from Settings > API

4. **Configure environment**
   ```bash
   cp .env.example .env
   ```
   Edit `.env` with your Supabase credentials:
   ```
   VITE_SUPABASE_URL=https://your-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```

5. **Start development server**
   ```bash
   npm run dev
   ```

### Deployment

The project is configured for Netlify deployment:

1. Push to GitHub
2. Connect repository to Netlify
3. Add environment variables in Netlify dashboard
4. Deploy!

## Project Structure

```
src/
├── components/
│   ├── layout/         # Header, Footer, Layout
│   ├── tools/          # ToolCard, ToolGrid, filters
│   ├── evaluation/     # Scoring breakdown, proxy signals
│   ├── forms/          # Request form, newsletter
│   ├── policy-matrix/  # Policy generator wizard
│   └── ui/             # Button, Card, Badge, Input
├── pages/              # Route components
├── lib/                # Supabase client, utilities
└── App.jsx             # Router configuration
```

## Evaluation Criteria

Tools are scored 0-3 on each criterion, weighted and normalized to a 0-100 scale:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Data Privacy | 2x | Data handling, training policies |
| Security | 2x | Certifications, encryption, access controls |
| Terms of Service | 1x | Content rights, liability, data ownership |
| Accessibility | 1x | WCAG compliance, screen reader support |
| Nonprofit Pricing | 1x | Discounts, free tier functionality |
| Environmental | 1x | Carbon footprint, sustainability |
| Ethical Training | 1x | Training data transparency, bias mitigation |
| Enterprise Controls | 1x | Admin console, SSO, compliance tools |
| Sector Commitment | 1x | Vendor's nonprofit sector commitment, TechSoup partnership |

**Rating Thresholds (0-100 scale):**
- ✅ **Recommended** (75-100): Safe for most nonprofit use cases
- ⚠️ **Caution** (50-74): Review specific concerns before using
- ❌ **Not Recommended** (0-49): Significant concerns, avoid for organizational use

## Contributing

We welcome contributions! Please see our contributing guidelines for details.

## License

Copyright © 2025 Meet the Moment. All rights reserved.

## Disclaimer

This directory provides guidance for informational purposes only and does not constitute legal, regulatory, or professional advice. Tool evaluations are point-in-time assessments and may not reflect current vendor practices. Always verify critical information directly with vendors before making decisions.
