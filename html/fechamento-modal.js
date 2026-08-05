(function () {
  const btn = document.createElement('div')
  btn.id = 'fechamento-fab'
  btn.innerHTML = '🔔 <b>Fechamento</b>'
  btn.style.cssText = `
    position: fixed; bottom: 20px; right: 20px; z-index: 9999;
    background: #e63946; color: #fff; font-family: 'Inter', system-ui, sans-serif;
    font-size: .8rem; font-weight: 700; padding: .7rem 1.1rem;
    border-radius: 50px; cursor: pointer; box-shadow: 0 4px 14px rgba(230,57,70,.45);
    transition: transform .15s, box-shadow .15s; user-select: none;
  `
  btn.addEventListener('mouseenter', () => { btn.style.transform = 'scale(1.05)'; btn.style.boxShadow = '0 6px 18px rgba(230,57,70,.55)' })
  btn.addEventListener('mouseleave', () => { btn.style.transform = 'scale(1)'; btn.style.boxShadow = '0 4px 14px rgba(230,57,70,.45)' })

  const modal = document.createElement('div')
  modal.id = 'fechamento-modal'
  modal.innerHTML = `
    <div style="position:fixed;inset:0;background:rgba(0,0,0,.6);z-index:10000;display:none;align-items:center;justify-content:center;padding:1.2rem" id="fm-overlay">
      <div style="background:#fff;border-radius:14px;max-width:620px;width:100%;max-height:86vh;display:flex;flex-direction:column;overflow:hidden;font-family:'Inter',system-ui,sans-serif">
        <div style="padding:1rem 1.4rem;border-bottom:1px solid #eee;display:flex;align-items:center;justify-content:space-between;gap:.8rem">
          <div style="font-size:.95rem;font-weight:800;color:#1a1a1a">🔔 <span style="color:#e63946">Fechamento</span> de Live</div>
          <div style="display:flex;gap:.5rem;align-items:center">
            <input id="fm-busca" type="text" placeholder="Buscar frase..." style="border:1px solid #ddd;border-radius:6px;padding:.35rem .6rem;font-size:.75rem;font-family:inherit;width:150px;outline:none">
            <button id="fm-close" style="background:#eee;border:none;border-radius:6px;cursor:pointer;font-size:.9rem;padding:.3rem .6rem;font-weight:700;color:#333">✕</button>
          </div>
        </div>
        <div id="fm-body" style="padding:1rem 1.4rem;overflow-y:auto;font-size:.85rem"></div>
        <div style="padding:.9rem 1.4rem;border-top:1px solid #eee;display:flex;justify-content:space-between;align-items:center;gap:.6rem;flex-wrap:wrap">
          <div id="fm-count" style="font-size:.72rem;color:#999;font-weight:600"></div>
          <div style="display:flex;gap:.5rem">
            <button id="fm-copiar-todas" style="background:#eee;border:none;border-radius:8px;cursor:pointer;font-size:.78rem;font-weight:700;padding:.5rem .9rem;color:#1a1a1a">📋 Copiar todas</button>
            <button id="fm-baixar" style="background:#1a1a1a;color:#fff;border:none;border-radius:8px;cursor:pointer;font-size:.78rem;font-weight:700;padding:.5rem .9rem">⬇ Baixar .txt</button>
          </div>
        </div>
      </div>
    </div>`
  document.body.appendChild(btn)
  document.body.appendChild(modal)

  const overlay = modal.querySelector('#fm-overlay')
  const body = modal.querySelector('#fm-body')
  const busca = modal.querySelector('#fm-busca')
  const count = modal.querySelector('#fm-count')

  btn.addEventListener('click', abrir)
  modal.querySelector('#fm-close').addEventListener('click', fechar)
  overlay.addEventListener('click', e => { if (e.target === overlay) fechar() })
  document.addEventListener('keydown', e => { if (e.key === 'Escape') fechar() })
  busca.addEventListener('input', render)

  modal.querySelector('#fm-copiar-todas').addEventListener('click', () => {
    const frases = BANCO_FECHAMENTOS
      .map(c => (c.destaque ? [c.frase] : c.frases))
      .flat().filter(f => f.toLowerCase().includes(busca.value.toLowerCase()))
    navigator.clipboard.writeText(frases.join('\n\n')).then(() => { modal.querySelector('#fm-copiar-todas').textContent = '✓ Copiado!'; setTimeout(() => { modal.querySelector('#fm-copiar-todas').textContent = '📋 Copiar todas' }, 1200) })
  })
  modal.querySelector('#fm-baixar').addEventListener('click', () => {
    const frases = BANCO_FECHAMENTOS
      .map(c => (c.destaque ? [c.frase] : c.frases))
      .flat().filter(f => f.toLowerCase().includes(busca.value.toLowerCase()))
    const a = document.createElement('a')
    a.href = URL.createObjectURL(new Blob(['FRASES DE FECHAMENTO\n\n' + frases.join('\n\n')], { type: 'text/plain' }))
    a.download = 'frases-fechamento.txt'
    a.click()
  })

  function abrir() {
    overlay.style.display = 'flex'
    busca.value = ''
    busca.focus()
    render()
  }
  function fechar() { overlay.style.display = 'none' }

  function render() {
    const q = busca.value.toLowerCase()
    let html = ''
    const destaque = BANCO_FECHAMENTOS.filter(c => c.destaque).filter(c => c.frase.toLowerCase().includes(q))
    if (destaque.length) {
      html += destaque.map(c => `
        <div style="background:linear-gradient(135deg,#1a1a1a,#2b2b2b);color:#fff;border-radius:10px;padding:.9rem 1.1rem;margin-bottom:1rem;cursor:pointer" onclick="copyFrase(this)" title="Clique para copiar">
          <div style="font-size:.65rem;font-weight:800;letter-spacing:.12em;color:#ff8a93;margin-bottom:.3rem">★ FRASE-PRINCÍPIO</div>
          <div style="font-size:.88rem;font-weight:700;line-height:1.5">${c.frase}</div>
        </div>`).join('')
    }
    BANCO_FECHAMENTOS.filter(c => !c.destaque).forEach(c => {
      const frases = c.frases.filter(f => f.toLowerCase().includes(q))
      if (!frases.length) return
      html += `<div style="font-size:.72rem;font-weight:800;text-transform:uppercase;letter-spacing:.08em;color:#999;margin:1rem 0 .4rem">${c.emoji} ${c.categoria}</div>`
      html += frases.map((f, i) => `
        <div style="display:flex;gap:.5rem;align-items:baseline;padding:.32rem 0;border-bottom:1px solid #f0f0f0;cursor:pointer" onclick="copyFrase(this)" title="Clique para copiar">
          <span style="color:#e63946;font-weight:800;font-size:.7rem;min-width:16px">${String(i+1).padStart(2,'0')}</span>
          <span style="color:#1a1a1a;line-height:1.45">${f}</span>
        </div>`).join('')
    })
    if (!html) html = '<div style="text-align:center;padding:2rem;color:#aaa;font-size:.85rem">Nenhuma frase encontrada.</div>'
    body.innerHTML = html
    count.textContent = body.querySelectorAll('div[onclick]').length + ' frases disponíveis'
  }

  window.copyFrase = function (el) {
    const frase = el.textContent.replace(/^\d+\s*/, '').trim()
    navigator.clipboard.writeText(frase).then(() => {
      const prev = el.style.outline
      el.style.outline = '2px solid #4caf50'
      setTimeout(() => { el.style.outline = prev }, 700)
    })
  }
})();
