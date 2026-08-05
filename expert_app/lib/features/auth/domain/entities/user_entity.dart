import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

enum UserRole { customer, worker, shopOwner, admin }

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    String? phone,
    String? email,
    required String fullName,
    String? avatarUrl,
    required UserRole role,
    required String preferredLanguage,
    required bool isVerified,
  }) = _UserEntity;
}
