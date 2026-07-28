// Supabase client + API for O Cara Testou
// Load after config.js
// <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>

const _supabase = supabase.createClient(
  window.SUPABASE_URL || '',
  window.SUPABASE_ANON_KEY || ''
)

// === AUTH ===
async function signIn(email, password) {
  const { data, error } = await _supabase.auth.signInWithPassword({ email, password })
  if (error) throw error
  return data
}

async function signUp(email, password) {
  const { data, error } = await _supabase.auth.signUp({ email, password })
  if (error) throw error
  return data
}

async function signOut() {
  await _supabase.auth.signOut()
}

function onAuthChange(callback) {
  _supabase.auth.onAuthStateChange((event, session) => callback(session))
}

async function getSession() {
  const { data } = await _supabase.auth.getSession()
  return data.session
}

// === PRODUCTS ===
async function loadProducts() {
  const session = await getSession()
  if (!session) return []
  const { data, error } = await _supabase
    .from('products')
    .select('*')
    .eq('user_id', session.user.id)
    .order('created_at', { ascending: false })
  if (error) throw error
  return data.map(p => ({
    id: p.id,
    nome: p.nome,
    categoria: p.categoria || '',
    preco: p.preco || '',
    link: p.link || '',
    resumo: p.resumo || '',
    foto: p.foto || '',
    cards: p.cards || [],
    data: p.created_at
  }))
}

async function saveProduct(p) {
  const session = await getSession()
  if (!session) throw new Error('Not authenticated')
  const record = {
    user_id: session.user.id,
    nome: p.nome,
    categoria: p.categoria || '',
    preco: p.preco || '',
    link: p.link || '',
    resumo: p.resumo || '',
    foto: p.foto || '',
    cards: p.cards || []
  }
  if (p.id && !p.id.startsWith('p_')) {
    const { error } = await _supabase
      .from('products')
      .update(record)
      .eq('id', p.id)
      .eq('user_id', session.user.id)
    if (error) throw error
    return p.id
  } else {
    const { data, error } = await _supabase
      .from('products')
      .insert(record)
      .select()
      .single()
    if (error) throw error
    return data.id
  }
}

async function deleteProduct(id) {
  const session = await getSession()
  if (!session) throw new Error('Not authenticated')
  const { error } = await _supabase
    .from('products')
    .delete()
    .eq('id', id)
    .eq('user_id', session.user.id)
  if (error) throw error
}

async function uploadProductPhoto(file, productId) {
  const session = await getSession()
  if (!session) throw new Error('Not authenticated')
  const ext = file.name.split('.').pop()
  const path = session.user.id + '/' + productId + '.' + ext
  const { error } = await _supabase.storage
    .from('product-photos')
    .upload(path, file, { upsert: true })
  if (error) throw error
  const { data: { publicUrl } } = _supabase.storage
    .from('product-photos')
    .getPublicUrl(path)
  return publicUrl
}

// === SCRIPTS ===
async function loadScripts() {
  const session = await getSession()
  if (!session) return []
  const { data, error } = await _supabase
    .from('scripts')
    .select('*')
    .eq('user_id', session.user.id)
    .order('created_at', { ascending: false })
  if (error) throw error
  return data.map(s => ({
    id: s.id,
    nome: s.nome,
    data: s.created_at,
    selections: s.selections || {},
    produtoId: s.produto_id || null,
    selectedProdCards: s.selected_prod_cards || {}
  }))
}

async function saveScript(s) {
  const session = await getSession()
  if (!session) throw new Error('Not authenticated')
  const record = {
    user_id: session.user.id,
    nome: s.nome,
    selections: s.selections || {},
    produto_id: s.produtoId || null,
    selected_prod_cards: s.selectedProdCards || {}
  }
  if (s.id && !s.id.startsWith('r_')) {
    const { error } = await _supabase
      .from('scripts')
      .update(record)
      .eq('id', s.id)
      .eq('user_id', session.user.id)
    if (error) throw error
    return s.id
  } else {
    const { data, error } = await _supabase
      .from('scripts')
      .insert(record)
      .select()
      .single()
    if (error) throw error
    return data.id
  }
}

async function deleteScript(id) {
  const session = await getSession()
  if (!session) throw new Error('Not authenticated')
  const { error } = await _supabase
    .from('scripts')
    .delete()
    .eq('id', id)
    .eq('user_id', session.user.id)
  if (error) throw error
}

