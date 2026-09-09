-- Add coluna favorito na tabela ganchos
-- Run in Supabase SQL Editor

ALTER TABLE ganchos ADD COLUMN IF NOT EXISTS favorito BOOLEAN DEFAULT false;