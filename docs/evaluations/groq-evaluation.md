# Groq Evaluation

> **Note:** Groq (with a 'q') is a separate company from Grok (with a 'k'). Groq is an AI inference platform using LPU chips. Grok is xAI's chatbot owned by Elon Musk/X. These are completely different products.

**Vendor:** Groq, Inc.
**Website:** https://groq.com
**Categories:** research, data, productivity, writing
**Evaluation Date:** December 26, 2025

## Overall Rating: Recommended
**Score:** 76/100

---

## Summary

Groq is an ultra-fast AI inference platform powered by proprietary LPU (Language Processing Unit) technology. Unlike model providers like OpenAI or Anthropic, Groq provides infrastructure for running various open-source and proprietary LLMs at exceptional speed. Their strong privacy controls, SOC 2 certification, and energy-efficient architecture make them a solid choice for nonprofits needing fast AI inference with minimal data retention concerns.

---

## Tier Evaluations

### Free Tier
**Rating:** Recommended
**Score:** 76/100
**Data Training Policy:** No (does not train on user data)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Data Privacy (2x) | 3/3 | No training on user data; Zero Data Retention option available; clear policies |
| Security (2x) | 3/3 | SOC 2 Type II certified; Trust Center; encryption; bug bounty program |
| Terms of Service | 3/3 | User owns prompts/outputs; IP assigned to user; reasonable terms |
| Accessibility | 1/3 | No accessibility statement or WCAG compliance documentation found |
| Nonprofit Pricing | 2/3 | Free tier available with rate limits; no specific nonprofit discount |
| Environmental | 3/3 | LPU 10x more energy efficient than GPUs; DOE partnership on sustainability |
| Ethical Training | 1/3 | Inference-only platform; limited model training transparency |
| Enterprise Controls | 2/3 | Data Controls available; ZDR option; SSO details require sales contact |
| Sector Commitment | 1/3 | No nonprofit programs, TechSoup partnership, or sector focus |

### Developer Tier
**Rating:** Recommended
**Score:** 76/100
**Data Training Policy:** No

Same scores as Free tier, with additional benefits:
- 10x higher rate limits
- 25% cost discount on tokens
- Batch API access (50% discount, 24-hour processing)

### Enterprise Tier
**Rating:** Recommended (estimated)
**Score:** 78/100 (estimated)
**Data Training Policy:** No

Enterprise features likely include:
- Dedicated or multi-tenant instances
- Advanced admin controls
- Potential SSO/SCIM (contact sales to confirm)
- Custom data residency options

---

## Key Findings

### Strengths
1. **Excellent data privacy** - No training on user data; Zero Data Retention option available for all users
2. **Strong security posture** - SOC 2 Type II certified with documented security practices
3. **User-friendly content rights** - Users retain full IP rights to prompts and outputs
4. **Sustainability leader** - LPU technology uses 10x less energy than GPUs (1-3 vs 10-30 Joules per token)
5. **Free tier available** - No credit card required to start

### Concerns
1. **Limited accessibility documentation** - No WCAG compliance information or VPAT
2. **No nonprofit programs** - No discounts, TechSoup partnership, or sector focus
3. **Limited model transparency** - As an inference platform, training data decisions depend on hosted models
4. **Enterprise controls unclear** - SSO/SCIM details require contacting sales

### Important Notes
- Groq is an **inference platform**, not a model provider. They run models created by others (Llama, Mistral, etc.)
- Data is stored in Google Cloud Platform (US); Standard Contractual Clauses apply for international transfers
- Default retention is 0 days; temporary 30-day retention only for troubleshooting/abuse detection (can be disabled)

---

## Evidence Sources

### Primary Sources
- [Privacy Policy](https://groq.com/privacy-policy)
- [Your Data in GroqCloud](https://console.groq.com/docs/your-data)
- [Terms of Use](https://groq.com/terms-of-use)
- [Services Agreement](https://console.groq.com/docs/legal/services-agreement)
- [Acceptable Use & Responsible AI Policy](https://console.groq.com/docs/legal/ai-policy)
- [Trust Center](https://trust.groq.com/)
- [Data Processing Addendum](https://console.groq.com/docs/legal/customer-data-processing-addendum)

### Security & Compliance
- [Security Page](https://groq.com/security)
- [SOC 2 Type II Announcement](https://www.linkedin.com/posts/groq_big-news-groq-is-now-soc-2-type-ii-compliant-activity-7225190193073373185-ZyPL)
- [Groq Community - SOC 2 Compliance](https://community.groq.com/t/is-groq-soc-2-compliant/82)

### Pricing
- [Pricing Page](https://groq.com/pricing)
- [Developer Tier Announcement](https://groq.com/blog/developer-tier-now-available-on-groqcloud)

### Environmental
- [LPU Technology](https://groq.com/lpu-architecture)
- [DOE Partnership Announcement](https://groq.com/newsroom/groq-partners-with-us-department-of-energy-to-advance-ai-inference-and-next-generation-computing-infrastructure)
- [TDK Ventures Investment Rationale](https://medium.com/tdk-ventures/why-we-invested-in-groq-14801f0182db)

---

## Proxy Signals

| Source | Status | Notes |
|--------|--------|-------|
| FedRAMP | Not Listed | Not found on FedRAMP Marketplace |
| TechSoup | No Partnership | No TechSoup discounts available |
| Common Sense Media | Not Reviewed | No evaluation found |

---

## Recommendation

**Groq is Recommended for nonprofit use** with the following considerations:

**Best suited for:**
- Organizations needing fast AI inference with strong privacy controls
- Technical teams building applications with open-source LLMs
- Use cases requiring Zero Data Retention guarantees
- Organizations prioritizing sustainability/energy efficiency

**Consider alternatives if:**
- You need guaranteed WCAG accessibility compliance
- You require FedRAMP authorization
- You need nonprofit-specific pricing discounts
- You want a turnkey solution (Groq is more developer-focused)

**Recommended configuration:**
- Enable Zero Data Retention in Data Controls
- Use Developer tier for better rate limits at 25% discount
- Confirm enterprise features with sales before committing to sensitive use cases
