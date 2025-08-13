# Backend (Express.js)

## Rencana Struktur
```
src/
  app.ts|js
  routes/
    assets.ts
    complaints.ts
    maintenance.ts
    master.ts
    reports.ts
    logs.ts
    health.ts
  middlewares/
    adminGuard.ts
    errorHandler.ts
  services/
    supabase.ts
    email.ts
    pdf.ts
    xlsx.ts
    qr.ts
  utils/
    date.ts
    ai.ts (opsional)
```

## Paket yang Direkomendasikan
- express, cors, morgan, zod
- @supabase/supabase-js
- nodemailer, qrcode
- pdfkit atau pdf-lib, exceljs
- dayjs

## Menjalankan (akan ditulis saat scaffolding)
- `npm install`
- `npm run dev` (nodemon/ts-node bila TypeScript)

## Konfigurasi
- Gunakan `.env` (lihat `.env.example`)
- Guard admin via header: `x-admin-secret` dibandingkan dengan `ADMIN_PASSWORD`
