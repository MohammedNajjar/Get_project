import 'package:exam_projct/ScreenHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Splash Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => ScreenHome()), // صفحة القائمة الرئيسية
      ],
    );
  }
}