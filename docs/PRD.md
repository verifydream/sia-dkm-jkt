# PRD — SI-DKM (Sistem Inventaris DKM)

## Tujuan
Menyediakan sistem inventaris aset yang mudah diakses publik (lihat & komplain) dan mudah dikelola admin (kelola aset, komplain, kalender perawatan, laporan, audit). Fokus pada mobile-friendly dan operasional sederhana tanpa multi-akun.

## Persona & Akses
- Publik/Guest: melihat daftar/detail aset, ajukan komplain, unduh laporan aset.
- Admin: akses via Mode Admin + password, kelola aset/master data/komplain/perawatan, dashboard, audit log, unduh laporan admin.

## Cakupan Fitur
- Daftar aset: grid/list, search, filter (kategori, lokasi, status, disposed/arsip), sort.
- Detail aset: info lengkap, umur aset, status terakhir + tanggal, timeline status/komplain/perawatan, relasi parent–child, gambar (0–3), saran AI.
- Komplain: form publik (nama + deskripsi), status lifecycle (diajukan → diproses → selesai), email notifikasi ke admin.
- Kalender Perawatan: admin full CRUD + visibilitas publik (toggle), event kategori/jenis/teknisi.
- Dashboard: widget custom (total aset per status, komplain per status/SLA, maintenance due/overdue, top aset dikeluhkan, aset uzur) + drill-down.
- Laporan: PDF/XLSX untuk aset (publik & admin) dan aktivitas admin; filterable.
- Audit Log: setiap aksi admin simpan nama admin + alasan perubahan + delta.
- QR: tiap aset punya QR untuk buka detail + komplain cepat.
- Disposal/Arsip: tandai aset disposed beserta alasan; tampil read-only di arsip dan tetap terbawa laporan.

## Batasan & Kebijakan
- Tidak ada akun/role; hanya satu password admin.
- Guard di UI & API untuk aksi admin (header rahasia).
- Data PII minimal (nama pelapor komplain opsional email).

## Non-Fungsional
- Responsif (mobile/web), cepat untuk list/filter (pagination, server-side filter), reliabel.
- Observabilitas: audit log + health endpoint.

## Sukses Metrik (contoh)
- Waktu input komplain < 30 detik (mobile).
- 0 error fatal saat ekspor laporan pada 10k baris.
- TTR komplain turun 20% setelah 1 bulan.

## Alur Utama (ringkas)
1) Tambah Aset → generate QR → cetak label.
2) Detail Aset → lihat timeline & saran AI.
3) Komplain Publik → email notifikasi → admin proses → jika perlu, Edit Aset Terkait.
4) Jadwal Perawatan → setelah selesai masuk histori perawatan (+ lampiran/biaya opsional).
5) Disposal → status disposed + alasan → pindah arsip.
6) Laporan & Audit → unduh aset/admin activity sesuai filter.
