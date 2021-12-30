import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:kryptonium/routes/router.dart' as RouterFile;
import 'package:kryptonium/theme/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: GetMaterialApp(
          title: 'kryptonium',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.downToUp,
          getPages: RouterFile.Router.route,
          initialRoute: '/splash',
          theme: Themes.theme,
        ),
      ),
    );
  }
}
