import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routelift/config/routes.dart';

import 'package:routelift/services/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpserviceLocator();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Route lift',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/home',
        routes: routes);
  }
}
