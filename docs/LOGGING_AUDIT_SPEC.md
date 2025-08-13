# Spesifikasi Audit Log

Setiap aksi admin harus menyertakan:
- `admin_name` (string)
- `reason` (string)

## Entri Log
- `entity_type`: asset|complaint|maintenance|category|location|status|report|other
- `entity_id`: UUID entitas (opsional untuk `report`)
- `action`: create|update|delete|export|status_change
- `delta`: JSON (perbedaan sebelum/sesudah bila ada)
- `created_at`: timestamp

## Filter & Ekspor
- Filter: rentang waktu, jenis aksi, aset, admin
- Ekspor: PDF/XLSX menyertakan metadata (waktu ekspor, pembuat, filter aktif)
