class Validators {
  const Validators._();

  static final _emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,}$');
  static final _azPhoneRegex = RegExp(r'^\+994[0-9]{9}$');

  static String? required(String? value, {String message = 'Bu sahə tələb olunur'}) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'E-poçt tələb olunur';
    if (!_emailRegex.hasMatch(value.trim())) return 'Düzgün e-poçt daxil edin';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Şifrə tələb olunur';
    if (value.length < 6) return 'Şifrə ən azı 6 simvol olmalıdır';
    return null;
  }

  static String? azPhone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Telefon nömrəsi tələb olunur';
    if (!_azPhoneRegex.hasMatch(value.trim())) {
      return 'Nömrə +994XXXXXXXXX formatında olmalıdır';
    }
    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.trim().isEmpty) return 'Kod tələb olunur';
    if (value.trim().length < 4) return 'Kodu tam daxil edin';
    return null;
  }
}
