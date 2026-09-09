-- Migration: Missões de Produção de Conteúdo
-- Run in Supabase SQL Editor
-- Safe to run: usa IF NOT EXISTS (não quebra se as tabelas já existem)

-- ============================================
-- TABELA: ganchos (banco padrão de ganchos por categoria)
-- ============================================
CREATE TABLE IF NOT EXISTS ganchos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users NOT NULL,
  categoria TEXT NOT NULL,
  texto TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- TABELA: missions (missões com ganchos escolhidos)
-- ============================================
CREATE TABLE IF NOT EXISTS missions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users NOT NULL,
  produto TEXT NOT NULL,
  ganchos JSONB DEFAULT '[]',
  criado_em TIMESTAMPTZ DEFAULT now(),
  atualizado_em TIMESTAMPTZ DEFAULT now()
);

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================
ALTER TABLE ganchos ENABLE ROW LEVEL SECURITY;
ALTER TABLE missions ENABLE ROW LEVEL SECURITY;

-- ============================================
-- POLICIES: cada usuário só vê/edita os próprios dados
-- ============================================
CREATE POLICY "Users can manage own ganchos"
  ON ganchos FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own missions"
  ON missions FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================
-- INDEXES for faster queries
-- ============================================
CREATE INDEX idx_ganchos_user ON ganchos(user_id);
CREATE INDEX idx_ganchos_categoria ON ganchos(categoria);
CREATE INDEX idx_missions_user ON missions(user_id);

-- ============================================
-- COLUNAS: Cenário e Figurino nas missões
-- ============================================
ALTER TABLE missions ADD COLUMN IF NOT EXISTS cenario TEXT DEFAULT '';
ALTER TABLE missions ADD COLUMN IF NOT EXISTS figurino TEXT DEFAULT '';