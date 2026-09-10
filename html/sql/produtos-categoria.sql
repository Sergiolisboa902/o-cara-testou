-- Migration: Adiciona coluna categoria na tabela produtos
-- Run in Supabase SQL Editor
-- Safe to run: IF NOT EXISTS

ALTER TABLE produtos ADD COLUMN IF NOT EXISTS categoria TEXT DEFAULT '';