// === AUTH UI ===
function injectAuthUI() {
  const div = document.createElement('div')
  div.id = 'authOverlay'
  div.innerHTML = `
    <style>
      #authOverlay {
        position:fixed;inset:0;z-index:9999;
        background:rgba(0,0,0,.6);
        display:flex;justify-content:center;align-items:center;
        font-family:'Inter',system-ui,sans-serif;
      }
      #authBox {
        background:#fff;border-radius:16px;padding:2rem;
        max-width:380px;width:100%;box-shadow:0 10px 40px rgba(0,0,0,.3);
        animation:fadeIn .25s ease;
      }
      @keyframes fadeIn { from { opacity:0;transform:scale(.95); } to { opacity:1;transform:scale(1); } }
      #authBox h2 { font-size:1.2rem;margin-bottom:.3rem;text-align:center; }
      #authBox h2 span { color:#e63946; }
      #authBox p.sub { color:#888;font-size:.82rem;text-align:center;margin-bottom:1.2rem; }
      #authBox input {
        width:100%;padding:.55rem .7rem;border:1px solid #ddd;border-radius:8px;
        font-size:.85rem;font-family:inherit;outline:none;margin-bottom:.6rem;box-sizing:border-box;
      }
      #authBox input:focus { border-color:#e63946; }
      #authBox .btn {
        width:100%;padding:.55rem;border:none;border-radius:8px;font-weight:700;
        font-size:.85rem;cursor:pointer;font-family:inherit;margin-bottom:.4rem;
      }
      #authBox .btn-primary { background:#e63946;color:#fff; }
      #authBox .btn-primary:hover { opacity:.85; }
      #authBox .btn-ghost { background:none;color:#e63946;font-weight:600;font-size:.8rem; }
      #authBox .btn-ghost:hover { text-decoration:underline; }
      #authBox .err { color:#e63946;font-size:.78rem;text-align:center;margin-bottom:.4rem;display:none; }
      #authBox .divider { height:1px;background:#eee;margin:.6rem 0; }
    </style>
    <div id="authBox">
      <h2><span>O</span> Cara Testou</h2>
      <p class="sub">Faça login para continuar</p>
      <div class="err" id="authErr"></div>
      <input type="email" id="authEmail" placeholder="Email" autocomplete="email">
      <input type="password" id="authPass" placeholder="Senha" autocomplete="current-password">
      <button class="btn btn-primary" id="authBtn" onclick="handleAuth()">Entrar</button>
      <button class="btn btn-ghost" id="toggleBtn" onclick="toggleAuthMode()">Criar conta</button>
    </div>
  `
  document.body.prepend(div)
}

let _authMode = 'login'

function toggleAuthMode() {
  _authMode = _authMode === 'login' ? 'signup' : 'login'
  document.getElementById('authBtn').textContent = _authMode === 'login' ? 'Entrar' : 'Criar conta'
  document.getElementById('toggleBtn').textContent = _authMode === 'login' ? 'Criar conta' : 'Já tenho conta'
  document.getElementById('authErr').style.display = 'none'
}

async function handleAuth() {
  const email = document.getElementById('authEmail').value.trim()
  const pass = document.getElementById('authPass').value
  const errEl = document.getElementById('authErr')
  errEl.style.display = 'none'
  if (!email || !pass) { errEl.textContent = 'Preencha email e senha'; errEl.style.display = 'block'; return }
  try {
    if (_authMode === 'login') {
      await signIn(email, pass)
    } else {
      await signUp(email, pass)
      errEl.textContent = 'Conta criada! Verifique seu email para confirmar.'
      errEl.style.color = '#2a9d8f'
      errEl.style.display = 'block'
      return
    }
  } catch (e) {
    errEl.textContent = e.message || 'Erro ao autenticar'
    errEl.style.color = '#e63946'
    errEl.style.display = 'block'
  }
}

// Listen for auth state changes - remove overlay when logged in
_supabase.auth.onAuthStateChange((event, session) => {
  if (session) {
    const overlay = document.getElementById('authOverlay')
    if (overlay) overlay.remove()
    if (window.onAuthReady) window.onAuthReady()
  }
})
