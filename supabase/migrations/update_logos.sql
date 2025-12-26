-- Update logos for NotebookLM, Grok, and Groq
-- Run in Supabase SQL Editor: https://supabase.com/dashboard/project/evlzeqhybsihzsteoaye/sql

-- Update NotebookLM logo
UPDATE tools
SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkr9CxQf4bXpGXcWVyqCE3l2XRAfvgUQm_IkUiHQw&s=0'
WHERE name = 'NotebookLM';

-- Update Grok logo (xAI)
UPDATE tools
SET logo_url = 'https://pngdownload.io/wp-content/uploads/2025/05/Grok-Logo-xAI-Futuristic-AI.webp'
WHERE name = 'Grok';

-- Update Groq logo (inference platform)
UPDATE tools
SET logo_url = 'https://www.ciscoinvestments.com/assets/logos/groq-logo.png'
WHERE name = 'Groq';

-- Verify updates
SELECT name, logo_url FROM tools WHERE name IN ('NotebookLM', 'Grok', 'Groq');
