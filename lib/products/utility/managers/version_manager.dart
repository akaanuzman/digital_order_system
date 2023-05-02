import 'package:digital_order_system/products/utility/exception/version_custom_exception.dart';

class VersionManager {
  final String clientVersion;
  final String dbVersion;

  VersionManager({
    required this.clientVersion,
    required this.dbVersion,
  });

  bool get isNeedUpdate {
    final String clientVersionSplited = clientVersion.split('.').join();
    final String dbVersionSplited = dbVersion.split('.').join();

    final int? clientVersionParsed = int.tryParse(clientVersionSplited);
    final int? dbVersionParsed = int.tryParse(dbVersionSplited);

    if (clientVersionParsed == null || dbVersionParsed == null) {
      throw VersionCustomException(
          '$clientVersion or $dbVersion is not valid for parse');
    }

    return clientVersionParsed < dbVersionParsed;
  }
}
