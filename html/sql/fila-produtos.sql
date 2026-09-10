-- Migration: Fila de produtos aguardando cadastro pelo assistente
-- Run in Supabase SQL Editor
-- Safe to run: IF NOT EXISTS

-- ============================================
-- TABELA: fila_produtos (links aguardando análise/cadastro)
-- ============================================
CREATE TABLE IF NOT EXISTS fila_produtos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users NOT NULL,
  link TEXT NOT NULL,
  print_base64 TEXT DEFAULT '',
  status TEXT DEFAULT 'pendente',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================
ALTER TABLE fila_produtos ENABLE ROW LEVEL SECURITY;

-- ============================================
-- POLICIES
-- ============================================
CREATE POLICY "Users can manage own fila_produtos"
  ON fila_produtos FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================
-- INDEXES
-- ============================================
CREATE INDEX idx_fila_produtos_user ON fila_produtos(user_id);