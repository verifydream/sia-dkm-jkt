# Spesifikasi API (Express)

Autentikasi Admin sederhana via header: `x-admin-secret: <ADMIN_PASSWORD>` pada endpoint admin. Publik tidak memerlukan header.

## Health
- GET `/api/health` → `{ status: "ok" }`

## Assets
- GET `/api/assets` (publik) — query: `q, categoryId, locationId, statusId, disposed, page, pageSize, sort`
- POST `/api/assets` (admin) — body: data aset lengkap (+ admin_name, reason)
- GET `/api/assets/:id` (publik)
- PUT `/api/assets/:id` (admin) — body: data aset (+ admin_name, reason)
- DELETE `/api/assets/:id` (admin) — body: { admin_name, reason }
- POST `/api/assets/:id/status` (admin) — body: { statusId, admin_name, reason }
- GET `/api/assets/:id/history` (publik) — status timeline
- GET `/api/assets/:id/relations` (publik) — tree parent/child
- GET `/api/assets/:id/qr` (publik) — gambar PNG/SVG QR

## Master Data (admin)
- GET/POST/PUT/DELETE `/api/categories`
- GET/POST/PUT/DELETE `/api/locations`
- GET/POST/PUT/DELETE `/api/statuses`

## Complaints
- POST `/api/complaints` (publik) — body: { assetId, name, description, email? }
- GET `/api/complaints` (admin) — query: status, assetId, date range
- GET `/api/complaints/:id` (admin)
- PUT `/api/complaints/:id` (admin) — update detail/status (+ admin_name, reason); respons menyertakan link/tombol "Edit Aset Terkait"

## Maintenance/Calendar
- GET `/api/calendar` (publik opsional) — query: filter lokasi/kategori/status/teknisi
- POST `/api/calendar` (admin)
- PUT `/api/calendar/:id` (admin)
- DELETE `/api/calendar/:id` (admin)
- GET `/api/assets/:id/maintenance` (publik)
- POST `/api/assets/:id/maintenance` (admin)

## Reports
- GET `/api/reports/assets` (publik & admin) — format: `pdf|xlsx`, filter query
- GET `/api/reports/admin-activity` (admin) — format: `pdf|xlsx`, filter query

## Audit Log (admin)
- GET `/api/admin/activity-log` — query: rentang waktu, jenis aksi, aset, admin

## Headers & Body Wajib (aksi admin)
- Header: `x-admin-secret`
- Body: `admin_name`, `reason` untuk perubahan/aksi yang memodifikasi data
