import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      initialRoute: '/home',
      routes: {
        // '/': (context) => const LoginPage(),
        AppRoutes.HomeRoute: (context) => const HomePage(),
        AppRoutes.LoginRoute: (context) => const LoginPage()
      },
    );
  }
}
