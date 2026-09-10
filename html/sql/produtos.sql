-- Migration: Produtos (estrutura paralela ao dados-produtos.js)
-- Run in Supabase SQL Editor
-- Safe to run: IF NOT EXISTS

-- ============================================
-- TABELA: produtos (mesma estrutura do dados-produtos.js)
-- ============================================
CREATE TABLE IF NOT EXISTS produtos (
  id TEXT PRIMARY KEY,
  user_id UUID REFERENCES auth.users NOT NULL,
  nome TEXT NOT NULL,
  categoria TEXT DEFAULT '',
  descricao TEXT DEFAULT '',
  resumo TEXT DEFAULT '',
  problemas TEXT DEFAULT '',
  beneficios TEXT DEFAULT '',
  caracteristicas TEXT DEFAULT '',
  diferenciais TEXT DEFAULT '',
  testes TEXT DEFAULT '',
  momentosWow TEXT DEFAULT '',
  publicoIdeal TEXT DEFAULT '',
  objecoes TEXT DEFAULT '',
  curiosidades TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================
ALTER TABLE produtos ENABLE ROW LEVEL SECURITY;

-- ============================================
-- POLICIES: cada usuário só vê/edita os próprios produtos
-- ============================================
CREATE POLICY "Users can manage own produtos"
  ON produtos FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================
-- INDEXES
-- ============================================
CREATE INDEX idx_produtos_user ON produtos(user_id);