import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:potentiam_gallery/ui/module/album_module.dart';
import 'package:potentiam_gallery/utils/dio_curl_interceptor.dart';

class AppModule {
  static const bool debuggable = kReleaseMode ? false : true;
  static AppModule? _instance;

  factory AppModule() {
    _instance ??= AppModule._default();
    return _instance!;
  }

  AppModule._default();

  final dio = Dio()..interceptors.add(CurlInterceptor());
  bool enableMock = false;

  late final AlbumModule _albumModule = AlbumModule();

  Future<bool> initialise() async {
    await _albumModule.initialise(
        enableMock: enableMock,
        dio: dio,
      );
    return true;
  }
}
