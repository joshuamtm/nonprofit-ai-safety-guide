# Grok (xAI) Evaluation

> **Note:** Grok (with a 'k') is xAI's chatbot owned by Elon Musk/X. This is different from Groq (with a 'q'), which is an AI inference platform. These are completely different products and companies.

**Vendor:** xAI (Elon Musk)
**Website:** https://grok.com / https://x.ai
**Categories:** writing, research, productivity
**Evaluation Date:** December 26, 2025

## Overall Rating: Not Recommended
**Score:** 36/100

---

## Summary

Grok is xAI's AI chatbot, integrated with X (Twitter) and available as a standalone product. While it offers some enterprise-grade features like SOC 2 compliance and SSO, significant concerns around training data ethics, environmental impact, and documented bias issues make it unsuitable for nonprofit organizational use. The chatbot has been involved in multiple high-profile incidents involving harmful outputs, and xAI has been criticized for lack of transparency around safety practices.

---

## Tier Evaluations

### Free Tier (via X)
**Rating:** Not Recommended
**Score:** 36/100
**Data Training Policy:** Yes (opt-out available but buried)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Data Privacy (2x) | 1/3 | Trains on user data by default; opt-out buried in settings; "Private Chat" mode available |
| Security (2x) | 2/3 | SOC 2 Type 2 for API; TLS encryption; but security concerns with base model |
| Terms of Service | 1/3 | User owns content but concerning ToS changes; reduced claim filing window |
| Accessibility | 1/3 | Read-aloud feature; no WCAG documentation; X fired accessibility team |
| Nonprofit Pricing | 2/3 | Free tier available with limits; no nonprofit discount |
| Environmental | 0/3 | Methane-powered data center; operating beyond permit limits; 2GW planned |
| Ethical Training | 0/3 | Trained on unfiltered X data; multiple bias incidents; no safety reports |
| Enterprise Controls | 1/3 | Limited controls on free tier |
| Sector Commitment | 0/3 | No nonprofit programs or sector focus |

### SuperGrok ($30/month)
**Rating:** Not Recommended
**Score:** 39/100
**Data Training Policy:** Opt-out available

Same fundamental concerns as Free tier, with slightly better controls.

### Grok Business ($30/user/month)
**Rating:** Caution
**Score:** 52/100
**Data Training Policy:** No (business data not used for training)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Data Privacy (2x) | 2/3 | Business data NOT used for training; ZDR available |
| Security (2x) | 2/3 | SOC 2 Type 2; GDPR/CCPA compliance; SSO available |
| Terms of Service | 1/3 | Better enterprise terms but parent company concerns remain |
| Accessibility | 1/3 | Same as consumer tiers |
| Nonprofit Pricing | 1/3 | $30/user/month; no nonprofit discount |
| Environmental | 0/3 | Same data center concerns |
| Ethical Training | 0/3 | Same fundamental model with documented issues |
| Enterprise Controls | 3/3 | SSO (SAML); 90-day audit trail; admin console; ZDR |
| Sector Commitment | 0/3 | No nonprofit programs |

---

## Key Findings

### Critical Concerns (Red Flags)

1. **Documented Bias Incidents** - Grok has produced Holocaust denial, antisemitic content, climate misinformation, and referred to itself as "MechaHitler"

2. **No Safety Transparency** - Unlike OpenAI, Anthropic, and Google, xAI publishes no system cards or safety evaluation reports

3. **Training Data Problems** - Trained on unfiltered X/Twitter data including "diverse, often unmoderated content with biases or inaccuracies"

4. **Environmental Harm** - Memphis data center operates 33 methane gas turbines (permitted for only 15) in a disadvantaged community with high pollution-related illness

5. **"Anti-Woke" Training** - Business Insider revealed instructions to human trainers to look for "woke ideology" and "cancel culture"

6. **Concerning ToS Changes** - X's January 2026 ToS expands "Content" definition to include AI interactions and reduces claim filing window

### Limited Positives

- SOC 2 Type 2 certification for API
- Enterprise tier doesn't use business data for training
- SSO and audit logs for business tier
- Free tier available
- Read-aloud accessibility feature

---

## Evidence Sources

### Primary Sources
- [xAI Privacy Policy](https://x.ai/legal/privacy-policy)
- [xAI Consumer Terms of Service](https://x.ai/legal/terms-of-service)
- [xAI Enterprise Terms](https://x.ai/legal/terms-of-service-enterprise)
- [xAI Security Page](https://x.ai/security)
- [xAI Acceptable Use Policy](https://x.ai/legal/acceptable-use-policy)
- [Grok Plans/Pricing](https://grok.com/plans)

### Security & Compliance
- [xAI Enterprise FAQ](https://x.ai/legal/faq-enterprise)
- [Promptfoo Grok 4 Security Report](https://promptfoo.dev/models/reports/grok-4)
- [Splx.ai Grok 4 Security Testing](https://splx.ai/blog/grok-4-security-testing)

### Ethical Concerns
- [AI Magazine: Grok 4 Ethical Concerns](https://aimagazine.com/news/the-story-behind-elon-musks-xai-grok-4-ethical-concerns)
- [AAF: Generative AI Output Oversight](https://www.americanactionforum.org/insight/generative-ai-output-oversight-what-grok-reveals/)
- [The Conversation: What Grok Drama Reveals](https://theconversation.com/how-do-you-stop-an-ai-model-turning-nazi-what-the-grok-drama-reveals-about-ai-training-261001)
- [UNU: Grok 3's Brush with Censorship](https://c3.unu.edu/blog/grok-3s-brush-with-censorship-xais-truth-seeking-ai)

### Environmental Impact
- [Sustainability Magazine: xAI Data Centre](https://sustainabilitymag.com/news/elon-musks-xai-imports-overseas-power-to-fuel-data-centre)
- [Tennessee Lookout: Memphis Community Impact](https://tennesseelookout.com/2025/07/07/a-billionaire-an-ai-supercomputer-toxic-emissions-and-a-memphis-community-that-did-nothing-wrong/)

### Privacy Concerns
- [CryptoSlate: X ToS Changes](https://cryptoslate.com/how-the-new-x-terms-of-service-gives-grok-permission-to-use-anything-you-say-forever-with-no-opt-out/)
- [Social Media Today: X Terms Update](https://www.socialmediatoday.com/news/x-formerly-twitter-updates-terms-service/730223/)

---

## Proxy Signals

| Source | Status | Notes |
|--------|--------|-------|
| FedRAMP | Not Listed | Not found on FedRAMP Marketplace |
| TechSoup | No Partnership | No TechSoup discounts available |
| Common Sense Media | Not Reviewed | No evaluation found |

---

## Recommendation

**Grok is Not Recommended for nonprofit organizational use.**

**Avoid Grok for:**
- Any organizational use involving sensitive data
- Client/constituent-facing applications
- Research or content generation requiring accuracy
- Organizations with environmental/sustainability commitments
- Use cases requiring bias-free outputs

**If you must use Grok:**
- Only consider the Business tier ($30/user/month)
- Enable all privacy controls
- Use "Private Chat" mode when available
- Do not use for sensitive topics
- Always verify outputs independently
- Document your rationale for organizational records

**Better alternatives:**
- Claude (Anthropic) - Better safety practices, transparent
- ChatGPT (OpenAI) - Established enterprise controls, nonprofit discount
- Gemini (Google) - Nonprofit pricing available
- Groq - If you need fast inference with privacy controls
