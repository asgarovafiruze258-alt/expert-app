# EXPERT — Product Requirement Document (PRD)

**Versiya:** 1.0 (Draft)
**Tarix:** 2026-08-04
**Status:** Təsdiq gözləyir

---

## 1. Layihənin Məqsədi

EXPERT — Azərbaycan bazarı üçün ev təmiri və tikinti sahəsində tam ekosistem yaradan mobil tətbiqdir. Məqsəd sadəcə "usta tapma" tətbiqi deyil, istifadəçinin təmir prosesinin **əvvəlindən sonuna qədər** bütün mərhələlərini bir platformada idarə etməsini təmin etməkdir:

- Usta axtarışı və seçimi
- Tikinti materialları alışı və qiymət müqayisəsi
- Təmir büdcəsinin planlaşdırılması
- Layihənin (məsələn, "3 otaqlı mənzil təmiri") mərhələ-mərhələ izlənməsi
- Bütün tərəflər (istifadəçi, usta, mağaza) arasında kommunikasiya

**Uzunmüddətli hədəf:** Azərbaycanda ev təmiri/tikinti sənayesinin əsas rəqəmsal infrastrukturuna çevrilmək və 100.000+ aktiv istifadəçiyə çatmaq.

---

## 2. Problemin İzahı

Hazırkı vəziyyətdə Azərbaycan bazarında təmir/tikinti prosesi çox dağınıq və qeyri-şəffafdır:

| Problem | Təsvir |
|---|---|
| **Etibarlı usta tapmaq çətindir** | İstifadəçilər tanışlıq və ya təsadüfi elanlar (Instagram, tur.az, bina.az) vasitəsilə usta axtarır. Reytinq, keçmiş iş tarixçəsi və zəmanət yoxdur. |
| **Qiymət şəffaflığı yoxdur** | Material qiymətləri mağazadan mağazaya fərqlidir, müqayisə etmək mümkün deyil. Ustalar da fərqli qiymət təklif edir, "bazar qiyməti" bilinmir. |
| **Büdcə idarəetməsi mövcud deyil** | İstifadəçi təmirin ümumi dəyərini əvvəlcədən təxmin edə bilmir, xərclər nəzarətdən çıxır. |
| **Prosesin izlənməsi yoxdur** | Uzun sürən təmir layihələrində (məs. mənzil təmiri) hansı iş görülüb, hansı qalıb — bunun mərkəzi izlənməsi yoxdur. |
| **Kommunikasiya paralel kanallarda** | Usta ilə yazışma WhatsApp-da, sifariş zəngdə, ödəniş nağd — heç bir rəsmi qeydiyyat və təhlükəsizlik yoxdur. |

**Nəticə:** İstifadəçi çoxlu tətbiq/mənbə arasında gəzir, vaxt itirir, aldadılma riski yüksəkdir, ustalar və mağazalar isə etibarlı müştəri axını qura bilmir.

---

## 3. Hədəf İstifadəçilər

### 3.1 Əsas Persona-lar

**1. Ev sahibi / Kirayəçi (B2C — əsas istifadəçi qrupu)**
- 25–55 yaş, şəhər (əsasən Bakı, Sumqayıt, Gəncə) sakini
- Yeni mənzil almış və ya təmirə ehtiyacı olan
- Texnologiyaya orta-yüksək səviyyədə uyğunlaşan
- Ehtiyac: etibarlı usta, ağlabatan qiymət, şəffaf proses

**2. Usta / Usta briqadası (B2B — təchizatçı tərəf)**
- Santexnik, elektrik, rəngsaz, dülgər, kafelçi və s.
- Müştəri tapmaqda çətinlik çəkir, reklama pul xərcləyə bilmir
- Ehtiyac: daimi sifariş axını, öz profilini nümayiş etdirmək, ödəniş təminatı

**3. Tikinti materialları mağazası (B2B2C)**
- Kiçik/orta ölçülü tikinti mağazaları və topdansatış nöqtələri
- Ehtiyac: onlayn görünürlük, sifariş qəbulu, stok idarəetməsi

**4. Böyük təmir sifarişçisi / Podratçı (gələcək seqment)**
- Ofis, kommersiya sahəsi təmiri edən daha böyük layihə sahibləri

