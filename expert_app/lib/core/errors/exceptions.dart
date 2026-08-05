class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server xətası baş verdi']);
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Yaddaş xətası baş verdi']);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'İnternet bağlantısı yoxdur']);
}

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException([this.message = 'Yetki yoxdur, yenidən daxil olun']);
}
