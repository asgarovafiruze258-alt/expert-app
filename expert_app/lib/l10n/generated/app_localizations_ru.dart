// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'ExperTikinti';

  @override
  String get welcomeTitle => 'Добро пожаловать';

  @override
  String get welcomeSubtitle =>
      'Полная экосистема для ремонта дома — найдите мастера, выберите материалы, управляйте своим проектом.';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeToggleLabel => 'Тема';

  @override
  String get languageLabel => 'Язык';

  @override
  String get languageAz => 'Азербайджанский';

  @override
  String get languageEn => 'Английский';

  @override
  String get languageRu => 'Русский';

  @override
  String get navHome => 'Главная';

  @override
  String get navWorkers => 'Мастера';

  @override
  String get navMaterials => 'Материалы';

  @override
  String get navProjects => 'Мои проекты';

  @override
  String get navProfile => 'Профиль';

  @override
  String get comingSoon => 'Этот раздел скоро будет доступен';

  @override
  String get authEmailLabel => 'Эл. почта';

  @override
  String get authPasswordLabel => 'Пароль';

  @override
  String get authFullNameLabel => 'Имя и фамилия';

  @override
  String get authPhoneLabel => 'Номер телефона';

  @override
  String get authOtpLabel => 'SMS-код';

  @override
  String get authLoginTitle => 'Вход в аккаунт';

  @override
  String get authLoginButton => 'Войти';

  @override
  String get authNoAccount => 'Нет аккаунта?';

  @override
  String get authRegisterLink => 'Зарегистрироваться';

  @override
  String get authForgotPasswordLink => 'Забыли пароль?';

  @override
  String get authUsePhoneInstead => 'Войти по номеру телефона';

  @override
  String get authRegisterTitle => 'Создать аккаунт';

  @override
  String get authRegisterButton => 'Зарегистрироваться';

  @override
  String get authHaveAccount => 'Уже есть аккаунт?';

  @override
  String get authLoginLink => 'Войти';

  @override
  String get authForgotPasswordTitle => 'Восстановление пароля';

  @override
  String get authForgotPasswordSubtitle =>
      'Введите свой email, и мы отправим ссылку для восстановления пароля.';

  @override
  String get authSendResetLink => 'Отправить ссылку';

  @override
  String get authResetEmailSent => 'Ссылка отправлена на вашу почту';

  @override
  String get authBackToLogin => 'Вернуться ко входу';

  @override
  String get authPhoneLoginTitle => 'Вход по телефону';

  @override
  String get authPhoneLoginSubtitle =>
      'Введите номер телефона, мы отправим вам код подтверждения по SMS.';

  @override
  String get authSendOtpButton => 'Отправить код';

  @override
  String get authOrEmailLogin => 'Войти по эл. почте';

  @override
  String get authOtpTitle => 'Подтвердите код';

  @override
  String authOtpSubtitle(String phone) {
    return 'Введите код, отправленный на $phone';
  }

  @override
  String get authVerifyButton => 'Подтвердить';

  @override
  String get authResendOtp => 'Отправить код повторно';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileLogout => 'Выйти';

  @override
  String get profileEditButton => 'Редактировать';

  @override
  String get editProfileTitle => 'Редактировать профиль';

  @override
  String get editProfileNameLabel => 'Имя, фамилия';

  @override
  String get editProfilePhoneLabel => 'Контактный телефон';

  @override
  String get editProfileDateOfBirthLabel => 'Дата рождения';

  @override
  String get editProfileSaveButton => 'Сохранить';

  @override
  String get editProfileSuccess => 'Профиль обновлён';

  @override
  String get editProfileValidationError => 'Имя не может быть пустым';

  @override
  String get searchHint => 'Поиск мастеров или материалов...';

  @override
  String get sectionCategories => 'Категории';

  @override
  String get sectionPopularWorkers => 'Популярные мастера';

  @override
  String get sectionPopularMaterials => 'Популярные материалы';

  @override
  String get sectionDiscounts => 'Скидки';

  @override
  String get sectionRecentlyViewed => 'Недавно просмотренные';

  @override
  String get promoBannerTitle => 'Готовы начать ремонт?';

  @override
  String get promoBannerSubtitle => 'Создайте проект и заранее оцените бюджет';

  @override
  String get emptyCategories => 'Категории не найдены';

  @override
  String get emptyWorkers => 'Пока нет одобренных мастеров';

  @override
  String get emptyMaterials => 'Пока нет материалов';

  @override
  String get emptyDiscounts => 'Сейчас нет скидок';

  @override
  String get emptyRecentlyViewed => 'Вы ещё ничего не просматривали';

  @override
  String get detailComingSoon => 'Страница деталей скоро будет добавлена';

  @override
  String get searchTitle => 'Поиск';

  @override
  String get searchPrompt => 'Введите, что вы ищете';

  @override
  String get searchNoResults => 'Ничего не найдено';

  @override
  String get workerAvailable => 'Доступен';

  @override
  String get workerUnavailable => 'Занят';

  @override
  String workerExperienceYears(int years) {
    return '$years лет опыта';
  }

  @override
  String get workerPortfolioTitle => 'Фото работ';

  @override
  String get workerOrderButton => 'Заказать';

  @override
  String get workerReviewsTitle => 'Отзывы';

  @override
  String get workerNoReviews => 'Пока нет отзывов';

  @override
  String get orderSheetTitle => 'Подтвердите заказ';

  @override
  String get orderAddressLabel => 'Адрес';

  @override
  String get orderPickDate => 'Выбрать дату';

  @override
  String get orderNotesLabel => 'Примечание (необязательно)';

  @override
  String get orderSubmitButton => 'Отправить заказ';

  @override
  String get orderCreatedSuccess => 'Ваш заказ отправлен';

  @override
  String get sortLabel => 'Сортировка';

  @override
  String get sortDefault => 'Стандарт';

  @override
  String get sortPriceAsc => 'Цена: по возрастанию';

  @override
  String get sortPriceDesc => 'Цена: по убыванию';

  @override
  String materialInStock(int qty) {
    return '$qty в наличии';
  }

  @override
  String get materialOutOfStock => 'Нет в наличии';

  @override
  String get materialAddToCart => 'Добавить в корзину';

  @override
  String get materialAddedToCart => 'Товар добавлен в корзину';

  @override
  String get materialOtherShops => 'В других магазинах';

  @override
  String get materialQuantityLabel => 'Количество';

  @override
  String get shopProductsTitle => 'Товары';

  @override
  String get cartTitle => 'Корзина';

  @override
  String get cartEmpty => 'Ваша корзина пуста';

  @override
  String get cartTotalLabel => 'Итого';

  @override
  String get cartCheckoutButton => 'Отправить заказ';

  @override
  String get favoritesTitle => 'Избранное';

  @override
  String get favoritesEmpty => 'Пока ничего не добавлено';

  @override
  String get profileFavoritesLink => 'Мои избранные';

  @override
  String get profileBecomeWorkerLink => 'Зарегистрироваться как мастер';

  @override
  String get profileWorkerStatusPending =>
      'Ваш профиль мастера ожидает подтверждения';

  @override
  String get profileWorkerStatusApproved => 'Вы подтверждённый мастер';

  @override
  String get profileOpenShopLink => 'Открыть магазин';

  @override
  String get profileShopStatusPending => 'Ваш магазин ожидает подтверждения';

  @override
  String get profileShopStatusApproved => 'Ваш магазин подтверждён';

  @override
  String get becomeWorkerTitle => 'Профиль мастера';

  @override
  String get becomeWorkerBioLabel => 'О себе';

  @override
  String get becomeWorkerExperienceLabel => 'Опыт (лет)';

  @override
  String get becomeWorkerPriceFromLabel => 'Цена от (₼)';

  @override
  String get becomeWorkerPriceToLabel => 'Цена до (₼)';

  @override
  String get becomeWorkerServiceAreasLabel =>
      'Районы обслуживания (через запятую)';

  @override
  String get becomeWorkerPhoneLabel => 'Контактный телефон';

  @override
  String get becomeWorkerCategoriesLabel => 'Специализации';

  @override
  String get becomeWorkerSubmitButton => 'Отправить';

  @override
  String get becomeWorkerSuccess =>
      'Профиль отправлен, ожидайте подтверждения администратора';

  @override
  String get becomeWorkerValidationError =>
      'Заполните описание и выберите хотя бы одну специализацию';

  @override
  String get openShopTitle => 'Открыть магазин';

  @override
  String get openShopNameLabel => 'Название магазина';

  @override
  String get openShopAddressLabel => 'Адрес';

  @override
  String get openShopRayonLabel => 'Район';

  @override
  String get openShopPhoneLabel => 'Контактный телефон';

  @override
  String get openShopCategoriesLabel =>
      'Категории материалов, которые вы продаёте';

  @override
  String get openShopSubmitButton => 'Отправить';

  @override
  String get openShopSuccess =>
      'Магазин отправлен, ожидайте подтверждения администратора';

  @override
  String get openShopValidationError => 'Введите название магазина';

  @override
  String get openShopPickOnMapButton => 'Выбрать точно на карте';

  @override
  String get openShopLocationSelected => 'Выбрано на карте';

  @override
  String get shopLocationPickerTitle => 'Выбрать адрес на карте';

  @override
  String get shopLocationResolving => 'Определение адреса...';

  @override
  String get shopLocationUnresolved =>
      'Передвиньте карту, чтобы выбрать точную точку';

  @override
  String get shopLocationConfirmButton => 'Использовать этот адрес';

  @override
  String get projectCreateTitle => 'Новый проект';

  @override
  String get projectTitleLabel => 'Название проекта';

  @override
  String get projectRoomCountLabel => 'Количество комнат';

  @override
  String get projectBudgetLabel => 'Плановый бюджет';

  @override
  String get projectCreateButton => 'Создать';

  @override
  String get projectCreatedSuccess => 'Проект создан';

  @override
  String get projectStatusPlanning => 'Планирование';

  @override
  String get projectStatusInProgress => 'В процессе';

  @override
  String get projectStatusCompleted => 'Завершён';

  @override
  String get projectEstimatedCostLabel => 'Расчётная стоимость';

  @override
  String get projectBudgetPlannedLabel => 'Бюджет';

  @override
  String projectRoomCountShort(int count) {
    return '$count комнат';
  }

  @override
  String get projectAddItemTitle => 'Добавить пункт';

  @override
  String get projectItemTypeWork => 'Работа';

  @override
  String get projectItemTypeMaterial => 'Материал';

  @override
  String get projectItemTypeWorker => 'Мастер';

  @override
  String get projectItemLabelField => 'Название';

  @override
  String get projectItemEstimatedCostField => 'Расчётная стоимость';

  @override
  String get projectItemActualCostField =>
      'Фактическая стоимость (необязательно)';

  @override
  String get projectAddItemButton => 'Добавить';

  @override
  String get projectDeleteConfirmTitle => 'Удалить проект?';

  @override
  String get projectDeleteConfirmMessage => 'Это действие нельзя отменить.';

  @override
  String get projectDeleteConfirmButton => 'Удалить';

  @override
  String get projectCancelButton => 'Отмена';

  @override
  String get projectEmpty => 'У вас пока нет проектов';

  @override
  String get projectItemsEmpty => 'Пункты ещё не добавлены';

  @override
  String get projectSetActualCostTitle => 'Введите фактическую стоимость';

  @override
  String get projectSaveButton => 'Сохранить';

  @override
  String get chatsTitle => 'Чаты';

  @override
  String get chatsEmpty => 'У вас пока нет чатов';

  @override
  String get chatStartMessage => 'Начните переписку';

  @override
  String get chatMessageHint => 'Введите сообщение...';

  @override
  String get workerMessageButton => 'Написать';

  @override
  String get notificationsTitle => 'Уведомления';

  @override
  String get notificationsEmpty => 'У вас нет уведомлений';

  @override
  String get notificationsMarkAllRead => 'Отметить все как прочитанные';

  @override
  String get adminPanelTitle => 'Админ-панель';

  @override
  String get adminAccessDenied => 'У вас нет доступа к этому разделу';

  @override
  String get profileAdminPanelLink => 'Админ-панель';

  @override
  String get adminStatUsers => 'Пользователи';

  @override
  String get adminStatWorkers => 'Мастера';

  @override
  String get adminStatPendingWorkers => 'Мастера на утверждении';

  @override
  String get adminStatShops => 'Магазины';

  @override
  String get adminStatPendingShops => 'Магазины на утверждении';

  @override
  String get adminStatMaterials => 'Материалы';

  @override
  String get adminStatOrders => 'Заказы';

  @override
  String get adminMenuCategories => 'Категории';

  @override
  String get adminMenuPendingWorkers => 'Утверждение мастеров';

  @override
  String get adminMenuPendingShops => 'Утверждение магазинов';

  @override
  String get adminMenuUsers => 'Пользователи';

  @override
  String get adminAddCategory => 'Добавить категорию';

  @override
  String get adminEditCategory => 'Редактировать категорию';

  @override
  String get adminCategoryNameLabel => 'Название (Az)';

  @override
  String get adminCategoryNameEnLabel => 'Название (En)';

  @override
  String get adminCategoryNameRuLabel => 'Название (Ru)';

  @override
  String get adminCategoryTypeLabel => 'Тип';

  @override
  String get adminCategoryTypeWorker => 'Мастер';

  @override
  String get adminCategoryTypeMaterial => 'Материал';

  @override
  String get adminDeleteCategoryConfirmTitle => 'Удалить эту категорию?';

  @override
  String get adminApproveButton => 'Утвердить';

  @override
  String get adminRejectButton => 'Отклонить';

  @override
  String get adminNoPendingWorkers => 'Нет мастеров на утверждении';

  @override
  String get adminNoPendingShops => 'Нет магазинов на утверждении';

  @override
  String get adminRoleLabel => 'Роль';

  @override
  String get adminRoleCustomer => 'Клиент';

  @override
  String get adminRoleWorker => 'Мастер';

  @override
  String get adminRoleShopOwner => 'Владелец магазина';

  @override
  String get adminRoleAdmin => 'Админ';

  @override
  String adminUserAge(int age) {
    return '$age лет';
  }

  @override
  String get aiAssistantTitle => 'AI Помощник';

  @override
  String get aiAssistantBannerTitle => 'Спросите AI Помощника';

  @override
  String get aiAssistantBannerSubtitle =>
      'Получите ответ на вопрос о ремонте, найдите нужного мастера';

  @override
  String get aiChatHint => 'Введите ваш вопрос...';

  @override
  String get aiChatWelcome => 'Привет! Задайте вопрос о ремонте дома.';

  @override
  String get aiBudgetEstimateButton => 'Оценить с AI';

  @override
  String get aiBudgetEstimateTitle => 'AI оценка бюджета';

  @override
  String get aiBudgetDescriptionHint =>
      'Опишите ремонт (напр. \"ремонт кухни, плитка и покраска\")';

  @override
  String get aiBudgetEstimateSubmit => 'Оценить';

  @override
  String get aiBudgetResultTitle => 'Предложение AI';

  @override
  String get aiBudgetAddAllButton => 'Добавить всё в проект';

  @override
  String get aiBudgetAddedSuccess => 'Пункты добавлены в проект';
}
