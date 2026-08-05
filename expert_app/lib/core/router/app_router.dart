import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/phone_login_screen.dart';
import '../../features/auth/presentation/screens/profile_screen.dart';
import '../../features/admin/presentation/screens/admin_categories_screen.dart';
import '../../features/admin/presentation/screens/admin_home_screen.dart';
import '../../features/admin/presentation/screens/admin_pending_shops_screen.dart';
import '../../features/admin/presentation/screens/admin_pending_workers_screen.dart';
import '../../features/admin/presentation/screens/admin_users_screen.dart';
import '../../features/ai/presentation/screens/ai_chat_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/chat/presentation/screens/chat_list_screen.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/favorite/presentation/screens/favorites_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/search_screen.dart';
import '../../features/material/presentation/screens/material_detail_screen.dart';
import '../../features/material/presentation/screens/material_list_screen.dart';
import '../../features/notification/presentation/screens/notifications_screen.dart';
import '../../features/order/presentation/screens/cart_screen.dart';
import '../../features/project/presentation/screens/project_detail_screen.dart';
import '../../features/project/presentation/screens/project_list_screen.dart';
import '../../features/shop/presentation/screens/shop_detail_screen.dart';
import '../../features/worker/presentation/screens/worker_detail_screen.dart';
import '../../features/worker/presentation/screens/worker_list_screen.dart';
import 'go_router_refresh_stream.dart';

const _publicRoutes = ['/login', '/register', '/forgot-password', '/phone-login', '/phone-otp'];

/// Mərhələ 6+-da hər feature-in öz ekranları buraya əlavə olunacaq.
/// Yalnız Env.isSupabaseConfigured true olduqda istifadə olunur (bax app.dart).
///
/// Qeyd: redirect yoxlaması `authStateChangesProvider`-in (profil sətrini də
/// asinxron gətirən) qiymətinə yox, Supabase-in sinxron `currentSession`
/// getter-inə əsaslanır — əks halda iki ayrı asinxron abunəlik arasında
/// yarış vəziyyəti yaranır (login/register uğurlu olsa da yönləndirmə
/// gecikə/baş verməyə bilər).
final appRouterProvider = Provider<GoRouter>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  final refreshStream = GoRouterRefreshStream(supabaseClient.auth.onAuthStateChange);
  ref.onDispose(refreshStream.dispose);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: refreshStream,
    redirect: (context, state) {
      final isLoggedIn = supabaseClient.auth.currentSession != null;
      final isPublicRoute = _publicRoutes.any((r) => state.matchedLocation.startsWith(r));

      if (!isLoggedIn && !isPublicRoute) return '/login';
      if (isLoggedIn && isPublicRoute) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => SearchScreen(initialQuery: state.extra as String?),
      ),
      GoRoute(
        path: '/workers',
        name: 'workers',
        builder: (context, state) {
          final extra = state.extra as Map<String, String?>?;
          return WorkerListScreen(
            categoryId: extra?['categoryId'],
            categoryName: extra?['categoryName'],
          );
        },
      ),
      GoRoute(
        path: '/workers/:id',
        name: 'worker-detail',
        builder: (context, state) => WorkerDetailScreen(workerId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/materials',
        name: 'materials',
        builder: (context, state) {
          final extra = state.extra as Map<String, String?>?;
          return MaterialListScreen(
            categoryId: extra?['categoryId'],
            categoryName: extra?['categoryName'],
          );
        },
      ),
      GoRoute(
        path: '/materials/:id',
        name: 'material-detail',
        builder: (context, state) => MaterialDetailScreen(materialId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/shops/:id',
        name: 'shop-detail',
        builder: (context, state) => ShopDetailScreen(shopId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/favorites',
        name: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: '/projects',
        name: 'projects',
        builder: (context, state) => const ProjectListScreen(),
      ),
      GoRoute(
        path: '/projects/:id',
        name: 'project-detail',
        builder: (context, state) => ProjectDetailScreen(projectId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/chats',
        name: 'chats',
        builder: (context, state) => const ChatListScreen(),
      ),
      GoRoute(
        path: '/chats/:id',
        name: 'chat-detail',
        builder: (context, state) => ChatScreen(
          chatId: state.pathParameters['id']!,
          title: state.extra as String?,
        ),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminHomeScreen(),
      ),
      GoRoute(
        path: '/admin/categories',
        name: 'admin-categories',
        builder: (context, state) => const AdminCategoriesScreen(),
      ),
      GoRoute(
        path: '/admin/workers',
        name: 'admin-workers',
        builder: (context, state) => const AdminPendingWorkersScreen(),
      ),
      GoRoute(
        path: '/admin/shops',
        name: 'admin-shops',
        builder: (context, state) => const AdminPendingShopsScreen(),
      ),
      GoRoute(
        path: '/admin/users',
        name: 'admin-users',
        builder: (context, state) => const AdminUsersScreen(),
      ),
      GoRoute(
        path: '/ai-assistant',
        name: 'ai-assistant',
        builder: (context, state) => const AiChatScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/phone-login',
        name: 'phone-login',
        builder: (context, state) => const PhoneLoginScreen(),
      ),
      GoRoute(
        path: '/phone-otp',
        name: 'phone-otp',
        builder: (context, state) => OtpScreen(phone: state.extra as String),
      ),
    ],
  );
});
