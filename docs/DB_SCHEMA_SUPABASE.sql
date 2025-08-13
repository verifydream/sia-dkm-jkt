-- Supabase/Postgres Schema for SI-DKM
create extension if not exists pgcrypto;

-- Master Data
create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text unique not null,
  description text,
  created_at timestamptz default now()
);

create table if not exists locations (
  id uuid primary key default gen_random_uuid(),
  name text unique not null,
  description text,
  created_at timestamptz default now()
);

create table if not exists status_catalog (
  id uuid primary key default gen_random_uuid(),
  name text unique not null, -- e.g., aktif, perlu_perawatan, rusak, disposed
  created_at timestamptz default now()
);

-- Assets
create table if not exists assets (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,
  name text not null,
  owner text,
  description text,
  purchase_date date,
  category_id uuid references categories(id) on delete set null,
  location_id uuid references locations(id) on delete set null,
  status_id uuid references status_catalog(id) on delete set null,
  disposed boolean not null default false,
  disposal_reason text,
  disposed_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists asset_images (
  id uuid primary key default gen_random_uuid(),
  asset_id uuid not null references assets(id) on delete cascade,
  url text not null,
  created_at timestamptz default now()
);

create table if not exists asset_relations (
  parent_asset_id uuid not null references assets(id) on delete cascade,
  child_asset_id uuid not null references assets(id) on delete cascade,
  primary key (parent_asset_id, child_asset_id)
);

create table if not exists asset_status_history (
  id uuid primary key default gen_random_uuid(),
  asset_id uuid not null references assets(id) on delete cascade,
  status_id uuid references status_catalog(id) on delete set null,
  changed_at timestamptz not null default now(),
  admin_name text not null,
  reason text
);

-- Complaints
create table if not exists complaints (
  id uuid primary key default gen_random_uuid(),
  asset_id uuid not null references assets(id) on delete cascade,
  name text not null, -- pelapor
  email text, -- opsional
  description text not null,
  status text not null default 'submitted', -- submitted|processing|resolved
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists complaint_history (
  id uuid primary key default gen_random_uuid(),
  complaint_id uuid not null references complaints(id) on delete cascade,
  status text not null,
  note text,
  admin_name text not null,
  reason text,
  changed_at timestamptz default now()
);

-- Maintenance / Calendar
create table if not exists maintenances (
  id uuid primary key default gen_random_uuid(),
  asset_id uuid references assets(id) on delete set null,
  title text not null,
  scheduled_at timestamptz not null,
  done_at timestamptz,
  note text,
  cost numeric,
  attachment_url text,
  technician text,
  visibility_public boolean not null default false,
  created_at timestamptz default now()
);

-- Audit Log
create table if not exists admin_activity_log (
  id uuid primary key default gen_random_uuid(),
  entity_type text not null, -- asset|complaint|maintenance|category|location|status|report|other
  entity_id uuid,
  action text not null, -- create|update|delete|export|status_change
  admin_name text not null,
  reason text,
  delta jsonb,
  created_at timestamptz default now()
);

-- Settings (e.g., public calendar visibility, notification emails)
create table if not exists settings (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz default now()
);

-- Helpful indexes
create index if not exists idx_assets_category on assets(category_id);
create index if not exists idx_assets_location on assets(location_id);
create index if not exists idx_assets_status on assets(status_id);
create index if not exists idx_complaints_status on complaints(status);
create index if not exists idx_maint_scheduled_at on maintenances(scheduled_at);

-- Updated_at trigger for assets
create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists trg_assets_updated on assets;
create trigger trg_assets_updated before update on assets
for each row execute function set_updated_at();
