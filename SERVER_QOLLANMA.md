# 🚀 Botingizni Serverga Joylash Bo'yicha Qisqa Qo'llanma

Ushbu papka serverga (hostingga) yuklash uchun to'liq yangilangan va tayyorlangan.

---

### 👑 Admin Panel:
- **Buyruq:** `/panel`
- **Bosh Admin (Owner) ID:** `5246830744`
- **Imkoniyatlar:**
  - 📊 Foydalanuvchilar statistikasi (Jami, bugungi)
  - 📢 Barcha foydalanuvchilarga xabarnoma (Broadcast) yuborish
  - 🔗 Majburiy obuna (Oddiy va Zayavka kanallar qo'shish/o'chirish)
  - ✍️ Yuklab berilgan fayllar ostiga matn (reklama / izoh) qo'yish
  - 👥 Yangi adminlar tayinlash va o'chirish

---

### 1-qadam. Papkani serverga tashlash
1. FileZilla dasturini oching.
2. Serveringiz **IP manzili**, **foydalanuvchi nomi** (`root`) va **parolini** kiriting (Port: `22`).
3. Serverda masalan `/root/media_bot` papkasi ochib, ushbu papka ichidagi barcha fayllarni u yerga ko'chiring.
*(Yoki `server_bot.zip` arxivini yuklab, `unzip server_bot.zip` qiling).*

---

### 2-qadam. Botni 1 ta buyruq bilan ishga tushirish (Avtomatik)
Server terminalida bot papkasi ichiga kiring va o'rnatish skriptini ishga tushiring:

```bash
cd /root/media_bot
bash install.sh
```

Bu skript avtomatik ravishda:
- Python va FFmpeg ni o'rnatadi
- Barcha kutubxonalarni o'rnatadi
- SQLite ma'lumotlar bazasini tayyorlaydi
- Botingizni 24/7 ishlaydigan `systemd` xizmatiga ulaydi va ishga tushiradi!

---

### 3-qadam. Boshqaruv buyruqlari

- **Bot ishlayotganini tekshirish:**
  ```bash
  sudo systemctl status mediabot
  ```
- **Bot loglarini jonli ko'rish:**
  ```bash
  journalctl -u mediabot -f
  ```
- **Botni qayta yoqish:**
  ```bash
  sudo systemctl restart mediabot
  ```
- **Botni to'xtatish:**
  ```bash
  sudo systemctl stop mediabot
  ```
