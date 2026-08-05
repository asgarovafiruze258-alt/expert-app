import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../providers/admin_providers.dart';

String _roleLabel(AppLocalizations l10n, UserRole role) {
  return switch (role) {
    UserRole.customer => l10n.adminRoleCustomer,
    UserRole.worker => l10n.adminRoleWorker,
    UserRole.shopOwner => l10n.adminRoleShopOwner,
    UserRole.admin => l10n.adminRoleAdmin,
  };
}

int _ageFrom(DateTime dateOfBirth) {
  final now = DateTime.now();
  var age = now.year - dateOfBirth.year;
  if (now.month < dateOfBirth.month ||
      (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
    age--;
  }
  return age;
}

class AdminUsersScreen extends ConsumerWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final users = ref.watch(adminUsersProvider);
    final isLoading = ref.watch(userRoleControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminMenuUsers)),
      body: users.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final user = items[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : '?'),
                ),
                title: Text(user.fullName),
                subtitle: Text(
                  [
                    user.phone ?? user.email ?? '',
                    if (user.dateOfBirth != null) l10n.adminUserAge(_ageFrom(user.dateOfBirth!)),
                  ].where((s) => s.isNotEmpty).join(' · '),
                ),
                trailing: DropdownButton<UserRole>(
                  value: user.role,
                  underline: const SizedBox.shrink(),
                  onChanged: isLoading
                      ? null
                      : (role) {
                          if (role != null) {
                            ref
                                .read(userRoleControllerProvider.notifier)
                                .updateRole(userId: user.id, role: role);
                          }
                        },
                  items: UserRole.values
                      .map((role) => DropdownMenuItem(value: role, child: Text(_roleLabel(l10n, role))))
                      .toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
