import 'package:caichacha/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_schemes.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //只有竖屏
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const _defaultLightColorScheme = lightColorScheme;
  static const _defaultDarkColorScheme = darkColorScheme;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system);
    });
  }
}
