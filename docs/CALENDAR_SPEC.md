# Spesifikasi Kalender Perawatan

## Model Event
- `id`, `asset_id?`, `title`, `scheduled_at` (start), `done_at?` (end), `note`, `technician`, `visibility_public` (bool)
- Filter: lokasi/kategori/status/jenis perawatan/teknisi

## Perilaku
- Admin: CRUD event, tandai selesai (set `done_at`), upload lampiran di Storage → simpan URL
- Publik: read-only bila `visibility_public = true`

## UI/UX
- FullCalendar dengan views month/week/day
- Warna status: planned, due, overdue, done
