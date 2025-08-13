# Skema Database Supabase (Postgres)

## Tabel Inti
- `assets`: data utama aset + status/arsip
- `asset_images`: URL gambar (0–3 per aset direkomendasikan)
- `asset_status_history`: riwayat perubahan status (timestamp + admin + alasan)
- `asset_relations`: relasi parent–child antar aset
- `categories`, `locations`, `status_catalog`: master data
- `complaints`, `complaint_history`: komplain publik + lifecycle admin
- `maintenances`: jadwal/perawatan dan realisasi (done_at)
- `admin_activity_log`: jejak audit semua aksi admin
- `settings`: konfigurasi sederhana (mis. `public_calendar_visible`, `notification_emails`)

## Catatan
- Gunakan `gen_random_uuid()` untuk primary key.
- Simpan file lampiran (jika ada) di Supabase Storage; tabel simpan URL.
- RLS dapat dimatikan atau disederhanakan karena tidak ada multi-user; API backend tetap sebagai gerbang keamanan.

## Contoh Query
- Aset uzur (>5 tahun): `where purchase_date <= now() - interval '5 years'`
- Timeline aset: gabungkan `asset_status_history`, `complaints`, `maintenances` berdasarkan `asset_id` dan urutkan `changed_at/created_at`.
