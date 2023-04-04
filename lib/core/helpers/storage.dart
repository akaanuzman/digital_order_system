import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final String _sharedSecret = '?0,_:W9Z=nxxM}ph=8';
  final String _tokenKey = 'toomeToken';

  saveStorage({
    required String token,
    required String key,
  }) async {
    const options =
        IOSOptions(accessibility: KeychainAccessibility.first_unlock);
    var storage = const FlutterSecureStorage();
    await storage.write(
      key: _sharedSecret + _tokenKey + key,
      value: token,
      aOptions: _getAndroidOptions(),
      iOptions: options,
    );
  }

  Future<String?> readStorage(String k) async {
    var storage = const FlutterSecureStorage();
    var value = await storage.read(
      key: _sharedSecret + _tokenKey + k,
      aOptions: _getAndroidOptions(),
    );

    return value;
  }

  Future<void> get deleteAllDataFromStorage async {
    var storage = const FlutterSecureStorage();
    await storage.deleteAll(
      aOptions: _getAndroidOptions(),
    );
  }

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
