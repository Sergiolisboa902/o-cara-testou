import { readFileSync } from 'node:fs'
import { loadEnv } from './env.mjs'

loadEnv()

const SUPA = process.env.SUPABASE_URL
const SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY

if (!SUPA || !SERVICE_KEY) {
  console.error('ERRO: defina SUPABASE_URL e SUPABASE_SERVICE_KEY no .env')
  process.exit(1)
}

const file = process.argv[2]
if (!file) {
  console.error('Uso: node scripts/inserir-produto.mjs <arquivo.json>')
  process.exit(1)
}

const produto = JSON.parse(readFileSync(file, 'utf8'))

async function api(path, opts = {}) {
  const res = await fetch(`${SUPA}${path}`, {
    ...opts,
    headers: {
      apikey: SERVICE_KEY,
      Authorization: `Bearer ${SERVICE_KEY}`,
      ...(opts.headers || {})
    }
  })
  if (!res.ok) throw new Error(`${res.status}: ${await res.text()}`)
  return res.json()
}

if (!produto.user_id) {
  const existentes = await api('/rest/v1/produtos?select=user_id&limit=1')
  if (!existentes.length) {
    console.error('ERRO: tabela produtos vazia e user_id não informado no JSON.')
    process.exit(1)
  }
  produto.user_id = existentes[0].user_id
  console.log(`user_id detectado: ${produto.user_id}`)
}

const MAPA = {
  momentosWow: 'momentoswow',
  publicoIdeal: 'publicoideal'
}
const campos = [
  'id', 'user_id', 'nome', 'descricao', 'resumo', 'problemas', 'beneficios',
  'caracteristicas', 'diferenciais', 'testes', 'momentosWow', 'publicoIdeal',
  'objecoes', 'curiosidades'
]

const body = {}
for (const c of campos) {
  if (produto[c] !== undefined) body[MAPA[c] || c] = produto[c]
}

try {
  await api('/rest/v1/produtos', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Prefer: 'resolution=merge-duplicates,return=representation'
    },
    body: JSON.stringify(body)
  })
  console.log(`OK: produto "${body.nome}" inserido/atualizado (id: ${body.id})`)
} catch (e) {
  console.error('ERRO ao inserir:', e.message)
  process.exit(1)
}