// Google Calendar integration for O Cara Testou
const GOOGLE_CLIENT_ID = '215400237519-vl5hr5p4csgjabd7hpo0q6n66ne1e1rs.apps.googleusercontent.com'
const SCOPES = 'https://www.googleapis.com/auth/calendar.events'

let _gTokenClient = null
let _gAccessToken = null

function initGoogleCalendar() {
  _gTokenClient = google.accounts.oauth2.initTokenClient({
    client_id: GOOGLE_CLIENT_ID,
    scope: SCOPES,
    callback: (resp) => { if (resp.access_token) _gAccessToken = resp.access_token }
  })
}

function getGoogleToken() {
  return new Promise((resolve, reject) => {
    if (_gAccessToken) { resolve(_gAccessToken); return }
    _gTokenClient.callback = (resp) => {
      if (resp.error) { reject(resp); return }
      _gAccessToken = resp.access_token
      resolve(_gAccessToken)
    }
    _gTokenClient.requestAccessToken()
  })
}

async function createGoogleEvent(summary, description, startISO, endISO) {
  const token = await getGoogleToken()
  const body = {
    summary,
    description,
    start: { dateTime: startISO, timeZone: 'America/Sao_Paulo' },
    end: { dateTime: endISO, timeZone: 'America/Sao_Paulo' }
  }
  const res = await fetch('https://www.googleapis.com/calendar/v3/calendars/primary/events', {
    method: 'POST',
    headers: { Authorization: 'Bearer ' + token, 'Content-Type': 'application/json' },
    body: JSON.stringify(body)
  })
  if (!res.ok) { const e=await res.json(); throw new Error(e.error?.message||'Erro ao criar evento') }
  return res.json()
}