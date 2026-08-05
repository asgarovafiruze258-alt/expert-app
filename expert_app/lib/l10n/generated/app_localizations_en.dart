// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'ExperTikinti';

  @override
  String get welcomeTitle => 'Welcome';

  @override
  String get welcomeSubtitle =>
      'The complete ecosystem for home renovation — find workers, choose materials, manage your project.';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeToggleLabel => 'Theme';

  @override
  String get languageLabel => 'Language';

  @override
  String get languageAz => 'Azerbaijani';

  @override
  String get languageEn => 'English';

  @override
  String get languageRu => 'Russian';

  @override
  String get navHome => 'Home';

  @override
  String get navWorkers => 'Workers';

  @override
  String get navMaterials => 'Materials';

  @override
  String get navProjects => 'My Projects';

  @override
  String get navProfile => 'Profile';

  @override
  String get comingSoon => 'This section will be available soon';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authFullNameLabel => 'Full name';

  @override
  String get authPhoneLabel => 'Phone number';

  @override
  String get authOtpLabel => 'SMS code';

  @override
  String get authLoginTitle => 'Sign in';

  @override
  String get authLoginButton => 'Sign in';

  @override
  String get authNoAccount => 'Don\'t have an account?';

  @override
  String get authRegisterLink => 'Sign up';

  @override
  String get authForgotPasswordLink => 'Forgot password?';

  @override
  String get authUsePhoneInstead => 'Sign in with phone number';

  @override
  String get authRegisterTitle => 'Create an account';

  @override
  String get authRegisterButton => 'Sign up';

  @override
  String get authHaveAccount => 'Already have an account?';

  @override
  String get authLoginLink => 'Sign in';

  @override
  String get authForgotPasswordTitle => 'Reset password';

  @override
  String get authForgotPasswordSubtitle =>
      'Enter your email and we\'ll send you a password reset link.';

  @override
  String get authSendResetLink => 'Send reset link';

  @override
  String get authResetEmailSent => 'Reset link sent to your email';

  @override
  String get authBackToLogin => 'Back to sign in';

  @override
  String get authPhoneLoginTitle => 'Sign in with phone';

  @override
  String get authPhoneLoginSubtitle =>
      'Enter your number and we\'ll send you a verification code by SMS.';

  @override
  String get authSendOtpButton => 'Send code';

  @override
  String get authOrEmailLogin => 'Sign in with email';

  @override
  String get authOtpTitle => 'Verify code';

  @override
  String authOtpSubtitle(String phone) {
    return 'Enter the code sent to $phone';
  }

  @override
  String get authVerifyButton => 'Verify';

  @override
  String get authResendOtp => 'Resend code';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileLogout => 'Log out';

  @override
  String get profileEditButton => 'Edit';

  @override
  String get editProfileTitle => 'Edit profile';

  @override
  String get editProfileNameLabel => 'Full name';

  @override
  String get editProfileSaveButton => 'Save';

  @override
  String get editProfileSuccess => 'Profile updated';

  @override
  String get editProfileValidationError => 'Full name cannot be empty';

  @override
  String get searchHint => 'Search workers or materials...';

  @override
  String get sectionCategories => 'Categories';

  @override
  String get sectionPopularWorkers => 'Popular workers';

  @override
  String get sectionPopularMaterials => 'Popular materials';

  @override
  String get sectionDiscounts => 'Discounts';

  @override
  String get sectionRecentlyViewed => 'Recently viewed';

  @override
  String get promoBannerTitle => 'Ready to start your renovation?';

  @override
  String get promoBannerSubtitle =>
      'Create a project and estimate your budget in advance';

  @override
  String get emptyCategories => 'No categories found';

  @override
  String get emptyWorkers => 'No approved workers yet';

  @override
  String get emptyMaterials => 'No materials yet';

  @override
  String get emptyDiscounts => 'No discounts right now';

  @override
  String get emptyRecentlyViewed => 'You haven\'t viewed anything yet';

  @override
  String get detailComingSoon => 'Detail page will be added soon';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchPrompt => 'Type what you\'re looking for';

  @override
  String get searchNoResults => 'No results found';

  @override
  String get workerAvailable => 'Available';

  @override
  String get workerUnavailable => 'Busy';

  @override
  String workerExperienceYears(int years) {
    return '$years years of experience';
  }

  @override
  String get workerPortfolioTitle => 'Work photos';

  @override
  String get workerOrderButton => 'Order';

  @override
  String get workerReviewsTitle => 'Reviews';

  @override
  String get workerNoReviews => 'No reviews yet';

  @override
  String get orderSheetTitle => 'Confirm order';

  @override
  String get orderAddressLabel => 'Address';

  @override
  String get orderPickDate => 'Pick a date';

  @override
  String get orderNotesLabel => 'Notes (optional)';

  @override
  String get orderSubmitButton => 'Send order';

  @override
  String get orderCreatedSuccess => 'Your order has been sent';

  @override
  String get sortLabel => 'Sort';

  @override
  String get sortDefault => 'Default';

  @override
  String get sortPriceAsc => 'Price: low to high';

  @override
  String get sortPriceDesc => 'Price: high to low';

  @override
  String materialInStock(int qty) {
    return '$qty in stock';
  }

  @override
  String get materialOutOfStock => 'Out of stock';

  @override
  String get materialAddToCart => 'Add to cart';

  @override
  String get materialAddedToCart => 'Item added to cart';

  @override
  String get materialOtherShops => 'In other shops';

  @override
  String get materialQuantityLabel => 'Quantity';

  @override
  String get shopProductsTitle => 'Products';

  @override
  String get cartTitle => 'Cart';

  @override
  String get cartEmpty => 'Your cart is empty';

  @override
  String get cartTotalLabel => 'Total';

  @override
  String get cartCheckoutButton => 'Send order';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmpty => 'Nothing favorited yet';

  @override
  String get profileFavoritesLink => 'My favorites';

  @override
  String get profileBecomeWorkerLink => 'Register as a worker';

  @override
  String get profileWorkerStatusPending =>
      'Your worker profile is awaiting approval';

  @override
  String get profileWorkerStatusApproved => 'You are an approved worker';

  @override
  String get profileOpenShopLink => 'Open a shop';

  @override
  String get profileShopStatusPending => 'Your shop is awaiting approval';

  @override
  String get profileShopStatusApproved => 'Your shop is approved';

  @override
  String get becomeWorkerTitle => 'Worker profile';

  @override
  String get becomeWorkerBioLabel => 'About you';

  @override
  String get becomeWorkerExperienceLabel => 'Experience (years)';

  @override
  String get becomeWorkerPriceFromLabel => 'Price from (₼)';

  @override
  String get becomeWorkerPriceToLabel => 'Price to (₼)';

  @override
  String get becomeWorkerServiceAreasLabel => 'Service areas (comma-separated)';

  @override
  String get becomeWorkerPhoneLabel => 'Contact phone';

  @override
  String get becomeWorkerCategoriesLabel => 'Specialties';

  @override
  String get becomeWorkerSubmitButton => 'Submit';

  @override
  String get becomeWorkerSuccess =>
      'Your profile was submitted, awaiting admin approval';

  @override
  String get becomeWorkerValidationError =>
      'Fill in your bio and pick at least one specialty';

  @override
  String get openShopTitle => 'Open a shop';

  @override
  String get openShopNameLabel => 'Shop name';

  @override
  String get openShopAddressLabel => 'Address';

  @override
  String get openShopRayonLabel => 'District';

  @override
  String get openShopCategoriesLabel => 'Material categories you sell';

  @override
  String get openShopSubmitButton => 'Submit';

  @override
  String get openShopSuccess =>
      'Your shop was submitted, awaiting admin approval';

  @override
  String get openShopValidationError => 'Enter a shop name';

  @override
  String get projectCreateTitle => 'New project';

  @override
  String get projectTitleLabel => 'Project title';

  @override
  String get projectRoomCountLabel => 'Room count';

  @override
  String get projectBudgetLabel => 'Planned budget';

  @override
  String get projectCreateButton => 'Create';

  @override
  String get projectCreatedSuccess => 'Project created';

  @override
  String get projectStatusPlanning => 'Planning';

  @override
  String get projectStatusInProgress => 'In progress';

  @override
  String get projectStatusCompleted => 'Completed';

  @override
  String get projectEstimatedCostLabel => 'Estimated cost';

  @override
  String get projectBudgetPlannedLabel => 'Budget';

  @override
  String projectRoomCountShort(int count) {
    return '$count rooms';
  }

  @override
  String get projectAddItemTitle => 'Add item';

  @override
  String get projectItemTypeWork => 'Work';

  @override
  String get projectItemTypeMaterial => 'Material';

  @override
  String get projectItemTypeWorker => 'Worker';

  @override
  String get projectItemLabelField => 'Name';

  @override
  String get projectItemEstimatedCostField => 'Estimated cost';

  @override
  String get projectItemActualCostField => 'Actual cost (optional)';

  @override
  String get projectAddItemButton => 'Add';

  @override
  String get projectDeleteConfirmTitle => 'Delete this project?';

  @override
  String get projectDeleteConfirmMessage => 'This action cannot be undone.';

  @override
  String get projectDeleteConfirmButton => 'Delete';

  @override
  String get projectCancelButton => 'Cancel';

  @override
  String get projectEmpty => 'You don\'t have any projects yet';

  @override
  String get projectItemsEmpty => 'No items added yet';

  @override
  String get projectSetActualCostTitle => 'Enter actual cost';

  @override
  String get projectSaveButton => 'Save';

  @override
  String get chatsTitle => 'Chats';

  @override
  String get chatsEmpty => 'You don\'t have any chats yet';

  @override
  String get chatStartMessage => 'Start the conversation';

  @override
  String get chatMessageHint => 'Type a message...';

  @override
  String get workerMessageButton => 'Message';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmpty => 'You have no notifications';

  @override
  String get notificationsMarkAllRead => 'Mark all as read';

  @override
  String get adminPanelTitle => 'Admin Panel';

  @override
  String get adminAccessDenied => 'You don\'t have access to this section';

  @override
  String get profileAdminPanelLink => 'Admin Panel';

  @override
  String get adminStatUsers => 'Users';

  @override
  String get adminStatWorkers => 'Workers';

  @override
  String get adminStatPendingWorkers => 'Workers pending approval';

  @override
  String get adminStatShops => 'Shops';

  @override
  String get adminStatPendingShops => 'Shops pending approval';

  @override
  String get adminStatMaterials => 'Materials';

  @override
  String get adminStatOrders => 'Orders';

  @override
  String get adminMenuCategories => 'Categories';

  @override
  String get adminMenuPendingWorkers => 'Worker approvals';

  @override
  String get adminMenuPendingShops => 'Shop approvals';

  @override
  String get adminMenuUsers => 'Users';

  @override
  String get adminAddCategory => 'Add category';

  @override
  String get adminEditCategory => 'Edit category';

  @override
  String get adminCategoryNameLabel => 'Name (Az)';

  @override
  String get adminCategoryNameEnLabel => 'Name (En)';

  @override
  String get adminCategoryNameRuLabel => 'Name (Ru)';

  @override
  String get adminCategoryTypeLabel => 'Type';

  @override
  String get adminCategoryTypeWorker => 'Worker';

  @override
  String get adminCategoryTypeMaterial => 'Material';

  @override
  String get adminDeleteCategoryConfirmTitle => 'Delete this category?';

  @override
  String get adminApproveButton => 'Approve';

  @override
  String get adminRejectButton => 'Reject';

  @override
  String get adminNoPendingWorkers => 'No workers pending approval';

  @override
  String get adminNoPendingShops => 'No shops pending approval';

  @override
  String get adminRoleLabel => 'Role';

  @override
  String get adminRoleCustomer => 'Customer';

  @override
  String get adminRoleWorker => 'Worker';

  @override
  String get adminRoleShopOwner => 'Shop owner';

  @override
  String get adminRoleAdmin => 'Admin';

  @override
  String get aiAssistantTitle => 'AI Assistant';

  @override
  String get aiAssistantBannerTitle => 'Ask the AI Assistant';

  @override
  String get aiAssistantBannerSubtitle =>
      'Get answers to renovation questions, find the right worker';

  @override
  String get aiChatHint => 'Type your question...';

  @override
  String get aiChatWelcome => 'Hi! Ask me anything about home renovation.';

  @override
  String get aiBudgetEstimateButton => 'Estimate with AI';

  @override
  String get aiBudgetEstimateTitle => 'AI budget estimate';

  @override
  String get aiBudgetDescriptionHint =>
      'Describe the renovation (e.g. \"kitchen renovation, tiles and paint\")';

  @override
  String get aiBudgetEstimateSubmit => 'Estimate';

  @override
  String get aiBudgetResultTitle => 'AI suggestion';

  @override
  String get aiBudgetAddAllButton => 'Add all to project';

  @override
  String get aiBudgetAddedSuccess => 'Items added to the project';
}
