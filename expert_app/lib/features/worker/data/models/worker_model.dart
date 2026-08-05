import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/worker_entity.dart';

part 'worker_model.freezed.dart';

@freezed
sealed class WorkerModel with _$WorkerModel {
  const WorkerModel._();

  const factory WorkerModel({
    required String id,
    required String fullName,
    String? avatarUrl,
    String? bio,
    required int experienceYears,
    double? priceFrom,
    double? priceTo,
    required List<String> serviceAreas,
    required List<String> portfolioImages,
    String? contactPhone,
    required double rating,
    required int reviewCount,
    required bool isOnline,
    required bool isAvailable,
    required bool isApproved,
    required List<String> categoryNames,
  }) = _WorkerModel;

  /// `workers?select=*,profiles(full_name,avatar_url),worker_categories(categories(name))`
  /// sorğusunun nəticəsini gözləyir.
  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    final profile = json['profiles'] as Map<String, dynamic>? ?? const {};
    final workerCategories = json['worker_categories'] as List? ?? const [];
    final categoryNames = workerCategories
        .map((wc) => (wc as Map<String, dynamic>)['categories'] as Map<String, dynamic>?)
        .where((c) => c != null)
        .map((c) => c!['name'] as String)
        .toList();

    return WorkerModel(
      id: json['id'] as String,
      fullName: (profile['full_name'] as String?) ?? '',
      avatarUrl: profile['avatar_url'] as String?,
      bio: json['bio'] as String?,
      experienceYears: (json['experience_years'] as num?)?.toInt() ?? 0,
      priceFrom: (json['price_from'] as num?)?.toDouble(),
      priceTo: (json['price_to'] as num?)?.toDouble(),
      serviceAreas: List<String>.from(json['service_areas'] as List? ?? const []),
      portfolioImages: List<String>.from(json['portfolio_images'] as List? ?? const []),
      contactPhone: json['contact_phone'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
      isOnline: json['is_online'] as bool? ?? false,
      isAvailable: json['is_available'] as bool? ?? true,
      isApproved: json['is_approved'] as bool? ?? false,
      categoryNames: categoryNames,
    );
  }

  WorkerEntity toEntity() {
    return WorkerEntity(
      id: id,
      fullName: fullName,
      avatarUrl: avatarUrl,
      bio: bio,
      experienceYears: experienceYears,
      priceFrom: priceFrom,
      priceTo: priceTo,
      serviceAreas: serviceAreas,
      portfolioImages: portfolioImages,
      contactPhone: contactPhone,
      rating: rating,
      reviewCount: reviewCount,
      isOnline: isOnline,
      isAvailable: isAvailable,
      isApproved: isApproved,
      categoryNames: categoryNames,
    );
  }
}
