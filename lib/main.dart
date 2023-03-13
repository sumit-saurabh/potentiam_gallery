
import 'package:flutter/material.dart';
import 'package:potentiam_gallery/ui/factory/bloc_factory.dart';
import 'package:potentiam_gallery/ui/module/app_module.dart';
import 'package:potentiam_gallery/ui/widget/app.dart';
import 'package:potentiam_gallery/utils/app_logger.dart';
import 'package:potentiam_gallery/utils/safe_run.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: futureBuilder(),
  ));
}

FutureBuilder<bool> futureBuilder() {
  return FutureBuilder<bool>(
      future: initializeDependencies(),
      builder: (context, snapshot) {
        logger.v("App init - ${snapshot.data}");

        if (snapshot.hasData && snapshot.data!) return const App();
        if (snapshot.data == false) {
          return const Text("Something went wrong");
        }
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }
        return Container(
          color: Colors.white,
        );
      });
}

Future<bool> initializeDependencies() async {
  return safeRunWithFutureReturn(() async {

    await AppModule().initialise();
    await BlocFactory().initialise();

    return true;
  }, onError: (e, s) {
    logger.e(
        "Error while initialising app - $e\n$s"
    );
    return Future.value(false);
  });
}