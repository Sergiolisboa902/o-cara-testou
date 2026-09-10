import { readFileSync } from 'node:fs'

export function loadEnv() {
  try {
    const content = readFileSync(new URL('../.env', import.meta.url), 'utf8')
    for (const line of content.split(/\r?\n/)) {
      const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/)
      if (m && !process.env[m[1]]) process.env[m[1]] = m[2]
    }
  } catch { /* sem .env */ }
}