# Skill: Content Automation & Social Media
**Last Updated:** March 15, 2026

## Social Media Auto Poster
Platforms: X + LinkedIn + Instagram
Flow: Content Trigger → AI Generator (platform-specific) → Router → X/LinkedIn/Instagram APIs → Log
Rules: Never post identical content — reformat per platform. LinkedIn: professional, longer. X: <280 chars. Instagram: visual-first.

## Content Generator (v1/v2/v3)
v1: Single platform, manual trigger
v2: Multi-platform, scheduled, A/B testing
v3: Multiple types (posts/threads/carousels), analytics feedback loop, brand voice enforcement

## Canva Brochure Email Sender
Template Selection → Variable Injection → Canva API → PDF → Gmail → Supabase delivery log
Needs: Canva API key, template IDs, Gmail OAuth, Supabase table

## Email Automation Bot
Categories: LEAD / SUPPORT / URGENT / SPAM
Extracts: sender_name, company, query_type, urgency_level (1-5), suggested_response
Auto-responds to common queries, extracts leads, syncs to CRM

## LLM Podcast Engine (Bonus)
Stack: Next.js + Groq + ElevenLabs + Firecrawl
Generates audio podcasts from news articles
Setup: pnpm install → set FIRECRAWL_API_KEY, GROQ_API_KEY, ELEVENLABS_API_KEY → pnpm dev

## Source Files
- Downloads/Code & Data/Social_Media_Auto_Poster.json
- Downloads/Code & Data/Content_Generator.json (v1-3)
- Downloads/Code & Data/Canva_Brochure_Email_Sender.json
- Downloads/Code & Data/Email_Automation_Bot.json
