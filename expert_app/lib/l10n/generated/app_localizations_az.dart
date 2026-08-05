// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appName => 'ExperTikinti';

  @override
  String get welcomeTitle => 'Xoş gəlmisiniz';

  @override
  String get welcomeSubtitle =>
      'Ev təmiri üçün tam ekosistem — usta tapın, material seçin, layihənizi idarə edin.';

  @override
  String get themeLight => 'İşıqlı';

  @override
  String get themeDark => 'Qaranlıq';

  @override
  String get themeToggleLabel => 'Mövzu';

  @override
  String get languageLabel => 'Dil';

  @override
  String get languageAz => 'Azərbaycan';

  @override
  String get languageEn => 'İngilis';

  @override
  String get languageRu => 'Rus';

  @override
  String get navHome => 'Ana səhifə';

  @override
  String get navWorkers => 'Ustalar';

  @override
  String get navMaterials => 'Material';

  @override
  String get navProjects => 'Layihələr';

  @override
  String get navProfile => 'Profil';

  @override
  String get comingSoon => 'Bu bölmə tezliklə hazır olacaq';

  @override
  String get authEmailLabel => 'E-poçt';

  @override
  String get authPasswordLabel => 'Şifrə';

  @override
  String get authFullNameLabel => 'Ad, Soyad';

  @override
  String get authPhoneLabel => 'Telefon nömrəsi';

  @override
  String get authOtpLabel => 'SMS kodu';

  @override
  String get authLoginTitle => 'Hesaba daxil ol';

  @override
  String get authLoginButton => 'Daxil ol';

  @override
  String get authNoAccount => 'Hesabınız yoxdur?';

  @override
  String get authRegisterLink => 'Qeydiyyatdan keç';

  @override
  String get authForgotPasswordLink => 'Şifrəni unutmusunuz?';

  @override
  String get authUsePhoneInstead => 'Telefon nömrəsi ilə daxil ol';

  @override
  String get authRegisterTitle => 'Yeni hesab yarat';

  @override
  String get authRegisterButton => 'Qeydiyyatdan keç';

  @override
  String get authHaveAccount => 'Artıq hesabınız var?';

  @override
  String get authLoginLink => 'Daxil ol';

  @override
  String get authForgotPasswordTitle => 'Şifrəni bərpa et';

  @override
  String get authForgotPasswordSubtitle =>
      'E-poçt ünvanınızı daxil edin, sizə şifrə bərpası üçün link göndərəcəyik.';

  @override
  String get authSendResetLink => 'Bərpa linki göndər';

  @override
  String get authResetEmailSent => 'Bərpa linki e-poçtunuza göndərildi';

  @override
  String get authBackToLogin => 'Girişə qayıt';

  @override
  String get authPhoneLoginTitle => 'Telefon ilə daxil ol';

  @override
  String get authPhoneLoginSubtitle =>
      'Nömrənizi daxil edin, sizə SMS ilə təsdiq kodu göndəriləcək.';

  @override
  String get authSendOtpButton => 'Kod göndər';

  @override
  String get authOrEmailLogin => 'E-poçt ilə daxil ol';

  @override
  String get authOtpTitle => 'Kodu təsdiqlə';

  @override
  String authOtpSubtitle(String phone) {
    return '$phone nömrəsinə göndərilən kodu daxil edin';
  }

  @override
  String get authVerifyButton => 'Təsdiqlə';

  @override
  String get authResendOtp => 'Kodu yenidən göndər';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileLogout => 'Çıxış et';

  @override
  String get profileEditComingSoon =>
      'Profil redaktəsi tezliklə əlavə olunacaq';

  @override
  String get searchHint => 'Usta və ya material axtar...';

  @override
  String get sectionCategories => 'Kateqoriyalar';

  @override
  String get sectionPopularWorkers => 'Populyar ustalar';

  @override
  String get sectionPopularMaterials => 'Populyar materiallar';

  @override
  String get sectionDiscounts => 'Endirimlər';

  @override
  String get sectionRecentlyViewed => 'Son baxılanlar';

  @override
  String get promoBannerTitle => 'Təmirə başlamağa hazırsınız?';

  @override
  String get promoBannerSubtitle =>
      'Layihənizi yaradın, xərci əvvəlcədən hesablayın';

  @override
  String get emptyCategories => 'Kateqoriya tapılmadı';

  @override
  String get emptyWorkers => 'Hələ təsdiqlənmiş usta yoxdur';

  @override
  String get emptyMaterials => 'Hələ material yoxdur';

  @override
  String get emptyDiscounts => 'Hazırda endirim yoxdur';

  @override
  String get emptyRecentlyViewed => 'Hələ heç nəyə baxmamısınız';

  @override
  String get detailComingSoon => 'Ətraflı səhifə tezliklə əlavə olunacaq';

  @override
  String get searchTitle => 'Axtarış';

  @override
  String get searchPrompt => 'Nə axtardığınızı yazın';

  @override
  String get searchNoResults => 'Nəticə tapılmadı';

  @override
  String get workerAvailable => 'Əlçatandır';

  @override
  String get workerUnavailable => 'Məşğuldur';

  @override
  String workerExperienceYears(int years) {
    return '$years il təcrübə';
  }

  @override
  String get workerPortfolioTitle => 'İş şəkilləri';

  @override
  String get workerOrderButton => 'Sifariş et';

  @override
  String get workerReviewsTitle => 'Şərhlər';

  @override
  String get workerNoReviews => 'Hələ şərh yoxdur';

  @override
  String get orderSheetTitle => 'Sifarişi təsdiqləyin';

  @override
  String get orderAddressLabel => 'Ünvan';

  @override
  String get orderPickDate => 'Tarix seçin';

  @override
  String get orderNotesLabel => 'Qeyd (istəyə görə)';

  @override
  String get orderSubmitButton => 'Sifarişi göndər';

  @override
  String get orderCreatedSuccess => 'Sifarişiniz göndərildi';

  @override
  String get sortLabel => 'Sırala';

  @override
  String get sortDefault => 'Standart';

  @override
  String get sortPriceAsc => 'Qiymət: aşağıdan yuxarı';

  @override
  String get sortPriceDesc => 'Qiymət: yuxarıdan aşağı';

  @override
  String materialInStock(int qty) {
    return '$qty ədəd stokda';
  }

  @override
  String get materialOutOfStock => 'Stokda yoxdur';

  @override
  String get materialAddToCart => 'Səbətə əlavə et';

  @override
  String get materialAddedToCart => 'Məhsul səbətə əlavə edildi';

  @override
  String get materialOtherShops => 'Digər mağazalarda';

  @override
  String get materialQuantityLabel => 'Miqdar';

  @override
  String get shopProductsTitle => 'Məhsullar';

  @override
  String get cartTitle => 'Səbət';

  @override
  String get cartEmpty => 'Səbətiniz boşdur';

  @override
  String get cartTotalLabel => 'Cəmi';

  @override
  String get cartCheckoutButton => 'Sifarişi göndər';

  @override
  String get favoritesTitle => 'Seçilmişlər';

  @override
  String get favoritesEmpty => 'Hələ seçilmiş heç nə yoxdur';

  @override
  String get profileFavoritesLink => 'Seçilmişlərim';

  @override
  String get profileBecomeWorkerLink => 'Usta kimi qeydiyyatdan keç';

  @override
  String get profileWorkerStatusPending => 'Usta profiliniz təsdiq gözləyir';

  @override
  String get profileWorkerStatusApproved => 'Siz təsdiqlənmiş ustasınız';

  @override
  String get profileOpenShopLink => 'Mağaza aç';

  @override
  String get profileShopStatusPending => 'Mağazanız təsdiq gözləyir';

  @override
  String get profileShopStatusApproved => 'Mağazanız təsdiqlənib';

  @override
  String get becomeWorkerTitle => 'Usta profili';

  @override
  String get becomeWorkerBioLabel => 'Özünüz haqqında';

  @override
  String get becomeWorkerExperienceLabel => 'Təcrübə (il)';

  @override
  String get becomeWorkerPriceFromLabel => 'Qiymət, min (₼)';

  @override
  String get becomeWorkerPriceToLabel => 'Qiymət, maks (₼)';

  @override
  String get becomeWorkerServiceAreasLabel =>
      'Xidmət bölgələri (vergüllə ayırın)';

  @override
  String get becomeWorkerPhoneLabel => 'Əlaqə nömrəsi';

  @override
  String get becomeWorkerCategoriesLabel => 'İxtisas sahələri';

  @override
  String get becomeWorkerSubmitButton => 'Göndər';

  @override
  String get becomeWorkerSuccess =>
      'Profiliniz göndərildi, admin təsdiqini gözləyir';

  @override
  String get becomeWorkerValidationError =>
      'Bio doldurun və ən azı bir ixtisas sahəsi seçin';

  @override
  String get openShopTitle => 'Mağaza aç';

  @override
  String get openShopNameLabel => 'Mağazanın adı';

  @override
  String get openShopAddressLabel => 'Ünvan';

  @override
  String get openShopRayonLabel => 'Rayon';

  @override
  String get openShopCategoriesLabel => 'Satılan material kateqoriyaları';

  @override
  String get openShopSubmitButton => 'Göndər';

  @override
  String get openShopSuccess =>
      'Mağazanız göndərildi, admin təsdiqini gözləyir';

  @override
  String get openShopValidationError => 'Mağaza adını daxil edin';

  @override
  String get projectCreateTitle => 'Yeni layihə';

  @override
  String get projectTitleLabel => 'Layihə adı';

  @override
  String get projectRoomCountLabel => 'Otaq sayı';

  @override
  String get projectBudgetLabel => 'Planlaşdırılan büdcə';

  @override
  String get projectCreateButton => 'Yarat';

  @override
  String get projectCreatedSuccess => 'Layihə yaradıldı';

  @override
  String get projectStatusPlanning => 'Planlaşdırma';

  @override
  String get projectStatusInProgress => 'İcra olunur';

  @override
  String get projectStatusCompleted => 'Tamamlanıb';

  @override
  String get projectEstimatedCostLabel => 'Təxmini xərc';

  @override
  String get projectBudgetPlannedLabel => 'Büdcə';

  @override
  String projectRoomCountShort(int count) {
    return '$count otaq';
  }

  @override
  String get projectAddItemTitle => 'Maddə əlavə et';

  @override
  String get projectItemTypeWork => 'İş';

  @override
  String get projectItemTypeMaterial => 'Material';

  @override
  String get projectItemTypeWorker => 'Usta';

  @override
  String get projectItemLabelField => 'Ad';

  @override
  String get projectItemEstimatedCostField => 'Təxmini xərc';

  @override
  String get projectItemActualCostField => 'Faktiki xərc (istəyə görə)';

  @override
  String get projectAddItemButton => 'Əlavə et';

  @override
  String get projectDeleteConfirmTitle => 'Layihəni silmək istəyirsiniz?';

  @override
  String get projectDeleteConfirmMessage =>
      'Bu əməliyyat geri qaytarıla bilməz.';

  @override
  String get projectDeleteConfirmButton => 'Sil';

  @override
  String get projectCancelButton => 'İmtina';

  @override
  String get projectEmpty => 'Hələ layihəniz yoxdur';

  @override
  String get projectItemsEmpty => 'Hələ maddə əlavə edilməyib';

  @override
  String get projectSetActualCostTitle => 'Faktiki xərci daxil edin';

  @override
  String get projectSaveButton => 'Yadda saxla';

  @override
  String get chatsTitle => 'Söhbətlər';

  @override
  String get chatsEmpty => 'Hələ söhbətiniz yoxdur';

  @override
  String get chatStartMessage => 'Söhbətə başlayın';

  @override
  String get chatMessageHint => 'Mesaj yazın...';

  @override
  String get workerMessageButton => 'Mesaj yaz';

  @override
  String get notificationsTitle => 'Bildirişlər';

  @override
  String get notificationsEmpty => 'Bildirişiniz yoxdur';

  @override
  String get notificationsMarkAllRead => 'Hamısını oxundu et';

  @override
  String get adminPanelTitle => 'Admin Panel';

  @override
  String get adminAccessDenied => 'Bu bölməyə giriş icazəniz yoxdur';

  @override
  String get profileAdminPanelLink => 'Admin Panel';

  @override
  String get adminStatUsers => 'İstifadəçilər';

  @override
  String get adminStatWorkers => 'Ustalar';

  @override
  String get adminStatPendingWorkers => 'Təsdiq gözləyən ustalar';

  @override
  String get adminStatShops => 'Mağazalar';

  @override
  String get adminStatPendingShops => 'Təsdiq gözləyən mağazalar';

  @override
  String get adminStatMaterials => 'Materiallar';

  @override
  String get adminStatOrders => 'Sifarişlər';

  @override
  String get adminMenuCategories => 'Kateqoriyalar';

  @override
  String get adminMenuPendingWorkers => 'Usta təsdiqi';

  @override
  String get adminMenuPendingShops => 'Mağaza təsdiqi';

  @override
  String get adminMenuUsers => 'İstifadəçilər';

  @override
  String get adminAddCategory => 'Kateqoriya əlavə et';

  @override
  String get adminEditCategory => 'Kateqoriyanı redaktə et';

  @override
  String get adminCategoryNameLabel => 'Ad (Az)';

  @override
  String get adminCategoryNameEnLabel => 'Ad (En)';

  @override
  String get adminCategoryNameRuLabel => 'Ad (Ru)';

  @override
  String get adminCategoryTypeLabel => 'Növ';

  @override
  String get adminCategoryTypeWorker => 'Usta';

  @override
  String get adminCategoryTypeMaterial => 'Material';

  @override
  String get adminDeleteCategoryConfirmTitle =>
      'Kateqoriyanı silmək istəyirsiniz?';

  @override
  String get adminApproveButton => 'Təsdiqlə';

  @override
  String get adminRejectButton => 'Rədd et';

  @override
  String get adminNoPendingWorkers => 'Təsdiq gözləyən usta yoxdur';

  @override
  String get adminNoPendingShops => 'Təsdiq gözləyən mağaza yoxdur';

  @override
  String get adminRoleLabel => 'Rol';

  @override
  String get adminRoleCustomer => 'Müştəri';

  @override
  String get adminRoleWorker => 'Usta';

  @override
  String get adminRoleShopOwner => 'Mağaza sahibi';

  @override
  String get adminRoleAdmin => 'Admin';

  @override
  String get aiAssistantTitle => 'AI Köməkçi';

  @override
  String get aiAssistantBannerTitle => 'AI Köməkçidən soruşun';

  @override
  String get aiAssistantBannerSubtitle =>
      'Təmir sualınıza cavab alın, uyğun usta tapın';

  @override
  String get aiChatHint => 'Sualınızı yazın...';

  @override
  String get aiChatWelcome => 'Salam! Ev təmiri ilə bağlı sualınızı yazın.';

  @override
  String get aiBudgetEstimateButton => 'AI ilə təxmin et';

  @override
  String get aiBudgetEstimateTitle => 'AI ilə büdcə təxmini';

  @override
  String get aiBudgetDescriptionHint =>
      'Təmiri təsvir edin (məs. \"mətbəx təmiri, kafel və boya\")';

  @override
  String get aiBudgetEstimateSubmit => 'Təxmin et';

  @override
  String get aiBudgetResultTitle => 'AI təklifi';

  @override
  String get aiBudgetAddAllButton => 'Hamısını layihəyə əlavə et';

  @override
  String get aiBudgetAddedSuccess => 'Maddələr layihəyə əlavə edildi';
}
