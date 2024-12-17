import 'package:exam_projct/screen/LoginScreen.dart';
import 'package:exam_projct/screen/ScreenHome.dart';
import 'package:exam_projct/screen/Splash%20Screen.dart';
import 'package:exam_projct/providers/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()), // توفير LoginProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => ScreenHome()), // الصفحة الرئيسية
        GetPage(name: '/login', page: () => LoginScreen()), // صفحة تسجيل الدخول
      ],
    );
  }
}
