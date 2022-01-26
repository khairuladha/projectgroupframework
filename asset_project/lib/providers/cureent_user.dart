import 'package:flutter/cupertino.dart';

class AppUser {
  String name;
  String role;

  AppUser(this.name, this.role);
}

class CurrentUser with ChangeNotifier {
  AppUser currentUser = AppUser('', '');

  AppUser get getCurrentUser => currentUser;

  void changeUser(String name, String role) {
    currentUser = AppUser(name, role);
    notifyListeners();
  }

  watch() {}
}