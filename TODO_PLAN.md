# TODO / Rencana Implementasi SI-DKM

- [x] Dokumen awal: PRD, Design, API Spec, DB Schema, README, .env.example
- [ ] Supabase: buat project + jalankan `docs/DB_SCHEMA_SUPABASE.sql`
- [ ] Backend (Express): scaffold proyek, koneksi Supabase, middleware admin guard, modul assets/complaints/maintenance/reports/logs
- [ ] Frontend (React): scaffold proyek (Vite), Tailwind, routing, halaman publik & admin
- [ ] QR: generator QR label (backend) + scan action (frontend mobile)
- [ ] Komplain: form publik, email notifikasi ke admin, modul proses komplain admin
- [ ] Kalender: integrasi FullCalendar, toggle visibilitas publik, CRUD jadwal
- [ ] Laporan: export PDF/XLSX (assets, aktivitas admin) + filter
- [ ] Saran AI: integrasi (opsional) dengan provider Gemini (via backend)
- [ ] Dashboard: widget modular + drill-down ke list/detail
- [ ] Pengarsipan/disposal aset + arsip read-only
- [ ] Audit log terintegrasi di semua aksi admin
- [ ] QA: e2e flow, responsive/mobile UX, performa list & filter
- [ ] Deploy: backend + frontend, konfigurasi env & domain

## Definisi Selesai (DoD)
- Fitur sesuai PRD, lulus QA fungsional dan mobile responsive
- Laporan ekspor sesuai spesifikasi dan menyertakan metadata cetakan
- Audit log lengkap, dapat difilter dan diekspor
- Dokumen README diperbarui, instruksi jalankan & deploy jelas
