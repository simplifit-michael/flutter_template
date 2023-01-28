import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/src/core/app/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));

  runApp(const App());
}
