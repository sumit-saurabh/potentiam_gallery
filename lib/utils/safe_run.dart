import 'package:flutter/foundation.dart';

Future<T> safeRunWithFutureReturn<T>(Future<T> Function() run,
    {required Future<T> Function(Object, StackTrace) onError}) async{
  try {
    return Future.value(await run.call());
  } catch (ex, st) {
    if (kDebugMode) {
      print("Error in safe run - $ex \nstackTrace: $st");
    }
    return Future.value(onError.call(ex, st));
  }
}