---

## 4. Əsas Funksiyalar (Tam Vizyon)

1. **Usta Tapma** — kateqoriya, rayon, reytinq, qiymətə görə axtarış və filtr
2. **Material Marketplace** — kateqoriyalar, mağazalar, qiymət müqayisəsi, səbət
3. **Layihə (Project) İdarəetməsi** — büdcə planlaması, iş/material/usta əlaqələndirmə, xərc izləmə
4. **Real-time Chat** — mətn, şəkil, səs mesajı, oxundu statusu
5. **Sifariş sistemi** — usta və material sifarişlərinin idarəsi
6. **Reytinq və rəy sistemi** — etibarı artıran ikitərəfli reytinq
7. **Bildirişlər** — push notification (sifariş, mesaj, qiymət dəyişikliyi)
8. **Admin Panel** — moderasiya, təsdiqləmə, statistika
9. **AI köməkçi (gələcək)** — otaq şəklindən material/qiymət təklifi

---

## 5. MVP-də Olacaq Funksiyalar

MVP-nin məqsədi: **minimal, işlək dövrə (loop)** yaratmaq — istifadəçi usta/material tapır, əlaqə saxlayır, sifariş verir.

| Modul | MVP Əhatəsi |
|---|---|
| **Auth** | Telefon + OTP ilə qeydiyyat/giriş, profil |
| **Usta modulu** | Profil, kateqoriya, rayon, qiymət, reytinq, şəkillər, "Sifariş et" |
| **Material modulu** | Kateqoriyalar, mağaza siyahısı, qiymət göstəricisi, favorit, səbət (sadə) |
| **Axtarış & Home** | Kateqoriyalar, populyar ustalar/materiallar, axtarış paneli |
| **Chat** | Real-time mətn mesajlaşma (şəkil/səs sonrakı iterasiyada) |
| **Sifariş** | Sadə sifariş yaratma və status izləmə (gözləyir/qəbul edildi/tamamlandı) |
| **Reytinq/Rəy** | Tamamlanmış sifarişdən sonra rəy yazma |
| **Bildirişlər** | Push notification — yeni mesaj, sifariş statusu |
| **Layihə modulu** | Sadələşdirilmiş versiya: layihə yarat, təxmini büdcə göstər (tam xərc izləmə V2-də) |
| **Dil** | Azərbaycan (əsas), İngilis, Rus |
| **Dark Mode** | Var |

**MVP-də olmayacaq:** Admin panelin tam funksionallığı (yalnız minimal təsdiqləmə), AI funksiyaları, səs mesajı, mürəkkəb büdcə analitikası, endirim/reklam sistemi (statik banner ilə əvəzlənə bilər).

---

## 6. Sonrakı Versiyalarda Əlavə Olunacaq Funksiyalar

### V1.1 – V1.5 (Böyümə fazası)
- Layihə modulunun tam versiyası: detallı xərc izləmə, mərhələ-mərhələ status
- Chat-da şəkil və səs mesajı, typing indicator, online status
- Endirim və reklam banner sistemi (mağaza/usta tərəfindən idarə olunan)
- Tam Admin Panel: usta/mağaza təsdiqi, istifadəçi idarəetməsi, statistika dashboard
- Ödəniş inteqrasiyası (kart, milli ödəniş sistemləri)
- Referans/dəvət proqramı

### V2.0+ (Miqyaslanma fazası)
- **AI funksiyaları:** otaq şəklinin analizi, material təklifi, təxmini qiymət hesablanması, uyğun usta tövsiyəsi
- Podratçı/böyük layihə seqmenti üçün ayrıca axın
- Anbar/stok inteqrasiyası mağazalar üçün (real-time stok)
- Abunəlik modeli ustalar üçün (premium görünürlük)
- Digər regionlara (Gürcüstan, Orta Asiya) genişlənmə potensialı

---

## 7. Gəlir Modeli

