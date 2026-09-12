-- Tabela de agendamento de postagens (content scheduler)
-- Uma linha por slot de horário por dia por usuário

create table if not exists public.post_schedule (
  id bigserial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  schedule_date date not null,          -- data do agendamento (ex: 2026-09-15)
  hour smallint not null,               -- hora 0-23
  slot_index smallint not null,         -- índice do slot dentro da hora (0, 1, 2... até max_slots-1)
  posted boolean not null default false, -- marcado como postado
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  -- Um slot único por (user, date, hour, slot_index)
  unique (user_id, schedule_date, hour, slot_index)
);

-- Índice para consultas por intervalo de datas
create index if not exists idx_post_schedule_user_date
  on public.post_schedule (user_id, schedule_date);

-- RLS: cada usuário só vê/edita seus agendamentos
alter table public.post_schedule enable row level security;

create policy "Users can view own schedule"
  on public.post_schedule for select
  using (auth.uid() = user_id);

create policy "Users can insert own schedule"
  on public.post_schedule for insert
  with check (auth.uid() = user_id);

create policy "Users can update own schedule"
  on public.post_schedule for update
  using (auth.uid() = user_id);

create policy "Users can delete own schedule"
  on public.post_schedule for delete
  using (auth.uid() = user_id);

-- Trigger para updated_at
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

drop trigger if exists trigger_post_schedule_updated_at on public.post_schedule;
create trigger trigger_post_schedule_updated_at
  before update on public.post_schedule
  for each row execute function public.set_updated_at();

-- Comentários
comment on table public.post_schedule is 'Agendamento de postagens: slots por hora por dia por usuário';
comment on column public.post_schedule.hour is 'Hora do dia (0-23)';
comment on column public.post_schedule.slot_index is 'Índice do slot dentro da hora (0 = primeiro, 1 = segundo, etc.)';
comment on column public.post_schedule.posted is 'Marcado como já postado (checkbox)';