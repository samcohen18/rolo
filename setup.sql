-- Rolo: database setup. Paste all of this into Supabase > SQL Editor > New query, then press Run.

create table if not exists public.people (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.photos (
  person_id uuid primary key references public.people(id) on delete cascade,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  img text not null
);

alter table public.people enable row level security;
alter table public.photos enable row level security;

drop policy if exists "own people" on public.people;
create policy "own people" on public.people
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "own photos" on public.photos;
create policy "own photos" on public.photos
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create index if not exists people_user_idx on public.people(user_id);

-- Only signed-in users can reach these tables (and RLS limits them to their own rows).
grant select, insert, update, delete on public.people, public.photos to authenticated;
