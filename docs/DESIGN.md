# Desain & Arsitektur

## Arsitektur Tingkat Tinggi
- Frontend (React + Tailwind + Router): SPA untuk publik & admin, guard admin di client (UI) + kirim header rahasia untuk aksi admin.
- Backend (Express): API REST, validasi, guard admin (header `x-admin-secret`), integrasi Supabase, email, export PDF/XLSX, QR generator.
- Database (Supabase/Postgres): tabel aset, master data, status/riwayat, komplain, perawatan, relasi parent–child, audit log, settings.

Komunikasi: Frontend ⇄ Backend ⇄ Supabase.

## Komponen Backend
- Middleware: CORS, JSON, adminGuard (cek header vs `ADMIN_PASSWORD`), error handler.
- Modul: assets, complaints, maintenance, reports, logs, master-data, health.
- Util: email (nodemailer), pdf/xlsx (pdfkit/exceljs), qr (qrcode), date (dayjs), ai (opsional), supabase client.

## Komponen Frontend
- Halaman Publik: Home (list), Detail Aset, Komplain, Kalender (opsional), Download Laporan.
- Halaman Admin: Dashboard (widget + drill-down), Aset CRUD, Master Data, Komplain (lifecycle), Kalender CRUD, Laporan, Audit Log.
- UX Mobile: sticky actions (Scan QR, Ajukan Komplain), badge status, timeline terintegrasi.

## Keamanan
- Tidak ada akun; gunakan password tunggal. Backend memeriksa `x-admin-secret` dipasok client admin.
- Audit log wajib di setiap aksi admin (admin_name + reason + delta JSON).
- .env menyimpan rahasia; frontend hanya gunakan ANON key Supabase bila diperlukan.

## Dependensi yang Direkomendasikan
- Backend: express, cors, zod, supabase-js, nodemailer, qrcode, pdfkit atau pdf-lib, exceljs, dayjs, morgan
- Frontend: react, react-router-dom, tailwindcss, axios, dayjs, @fullcalendar/react & plugins

## Routing Utama (Frontend)
- `/` daftar aset (+ query: search, filter)
- `/asset/:id` detail aset + timeline + komplain
- `/complaint/new?assetId=` form komplain cepat
- `/calendar` (opsional publik) tampilan jadwal
- `/admin` dashboard (prompt password), simpan state admin mode di memory (bukan cookie)
- `/admin/assets`, `/admin/complaints`, `/admin/calendar`, `/admin/reports`, `/admin/logs`

## Diagram Data (ringkas)
- assets 1—n asset_status_history, 1—n complaints, 1—n maintenances, n—n assets (relasi parent–child via asset_relations)
- master: categories, locations, status_catalog
- admin_activity_log terkait berbagai entitas via entity_type + entity_id

## Saran AI
- Backend mengolah data umur/status/riwayat untuk rekomendasi (layak pakai / perlu perawatan / perlu diperbaiki / perlu diganti). Provider opsional (Gemini).
