# SI-DKM (Sistem Inventaris DKM)

Aplikasi web untuk mengelola inventaris aset (komputer, AC, printer, server, router, dll.) dengan akses publik (lihat & komplain) dan admin (kelola penuh). Tanpa multi-akun; hanya Mode Admin via password sederhana.

## Fitur Utama
- Daftar aset (grid/list), pencarian & filter
- Detail aset: info, umur aset, status terakhir, timeline status/komplain/perawatan, relasi parent–child, saran AI
- Komplain publik (nama + deskripsi) + notifikasi email ke admin
- QR code per aset (scan membuka halaman detail)
- Kalender perawatan (admin full; publik opsional read-only)
- Admin: dashboard interaktif (widget custom + drill-down), kelola aset/master data/komplain
- Laporan PDF/XLSX (aset, aktivitas admin) + filter
- Audit log semua aksi admin (nama admin + alasan perubahan wajib)

## Teknologi
- Frontend: React + Tailwind + React Router
- Backend: Express.js (Node.js)
- Database: Supabase (PostgreSQL)
- Lainnya: Nodemailer (email), exceljs (XLSX), pdfkit/pdf-lib (PDF), qrcode (QR), Day.js, FullCalendar (kalender)

## Struktur Direktori (awal)
```
/ (root)
├─ README.md
├─ TODO_PLAN.md
├─ .env.example
├─ .gitignore
├─ docs/
│  ├─ PRD.md
│  ├─ DESIGN.md
│  ├─ API_SPEC.md
│  ├─ DB_SCHEMA_SUPABASE.sql
│  ├─ DB_SCHEMA_SUPABASE.md
│  ├─ LOGGING_AUDIT_SPEC.md
│  ├─ CALENDAR_SPEC.md
│  └─ templates/
│     ├─ email/complaint_new.md
│     └─ report/asset_report.md
├─ backend/
│  └─ README.md
└─ frontend/
   └─ README.md
```

## Setup Singkat (akan dilengkapi setelah scaffolding kode)
1) Buat project Supabase, isi variabel di `.env` sesuai `.env.example`.
2) Jalankan SQL di `docs/DB_SCHEMA_SUPABASE.sql` pada Supabase SQL editor.
3) Scaffold backend Express dan frontend React (panduan ada di `backend/README.md` dan `frontend/README.md`).
4) Jalankan aplikasi, uji alur: tambah aset → detail → komplain → proses admin → laporan → audit log.

## Keamanan & Akses
- Tanpa akun multi-user. Mode Admin via password: simpan di `ADMIN_PASSWORD` (default contoh: `admin123`).
- Setiap aksi admin wajib menyertakan `Nama Admin` dan `Alasan Perubahan`; tercatat di audit log.

## Lisensi
TBD.
