create table if not exists public.conexao_rh_data (
  key text primary key,
  value jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.conexao_rh_data enable row level security;

create policy "Leitura pública Conexão RH"
on public.conexao_rh_data
for select
to anon
using (true);

create policy "Gravação pública Conexão RH"
on public.conexao_rh_data
for insert
to anon
with check (true);

create policy "Atualização pública Conexão RH"
on public.conexao_rh_data
for update
to anon
using (true)
with check (true);

-- Para produção, substitua as políticas públicas por autenticação de administrador.