| Mənbə | Təsvir | Fazası |
|---|---|---|
| **Komissiya** | Usta sifarişlərindən və ya material satışından faiz (məs. 5-10%) | MVP-dən sonra |
| **Abunəlik (Usta/Mağaza)** | Premium profil, üst sıralarda görünmə, limitsiz sifariş qəbulu | V1.x |
| **Reklam** | Mağaza/usta banner reklamları, sponsorlu siyahılar | V1.x |
| **Featured Listing** | Ödənişli şəkildə axtarış nəticələrində önə çıxarılma | V1.x |
| **Lead Generation** | Ustalara yeni müştəri "lead"lərinin satışı (əlaqə məlumatı) | Alternativ model |
| **Tədarükçü tərəfdaşlığı** | Böyük tikinti mağaza şəbəkələri ilə birbaşa müqavilə/komissiya | V2.0 |

**Tövsiyə:** MVP fazasında gəlir modelini tətbiq etməmək, əvəzində istifadəçi bazası və etimad qurmaq; komissiya modelini kritik kütlə (10-15K aktiv istifadəçi) əldə edildikdən sonra tədricən aktivləşdirmək.

---

## 8. Risklər

| Risk | Təsir | Azaltma Strategiyası |
|---|---|---|
| **"Cold start" problemi** (iki tərəfli bazar) | Kifayət qədər usta/mağaza olmadan istifadəçi gəlməz, əksinə də doğrudur | Əvvəlcə bir şəhərdə (Bakı) məhdud sayda yoxlanılmış usta ilə başlamaq, manual onboarding |
| **Etibar və keyfiyyət** | Zəif usta/aldadıcı elan platformanın nüfuzuna zərər verər | Manual təsdiqləmə prosesi (admin), sənəd/şəxsiyyət yoxlaması, rəy sistemi |
| **Nağd ödəniş mədəniyyəti** | İstifadəçilər tətbiq xaricində razılaşıb ödəniş edə bilər (platform "bypass") | Dəyər əlavə etmək (zəmanət, rəy tarixçəsi) ki, tətbiq daxilində qalmaq faydalı olsun |
| **Texniki miqyaslanma** | 100K+ istifadəçidə real-time chat və bildiriş yükü | Supabase Realtime + Firebase FCM-in erkən performans testi, düzgün indeksləmə |
| **Rəqabət** | Bina.az, tur.az kimi mövcud elan platformaları eyni sahəyə keçə bilər | Fərqləndirici dəyər: ekosistem (layihə idarəetməsi + AI), sadəcə elan deyil |
| **Requlyativ/hüquqi** | Ustaların vergi/patent statusu, məsuliyyət məsələləri | Hüquqi məsləhət, istifadəçi razılaşması, məsuliyyət hüdudlarının aydın müəyyənləşdirilməsi |
| **Büdcə/resurs** | Solo/kiçik komanda ilə böyük vizyonun icrası | Ciddi MVP-fokuslu mərhələləşdirmə (bu sənəddə edildiyi kimi) |

---

## 9. Genişlənmə Planı

**Faza 0 — Təsdiq və Hazırlıq (indiki mərhələ)**
PRD, texniki arxitektura, database dizaynı

**Faza 1 — MVP Development**
Bölmə 5-də göstərilən funksiyaların Flutter + Supabase üzərində qurulması

**Faza 2 — Bakı Pilotu**
Məhdud sayda (50-100) əl ilə yoxlanılmış usta və 5-10 mağaza ilə qapalı/yarı-açıq test

**Faza 3 — Bakı-daxili Açıq Buraxılış**
Marketinq, App Store/Google Play yerləşdirmə, ilk 1,000-10,000 istifadəçi

**Faza 4 — Regional Genişlənmə**
Sumqayıt, Gəncə və digər böyük şəhərlər; gəlir modelinin aktivləşdirilməsi

**Faza 5 — Miqyaslanma (100K+ istifadəçi)**
AI funksiyaları, tam admin/analitika infrastrukturu, ödəniş sistemləri, mümkün beynəlxalq genişlənmə

---

## Növbəti Addım

Bu PRD təsdiqləndikdən sonra **Mərhələ 2 — Texniki Arxitektura** (qovluq strukturu, Clean Architecture qatları, entity-lər və diaqramlar) hazırlanacaq.

> Davam etmək üçün: bu sənədə düzəliş/əlavə lazımdırsa bildirin, yoxsa **"Davam et"** yazın.
