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
  foto TEXT DEFAULT '',
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

-- Add foto column if upgrading existing table
ALTER TABLE products ADD COLUMN IF NOT EXISTS foto TEXT DEFAULT '';

-- Storage bucket for product photos
INSERT INTO storage.buckets (id, name, public) VALUES ('product-photos', 'product-photos', true)
ON CONFLICT (id) DO NOTHING;

-- Allow public read access to product photos
CREATE POLICY "Public read product photos"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'product-photos');

-- Allow authenticated users to upload their own photos
CREATE POLICY "Users can upload product photos"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'product-photos'
    AND auth.role() = 'authenticated'
  );

-- Allow users to delete their own photos
CREATE POLICY "Users can delete own product photos"
  ON storage.objects FOR DELETE
  USING (
    bucket_id = 'product-photos'
    AND auth.role() = 'authenticated'
  );
