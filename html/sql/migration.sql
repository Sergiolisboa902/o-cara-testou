-- Migration: O Cara Testou - Supabase schema
-- Run this in Supabase SQL Editor

-- Products table
CREATE TABLE products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users NOT NULL,
  nome TEXT NOT NULL,
  categoria TEXT DEFAULT '',
  preco TEXT DEFAULT '',
  link TEXT DEFAULT '',
  resumo TEXT DEFAULT '',
  cards JSONB DEFAULT '[]',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Scripts (roteiros) table
CREATE TABLE scripts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users NOT NULL,
  nome TEXT NOT NULL,
  selections JSONB DEFAULT '{}',
  produto_id TEXT,
  selected_prod_cards JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE scripts ENABLE ROW LEVEL SECURITY;

-- Policies: each user only sees/edits their own data
CREATE POLICY "Users can manage own products"
  ON products FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own scripts"
  ON scripts FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Indexes for faster queries
CREATE INDEX idx_products_user ON products(user_id);
CREATE INDEX idx_scripts_user ON scripts(user_id);
