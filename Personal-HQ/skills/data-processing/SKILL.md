# Skill: Data Processing & Analytics
**Last Updated:** March 15, 2026

## Supabase RAG AI Agent (21 nodes)
Trigger: Google Drive upload OR chat message
Flow: Doc extraction → chunking (512-1024 tokens) → OpenAI embeddings → Supabase pgvector → similarity search → GPT-4 + context → response with citations
Supabase setup: CREATE EXTENSION vector; CREATE TABLE documents (id, content, metadata, embedding VECTOR(1536)); CREATE INDEX ivfflat

## DATA CLEANER (4 nodes)
Purpose: Government/public data normalization
Flow: Manual trigger → fetch raw data → GPT-4o-mini cleaning → Google Sheets output
Prompt: "Organise data, remove symbols/artifacts, output clean JSON, standardize dates to ISO-8601, phones to +91XXXXXXXXXX, flag duplicates"

## AAER Suite (8 workflows)
SEC Administrative and Cease-and-Desist Releases
Workflows: Fetcher → Parser → Classifier → Entity Extractor → Timeline Builder → Pattern Analyzer → Report Generator → DB Updater
Use: Law dissertation research, Fraudopedia training data, compliance monitoring

## Crypto Data Analyzer
Exchange APIs → technical indicators (MA/RSI/MACD) → AI trend analysis → alerts on significant moves

## Case Organizer
Legal case management: import docs → extract facts/dates/parties → timeline → summary

## Source Files
- Downloads/Code & Data/Supabase_RAG_AI_Agent.json
- Downloads/Code & Data/DATA_CLEANER.json
- Downloads/Code & Data/AAER_Engine*.json (8 files)
- Downloads/Code & Data/Crypto_Data_Analyzer.json
