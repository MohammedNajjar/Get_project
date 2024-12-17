import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  final String _storedEmail = "test@gmail.com";
  final String _storedPassword = "12345678";

  bool _isLoggedIn = false; // حالة تسجيل الدخول
  bool get isLoggedIn => _isLoggedIn;


  bool login(String email, String password) {
    if (email == _storedEmail && password == _storedPassword) {
      _isLoggedIn = true;
      notifyListeners(); // تحديث الحالة
      return true;
    } else {
      _isLoggedIn = false;
      notifyListeners(); // تحديث الحالة
      return false;
    }
  }
}
