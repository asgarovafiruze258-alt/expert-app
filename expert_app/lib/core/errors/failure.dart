import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server({@Default('Server xətası baş verdi') String message}) = ServerFailure;
  const factory Failure.network({@Default('İnternet bağlantısı yoxdur') String message}) = NetworkFailure;
  const factory Failure.cache({@Default('Yaddaş xətası baş verdi') String message}) = CacheFailure;
  const factory Failure.unauthorized({@Default('Yetki yoxdur, yenidən daxil olun') String message}) = UnauthorizedFailure;
  const factory Failure.validation({@Default('Daxil edilən məlumat düzgün deyil') String message}) = ValidationFailure;
  const factory Failure.unexpected({@Default('Gözlənilməz xəta baş verdi') String message}) = UnexpectedFailure;
}
