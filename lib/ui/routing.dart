import 'package:get/get.dart';
import 'package:app/ui/screens/app_screen.dart';
import 'package:app/ui/screens/home_screen.dart';
import 'package:app/ui/screens/settings_screen.dart';
import 'package:app/ui/screens/statics_screen.dart';
import 'package:app/ui/screens/todo_edit.dart';

class MRouting {
  static const app = "/";
  static const home = "/home";
  static const statics = "/statics";
  static const settings = "/settings";
  static const todoEdit = "/todo/edit";

  static List<GetPage> pages = [
    GetPage(
      name: app,
      page: () => const AppScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: statics,
      page: () => StaticsScreen(),
    ),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: todoEdit,
      page: () => TodoEditScreen(),
    )
  ];
}
