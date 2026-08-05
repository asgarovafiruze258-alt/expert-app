import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('en'),
    Locale('ru'),
  ];

  /// Tətbiqin adı
  ///
  /// In az, this message translates to:
  /// **'ExperTikinti'**
  String get appName;

  /// No description provided for @welcomeTitle.
  ///
  /// In az, this message translates to:
  /// **'Xoş gəlmisiniz'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Ev təmiri üçün tam ekosistem — usta tapın, material seçin, layihənizi idarə edin.'**
  String get welcomeSubtitle;

  /// No description provided for @themeLight.
  ///
  /// In az, this message translates to:
  /// **'İşıqlı'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In az, this message translates to:
  /// **'Qaranlıq'**
  String get themeDark;

  /// No description provided for @themeToggleLabel.
  ///
  /// In az, this message translates to:
  /// **'Mövzu'**
  String get themeToggleLabel;

  /// No description provided for @languageLabel.
  ///
  /// In az, this message translates to:
  /// **'Dil'**
  String get languageLabel;

  /// No description provided for @languageAz.
  ///
  /// In az, this message translates to:
  /// **'Azərbaycan'**
  String get languageAz;

  /// No description provided for @languageEn.
  ///
  /// In az, this message translates to:
  /// **'İngilis'**
  String get languageEn;

  /// No description provided for @languageRu.
  ///
  /// In az, this message translates to:
  /// **'Rus'**
  String get languageRu;

  /// No description provided for @navHome.
  ///
  /// In az, this message translates to:
  /// **'Ana səhifə'**
  String get navHome;

  /// No description provided for @navWorkers.
  ///
  /// In az, this message translates to:
  /// **'Ustalar'**
  String get navWorkers;

  /// No description provided for @navMaterials.
  ///
  /// In az, this message translates to:
  /// **'Material'**
  String get navMaterials;

  /// No description provided for @navProjects.
  ///
  /// In az, this message translates to:
  /// **'Layihələr'**
  String get navProjects;

  /// No description provided for @navProfile.
  ///
  /// In az, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// No description provided for @comingSoon.
  ///
  /// In az, this message translates to:
  /// **'Bu bölmə tezliklə hazır olacaq'**
  String get comingSoon;

  /// No description provided for @authEmailLabel.
  ///
  /// In az, this message translates to:
  /// **'E-poçt'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In az, this message translates to:
  /// **'Şifrə'**
  String get authPasswordLabel;

  /// No description provided for @authFullNameLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad, Soyad'**
  String get authFullNameLabel;

  /// No description provided for @authPhoneLabel.
  ///
  /// In az, this message translates to:
  /// **'Telefon nömrəsi'**
  String get authPhoneLabel;

  /// No description provided for @authOtpLabel.
  ///
  /// In az, this message translates to:
  /// **'SMS kodu'**
  String get authOtpLabel;

  /// No description provided for @authLoginTitle.
  ///
  /// In az, this message translates to:
  /// **'Hesaba daxil ol'**
  String get authLoginTitle;

  /// No description provided for @authLoginButton.
  ///
  /// In az, this message translates to:
  /// **'Daxil ol'**
  String get authLoginButton;

  /// No description provided for @authNoAccount.
  ///
  /// In az, this message translates to:
  /// **'Hesabınız yoxdur?'**
  String get authNoAccount;

  /// No description provided for @authRegisterLink.
  ///
  /// In az, this message translates to:
  /// **'Qeydiyyatdan keç'**
  String get authRegisterLink;

  /// No description provided for @authForgotPasswordLink.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni unutmusunuz?'**
  String get authForgotPasswordLink;

  /// No description provided for @authUsePhoneInstead.
  ///
  /// In az, this message translates to:
  /// **'Telefon nömrəsi ilə daxil ol'**
  String get authUsePhoneInstead;

  /// No description provided for @authRegisterTitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni hesab yarat'**
  String get authRegisterTitle;

  /// No description provided for @authRegisterButton.
  ///
  /// In az, this message translates to:
  /// **'Qeydiyyatdan keç'**
  String get authRegisterButton;

  /// No description provided for @authHaveAccount.
  ///
  /// In az, this message translates to:
  /// **'Artıq hesabınız var?'**
  String get authHaveAccount;

  /// No description provided for @authLoginLink.
  ///
  /// In az, this message translates to:
  /// **'Daxil ol'**
  String get authLoginLink;

  /// No description provided for @authForgotPasswordTitle.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni bərpa et'**
  String get authForgotPasswordTitle;

  /// No description provided for @authForgotPasswordSubtitle.
  ///
  /// In az, this message translates to:
  /// **'E-poçt ünvanınızı daxil edin, sizə şifrə bərpası üçün link göndərəcəyik.'**
  String get authForgotPasswordSubtitle;

  /// No description provided for @authSendResetLink.
  ///
  /// In az, this message translates to:
  /// **'Bərpa linki göndər'**
  String get authSendResetLink;

  /// No description provided for @authResetEmailSent.
  ///
  /// In az, this message translates to:
  /// **'Bərpa linki e-poçtunuza göndərildi'**
  String get authResetEmailSent;

  /// No description provided for @authBackToLogin.
  ///
  /// In az, this message translates to:
  /// **'Girişə qayıt'**
  String get authBackToLogin;

  /// No description provided for @authPhoneLoginTitle.
  ///
  /// In az, this message translates to:
  /// **'Telefon ilə daxil ol'**
  String get authPhoneLoginTitle;

  /// No description provided for @authPhoneLoginSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Nömrənizi daxil edin, sizə SMS ilə təsdiq kodu göndəriləcək.'**
  String get authPhoneLoginSubtitle;

  /// No description provided for @authSendOtpButton.
  ///
  /// In az, this message translates to:
  /// **'Kod göndər'**
  String get authSendOtpButton;

  /// No description provided for @authOrEmailLogin.
  ///
  /// In az, this message translates to:
  /// **'E-poçt ilə daxil ol'**
  String get authOrEmailLogin;

  /// No description provided for @authOtpTitle.
  ///
  /// In az, this message translates to:
  /// **'Kodu təsdiqlə'**
  String get authOtpTitle;

  /// No description provided for @authOtpSubtitle.
  ///
  /// In az, this message translates to:
  /// **'{phone} nömrəsinə göndərilən kodu daxil edin'**
  String authOtpSubtitle(String phone);

  /// No description provided for @authVerifyButton.
  ///
  /// In az, this message translates to:
  /// **'Təsdiqlə'**
  String get authVerifyButton;

  /// No description provided for @authResendOtp.
  ///
  /// In az, this message translates to:
  /// **'Kodu yenidən göndər'**
  String get authResendOtp;

  /// No description provided for @profileTitle.
  ///
  /// In az, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// No description provided for @profileLogout.
  ///
  /// In az, this message translates to:
  /// **'Çıxış et'**
  String get profileLogout;

  /// No description provided for @profileEditButton.
  ///
  /// In az, this message translates to:
  /// **'Redaktə et'**
  String get profileEditButton;

  /// No description provided for @editProfileTitle.
  ///
  /// In az, this message translates to:
  /// **'Profili redaktə et'**
  String get editProfileTitle;

  /// No description provided for @editProfileNameLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad, Soyad'**
  String get editProfileNameLabel;

  /// No description provided for @editProfileSaveButton.
  ///
  /// In az, this message translates to:
  /// **'Yadda saxla'**
  String get editProfileSaveButton;

  /// No description provided for @editProfileSuccess.
  ///
  /// In az, this message translates to:
  /// **'Profil yeniləndi'**
  String get editProfileSuccess;

  /// No description provided for @editProfileValidationError.
  ///
  /// In az, this message translates to:
  /// **'Ad, Soyad boş ola bilməz'**
  String get editProfileValidationError;

  /// No description provided for @searchHint.
  ///
  /// In az, this message translates to:
  /// **'Usta və ya material axtar...'**
  String get searchHint;

  /// No description provided for @sectionCategories.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriyalar'**
  String get sectionCategories;

  /// No description provided for @sectionPopularWorkers.
  ///
  /// In az, this message translates to:
  /// **'Populyar ustalar'**
  String get sectionPopularWorkers;

  /// No description provided for @sectionPopularMaterials.
  ///
  /// In az, this message translates to:
  /// **'Populyar materiallar'**
  String get sectionPopularMaterials;

  /// No description provided for @sectionDiscounts.
  ///
  /// In az, this message translates to:
  /// **'Endirimlər'**
  String get sectionDiscounts;

  /// No description provided for @sectionRecentlyViewed.
  ///
  /// In az, this message translates to:
  /// **'Son baxılanlar'**
  String get sectionRecentlyViewed;

  /// No description provided for @promoBannerTitle.
  ///
  /// In az, this message translates to:
  /// **'Təmirə başlamağa hazırsınız?'**
  String get promoBannerTitle;

  /// No description provided for @promoBannerSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Layihənizi yaradın, xərci əvvəlcədən hesablayın'**
  String get promoBannerSubtitle;

  /// No description provided for @emptyCategories.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriya tapılmadı'**
  String get emptyCategories;

  /// No description provided for @emptyWorkers.
  ///
  /// In az, this message translates to:
  /// **'Hələ təsdiqlənmiş usta yoxdur'**
  String get emptyWorkers;

  /// No description provided for @emptyMaterials.
  ///
  /// In az, this message translates to:
  /// **'Hələ material yoxdur'**
  String get emptyMaterials;

  /// No description provided for @emptyDiscounts.
  ///
  /// In az, this message translates to:
  /// **'Hazırda endirim yoxdur'**
  String get emptyDiscounts;

  /// No description provided for @emptyRecentlyViewed.
  ///
  /// In az, this message translates to:
  /// **'Hələ heç nəyə baxmamısınız'**
  String get emptyRecentlyViewed;

  /// No description provided for @detailComingSoon.
  ///
  /// In az, this message translates to:
  /// **'Ətraflı səhifə tezliklə əlavə olunacaq'**
  String get detailComingSoon;

  /// No description provided for @searchTitle.
  ///
  /// In az, this message translates to:
  /// **'Axtarış'**
  String get searchTitle;

  /// No description provided for @searchPrompt.
  ///
  /// In az, this message translates to:
  /// **'Nə axtardığınızı yazın'**
  String get searchPrompt;

  /// No description provided for @searchNoResults.
  ///
  /// In az, this message translates to:
  /// **'Nəticə tapılmadı'**
  String get searchNoResults;

  /// No description provided for @workerAvailable.
  ///
  /// In az, this message translates to:
  /// **'Əlçatandır'**
  String get workerAvailable;

  /// No description provided for @workerUnavailable.
  ///
  /// In az, this message translates to:
  /// **'Məşğuldur'**
  String get workerUnavailable;

  /// No description provided for @workerExperienceYears.
  ///
  /// In az, this message translates to:
  /// **'{years} il təcrübə'**
  String workerExperienceYears(int years);

  /// No description provided for @workerPortfolioTitle.
  ///
  /// In az, this message translates to:
  /// **'İş şəkilləri'**
  String get workerPortfolioTitle;

  /// No description provided for @workerOrderButton.
  ///
  /// In az, this message translates to:
  /// **'Sifariş et'**
  String get workerOrderButton;

  /// No description provided for @workerReviewsTitle.
  ///
  /// In az, this message translates to:
  /// **'Şərhlər'**
  String get workerReviewsTitle;

  /// No description provided for @workerNoReviews.
  ///
  /// In az, this message translates to:
  /// **'Hələ şərh yoxdur'**
  String get workerNoReviews;

  /// No description provided for @orderSheetTitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi təsdiqləyin'**
  String get orderSheetTitle;

  /// No description provided for @orderAddressLabel.
  ///
  /// In az, this message translates to:
  /// **'Ünvan'**
  String get orderAddressLabel;

  /// No description provided for @orderPickDate.
  ///
  /// In az, this message translates to:
  /// **'Tarix seçin'**
  String get orderPickDate;

  /// No description provided for @orderNotesLabel.
  ///
  /// In az, this message translates to:
  /// **'Qeyd (istəyə görə)'**
  String get orderNotesLabel;

  /// No description provided for @orderSubmitButton.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi göndər'**
  String get orderSubmitButton;

  /// No description provided for @orderCreatedSuccess.
  ///
  /// In az, this message translates to:
  /// **'Sifarişiniz göndərildi'**
  String get orderCreatedSuccess;

  /// No description provided for @sortLabel.
  ///
  /// In az, this message translates to:
  /// **'Sırala'**
  String get sortLabel;

  /// No description provided for @sortDefault.
  ///
  /// In az, this message translates to:
  /// **'Standart'**
  String get sortDefault;

  /// No description provided for @sortPriceAsc.
  ///
  /// In az, this message translates to:
  /// **'Qiymət: aşağıdan yuxarı'**
  String get sortPriceAsc;

  /// No description provided for @sortPriceDesc.
  ///
  /// In az, this message translates to:
  /// **'Qiymət: yuxarıdan aşağı'**
  String get sortPriceDesc;

  /// No description provided for @materialInStock.
  ///
  /// In az, this message translates to:
  /// **'{qty} ədəd stokda'**
  String materialInStock(int qty);

  /// No description provided for @materialOutOfStock.
  ///
  /// In az, this message translates to:
  /// **'Stokda yoxdur'**
  String get materialOutOfStock;

  /// No description provided for @materialAddToCart.
  ///
  /// In az, this message translates to:
  /// **'Səbətə əlavə et'**
  String get materialAddToCart;

  /// No description provided for @materialAddedToCart.
  ///
  /// In az, this message translates to:
  /// **'Məhsul səbətə əlavə edildi'**
  String get materialAddedToCart;

  /// No description provided for @materialOtherShops.
  ///
  /// In az, this message translates to:
  /// **'Digər mağazalarda'**
  String get materialOtherShops;

  /// No description provided for @materialQuantityLabel.
  ///
  /// In az, this message translates to:
  /// **'Miqdar'**
  String get materialQuantityLabel;

  /// No description provided for @shopProductsTitle.
  ///
  /// In az, this message translates to:
  /// **'Məhsullar'**
  String get shopProductsTitle;

  /// No description provided for @cartTitle.
  ///
  /// In az, this message translates to:
  /// **'Səbət'**
  String get cartTitle;

  /// No description provided for @cartEmpty.
  ///
  /// In az, this message translates to:
  /// **'Səbətiniz boşdur'**
  String get cartEmpty;

  /// No description provided for @cartTotalLabel.
  ///
  /// In az, this message translates to:
  /// **'Cəmi'**
  String get cartTotalLabel;

  /// No description provided for @cartCheckoutButton.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi göndər'**
  String get cartCheckoutButton;

  /// No description provided for @favoritesTitle.
  ///
  /// In az, this message translates to:
  /// **'Seçilmişlər'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmpty.
  ///
  /// In az, this message translates to:
  /// **'Hələ seçilmiş heç nə yoxdur'**
  String get favoritesEmpty;

  /// No description provided for @profileFavoritesLink.
  ///
  /// In az, this message translates to:
  /// **'Seçilmişlərim'**
  String get profileFavoritesLink;

  /// No description provided for @profileBecomeWorkerLink.
  ///
  /// In az, this message translates to:
  /// **'Usta kimi qeydiyyatdan keç'**
  String get profileBecomeWorkerLink;

  /// No description provided for @profileWorkerStatusPending.
  ///
  /// In az, this message translates to:
  /// **'Usta profiliniz təsdiq gözləyir'**
  String get profileWorkerStatusPending;

  /// No description provided for @profileWorkerStatusApproved.
  ///
  /// In az, this message translates to:
  /// **'Siz təsdiqlənmiş ustasınız'**
  String get profileWorkerStatusApproved;

  /// No description provided for @profileOpenShopLink.
  ///
  /// In az, this message translates to:
  /// **'Mağaza aç'**
  String get profileOpenShopLink;

  /// No description provided for @profileShopStatusPending.
  ///
  /// In az, this message translates to:
  /// **'Mağazanız təsdiq gözləyir'**
  String get profileShopStatusPending;

  /// No description provided for @profileShopStatusApproved.
  ///
  /// In az, this message translates to:
  /// **'Mağazanız təsdiqlənib'**
  String get profileShopStatusApproved;

  /// No description provided for @becomeWorkerTitle.
  ///
  /// In az, this message translates to:
  /// **'Usta profili'**
  String get becomeWorkerTitle;

  /// No description provided for @becomeWorkerBioLabel.
  ///
  /// In az, this message translates to:
  /// **'Özünüz haqqında'**
  String get becomeWorkerBioLabel;

  /// No description provided for @becomeWorkerExperienceLabel.
  ///
  /// In az, this message translates to:
  /// **'Təcrübə (il)'**
  String get becomeWorkerExperienceLabel;

  /// No description provided for @becomeWorkerPriceFromLabel.
  ///
  /// In az, this message translates to:
  /// **'Qiymət, min (₼)'**
  String get becomeWorkerPriceFromLabel;

  /// No description provided for @becomeWorkerPriceToLabel.
  ///
  /// In az, this message translates to:
  /// **'Qiymət, maks (₼)'**
  String get becomeWorkerPriceToLabel;

  /// No description provided for @becomeWorkerServiceAreasLabel.
  ///
  /// In az, this message translates to:
  /// **'Xidmət bölgələri (vergüllə ayırın)'**
  String get becomeWorkerServiceAreasLabel;

  /// No description provided for @becomeWorkerPhoneLabel.
  ///
  /// In az, this message translates to:
  /// **'Əlaqə nömrəsi'**
  String get becomeWorkerPhoneLabel;

  /// No description provided for @becomeWorkerCategoriesLabel.
  ///
  /// In az, this message translates to:
  /// **'İxtisas sahələri'**
  String get becomeWorkerCategoriesLabel;

  /// No description provided for @becomeWorkerSubmitButton.
  ///
  /// In az, this message translates to:
  /// **'Göndər'**
  String get becomeWorkerSubmitButton;

  /// No description provided for @becomeWorkerSuccess.
  ///
  /// In az, this message translates to:
  /// **'Profiliniz göndərildi, admin təsdiqini gözləyir'**
  String get becomeWorkerSuccess;

  /// No description provided for @becomeWorkerValidationError.
  ///
  /// In az, this message translates to:
  /// **'Bio doldurun və ən azı bir ixtisas sahəsi seçin'**
  String get becomeWorkerValidationError;

  /// No description provided for @openShopTitle.
  ///
  /// In az, this message translates to:
  /// **'Mağaza aç'**
  String get openShopTitle;

  /// No description provided for @openShopNameLabel.
  ///
  /// In az, this message translates to:
  /// **'Mağazanın adı'**
  String get openShopNameLabel;

  /// No description provided for @openShopAddressLabel.
  ///
  /// In az, this message translates to:
  /// **'Ünvan'**
  String get openShopAddressLabel;

  /// No description provided for @openShopRayonLabel.
  ///
  /// In az, this message translates to:
  /// **'Rayon'**
  String get openShopRayonLabel;

  /// No description provided for @openShopCategoriesLabel.
  ///
  /// In az, this message translates to:
  /// **'Satılan material kateqoriyaları'**
  String get openShopCategoriesLabel;

  /// No description provided for @openShopSubmitButton.
  ///
  /// In az, this message translates to:
  /// **'Göndər'**
  String get openShopSubmitButton;

  /// No description provided for @openShopSuccess.
  ///
  /// In az, this message translates to:
  /// **'Mağazanız göndərildi, admin təsdiqini gözləyir'**
  String get openShopSuccess;

  /// No description provided for @openShopValidationError.
  ///
  /// In az, this message translates to:
  /// **'Mağaza adını daxil edin'**
  String get openShopValidationError;

  /// No description provided for @projectCreateTitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni layihə'**
  String get projectCreateTitle;

  /// No description provided for @projectTitleLabel.
  ///
  /// In az, this message translates to:
  /// **'Layihə adı'**
  String get projectTitleLabel;

  /// No description provided for @projectRoomCountLabel.
  ///
  /// In az, this message translates to:
  /// **'Otaq sayı'**
  String get projectRoomCountLabel;

  /// No description provided for @projectBudgetLabel.
  ///
  /// In az, this message translates to:
  /// **'Planlaşdırılan büdcə'**
  String get projectBudgetLabel;

  /// No description provided for @projectCreateButton.
  ///
  /// In az, this message translates to:
  /// **'Yarat'**
  String get projectCreateButton;

  /// No description provided for @projectCreatedSuccess.
  ///
  /// In az, this message translates to:
  /// **'Layihə yaradıldı'**
  String get projectCreatedSuccess;

  /// No description provided for @projectStatusPlanning.
  ///
  /// In az, this message translates to:
  /// **'Planlaşdırma'**
  String get projectStatusPlanning;

  /// No description provided for @projectStatusInProgress.
  ///
  /// In az, this message translates to:
  /// **'İcra olunur'**
  String get projectStatusInProgress;

  /// No description provided for @projectStatusCompleted.
  ///
  /// In az, this message translates to:
  /// **'Tamamlanıb'**
  String get projectStatusCompleted;

  /// No description provided for @projectEstimatedCostLabel.
  ///
  /// In az, this message translates to:
  /// **'Təxmini xərc'**
  String get projectEstimatedCostLabel;

  /// No description provided for @projectBudgetPlannedLabel.
  ///
  /// In az, this message translates to:
  /// **'Büdcə'**
  String get projectBudgetPlannedLabel;

  /// No description provided for @projectRoomCountShort.
  ///
  /// In az, this message translates to:
  /// **'{count} otaq'**
  String projectRoomCountShort(int count);

  /// No description provided for @projectAddItemTitle.
  ///
  /// In az, this message translates to:
  /// **'Maddə əlavə et'**
  String get projectAddItemTitle;

  /// No description provided for @projectItemTypeWork.
  ///
  /// In az, this message translates to:
  /// **'İş'**
  String get projectItemTypeWork;

  /// No description provided for @projectItemTypeMaterial.
  ///
  /// In az, this message translates to:
  /// **'Material'**
  String get projectItemTypeMaterial;

  /// No description provided for @projectItemTypeWorker.
  ///
  /// In az, this message translates to:
  /// **'Usta'**
  String get projectItemTypeWorker;

  /// No description provided for @projectItemLabelField.
  ///
  /// In az, this message translates to:
  /// **'Ad'**
  String get projectItemLabelField;

  /// No description provided for @projectItemEstimatedCostField.
  ///
  /// In az, this message translates to:
  /// **'Təxmini xərc'**
  String get projectItemEstimatedCostField;

  /// No description provided for @projectItemActualCostField.
  ///
  /// In az, this message translates to:
  /// **'Faktiki xərc (istəyə görə)'**
  String get projectItemActualCostField;

  /// No description provided for @projectAddItemButton.
  ///
  /// In az, this message translates to:
  /// **'Əlavə et'**
  String get projectAddItemButton;

  /// No description provided for @projectDeleteConfirmTitle.
  ///
  /// In az, this message translates to:
  /// **'Layihəni silmək istəyirsiniz?'**
  String get projectDeleteConfirmTitle;

  /// No description provided for @projectDeleteConfirmMessage.
  ///
  /// In az, this message translates to:
  /// **'Bu əməliyyat geri qaytarıla bilməz.'**
  String get projectDeleteConfirmMessage;

  /// No description provided for @projectDeleteConfirmButton.
  ///
  /// In az, this message translates to:
  /// **'Sil'**
  String get projectDeleteConfirmButton;

  /// No description provided for @projectCancelButton.
  ///
  /// In az, this message translates to:
  /// **'İmtina'**
  String get projectCancelButton;

  /// No description provided for @projectEmpty.
  ///
  /// In az, this message translates to:
  /// **'Hələ layihəniz yoxdur'**
  String get projectEmpty;

  /// No description provided for @projectItemsEmpty.
  ///
  /// In az, this message translates to:
  /// **'Hələ maddə əlavə edilməyib'**
  String get projectItemsEmpty;

  /// No description provided for @projectSetActualCostTitle.
  ///
  /// In az, this message translates to:
  /// **'Faktiki xərci daxil edin'**
  String get projectSetActualCostTitle;

  /// No description provided for @projectSaveButton.
  ///
  /// In az, this message translates to:
  /// **'Yadda saxla'**
  String get projectSaveButton;

  /// No description provided for @chatsTitle.
  ///
  /// In az, this message translates to:
  /// **'Söhbətlər'**
  String get chatsTitle;

  /// No description provided for @chatsEmpty.
  ///
  /// In az, this message translates to:
  /// **'Hələ söhbətiniz yoxdur'**
  String get chatsEmpty;

  /// No description provided for @chatStartMessage.
  ///
  /// In az, this message translates to:
  /// **'Söhbətə başlayın'**
  String get chatStartMessage;

  /// No description provided for @chatMessageHint.
  ///
  /// In az, this message translates to:
  /// **'Mesaj yazın...'**
  String get chatMessageHint;

  /// No description provided for @workerMessageButton.
  ///
  /// In az, this message translates to:
  /// **'Mesaj yaz'**
  String get workerMessageButton;

  /// No description provided for @notificationsTitle.
  ///
  /// In az, this message translates to:
  /// **'Bildirişlər'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmpty.
  ///
  /// In az, this message translates to:
  /// **'Bildirişiniz yoxdur'**
  String get notificationsEmpty;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In az, this message translates to:
  /// **'Hamısını oxundu et'**
  String get notificationsMarkAllRead;

  /// No description provided for @adminPanelTitle.
  ///
  /// In az, this message translates to:
  /// **'Admin Panel'**
  String get adminPanelTitle;

  /// No description provided for @adminAccessDenied.
  ///
  /// In az, this message translates to:
  /// **'Bu bölməyə giriş icazəniz yoxdur'**
  String get adminAccessDenied;

  /// No description provided for @profileAdminPanelLink.
  ///
  /// In az, this message translates to:
  /// **'Admin Panel'**
  String get profileAdminPanelLink;

  /// No description provided for @adminStatUsers.
  ///
  /// In az, this message translates to:
  /// **'İstifadəçilər'**
  String get adminStatUsers;

  /// No description provided for @adminStatWorkers.
  ///
  /// In az, this message translates to:
  /// **'Ustalar'**
  String get adminStatWorkers;

  /// No description provided for @adminStatPendingWorkers.
  ///
  /// In az, this message translates to:
  /// **'Təsdiq gözləyən ustalar'**
  String get adminStatPendingWorkers;

  /// No description provided for @adminStatShops.
  ///
  /// In az, this message translates to:
  /// **'Mağazalar'**
  String get adminStatShops;

  /// No description provided for @adminStatPendingShops.
  ///
  /// In az, this message translates to:
  /// **'Təsdiq gözləyən mağazalar'**
  String get adminStatPendingShops;

  /// No description provided for @adminStatMaterials.
  ///
  /// In az, this message translates to:
  /// **'Materiallar'**
  String get adminStatMaterials;

  /// No description provided for @adminStatOrders.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlər'**
  String get adminStatOrders;

  /// No description provided for @adminMenuCategories.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriyalar'**
  String get adminMenuCategories;

  /// No description provided for @adminMenuPendingWorkers.
  ///
  /// In az, this message translates to:
  /// **'Usta təsdiqi'**
  String get adminMenuPendingWorkers;

  /// No description provided for @adminMenuPendingShops.
  ///
  /// In az, this message translates to:
  /// **'Mağaza təsdiqi'**
  String get adminMenuPendingShops;

  /// No description provided for @adminMenuUsers.
  ///
  /// In az, this message translates to:
  /// **'İstifadəçilər'**
  String get adminMenuUsers;

  /// No description provided for @adminAddCategory.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriya əlavə et'**
  String get adminAddCategory;

  /// No description provided for @adminEditCategory.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriyanı redaktə et'**
  String get adminEditCategory;

  /// No description provided for @adminCategoryNameLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad (Az)'**
  String get adminCategoryNameLabel;

  /// No description provided for @adminCategoryNameEnLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad (En)'**
  String get adminCategoryNameEnLabel;

  /// No description provided for @adminCategoryNameRuLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad (Ru)'**
  String get adminCategoryNameRuLabel;

  /// No description provided for @adminCategoryTypeLabel.
  ///
  /// In az, this message translates to:
  /// **'Növ'**
  String get adminCategoryTypeLabel;

  /// No description provided for @adminCategoryTypeWorker.
  ///
  /// In az, this message translates to:
  /// **'Usta'**
  String get adminCategoryTypeWorker;

  /// No description provided for @adminCategoryTypeMaterial.
  ///
  /// In az, this message translates to:
  /// **'Material'**
  String get adminCategoryTypeMaterial;

  /// No description provided for @adminDeleteCategoryConfirmTitle.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriyanı silmək istəyirsiniz?'**
  String get adminDeleteCategoryConfirmTitle;

  /// No description provided for @adminApproveButton.
  ///
  /// In az, this message translates to:
  /// **'Təsdiqlə'**
  String get adminApproveButton;

  /// No description provided for @adminRejectButton.
  ///
  /// In az, this message translates to:
  /// **'Rədd et'**
  String get adminRejectButton;

  /// No description provided for @adminNoPendingWorkers.
  ///
  /// In az, this message translates to:
  /// **'Təsdiq gözləyən usta yoxdur'**
  String get adminNoPendingWorkers;

  /// No description provided for @adminNoPendingShops.
  ///
  /// In az, this message translates to:
  /// **'Təsdiq gözləyən mağaza yoxdur'**
  String get adminNoPendingShops;

  /// No description provided for @adminRoleLabel.
  ///
  /// In az, this message translates to:
  /// **'Rol'**
  String get adminRoleLabel;

  /// No description provided for @adminRoleCustomer.
  ///
  /// In az, this message translates to:
  /// **'Müştəri'**
  String get adminRoleCustomer;

  /// No description provided for @adminRoleWorker.
  ///
  /// In az, this message translates to:
  /// **'Usta'**
  String get adminRoleWorker;

  /// No description provided for @adminRoleShopOwner.
  ///
  /// In az, this message translates to:
  /// **'Mağaza sahibi'**
  String get adminRoleShopOwner;

  /// No description provided for @adminRoleAdmin.
  ///
  /// In az, this message translates to:
  /// **'Admin'**
  String get adminRoleAdmin;

  /// No description provided for @aiAssistantTitle.
  ///
  /// In az, this message translates to:
  /// **'AI Köməkçi'**
  String get aiAssistantTitle;

  /// No description provided for @aiAssistantBannerTitle.
  ///
  /// In az, this message translates to:
  /// **'AI Köməkçidən soruşun'**
  String get aiAssistantBannerTitle;

  /// No description provided for @aiAssistantBannerSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Təmir sualınıza cavab alın, uyğun usta tapın'**
  String get aiAssistantBannerSubtitle;

  /// No description provided for @aiChatHint.
  ///
  /// In az, this message translates to:
  /// **'Sualınızı yazın...'**
  String get aiChatHint;

  /// No description provided for @aiChatWelcome.
  ///
  /// In az, this message translates to:
  /// **'Salam! Ev təmiri ilə bağlı sualınızı yazın.'**
  String get aiChatWelcome;

  /// No description provided for @aiBudgetEstimateButton.
  ///
  /// In az, this message translates to:
  /// **'AI ilə təxmin et'**
  String get aiBudgetEstimateButton;

  /// No description provided for @aiBudgetEstimateTitle.
  ///
  /// In az, this message translates to:
  /// **'AI ilə büdcə təxmini'**
  String get aiBudgetEstimateTitle;

  /// No description provided for @aiBudgetDescriptionHint.
  ///
  /// In az, this message translates to:
  /// **'Təmiri təsvir edin (məs. \"mətbəx təmiri, kafel və boya\")'**
  String get aiBudgetDescriptionHint;

  /// No description provided for @aiBudgetEstimateSubmit.
  ///
  /// In az, this message translates to:
  /// **'Təxmin et'**
  String get aiBudgetEstimateSubmit;

  /// No description provided for @aiBudgetResultTitle.
  ///
  /// In az, this message translates to:
  /// **'AI təklifi'**
  String get aiBudgetResultTitle;

  /// No description provided for @aiBudgetAddAllButton.
  ///
  /// In az, this message translates to:
  /// **'Hamısını layihəyə əlavə et'**
  String get aiBudgetAddAllButton;

  /// No description provided for @aiBudgetAddedSuccess.
  ///
  /// In az, this message translates to:
  /// **'Maddələr layihəyə əlavə edildi'**
  String get aiBudgetAddedSuccess;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['az', 'en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
