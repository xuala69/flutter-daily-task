import 'package:flutter/material.dart';
import 'package:app/ui/components/bottom_nav.dart';
import 'package:app/ui/screens/home_screen.dart';
import 'package:app/ui/screens/settings_screen.dart';
import 'package:app/ui/screens/statics_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  AppScreenState createState() => AppScreenState();
}

class AppScreenState extends State<AppScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    StaticsScreen(),
    const SettingsScreen(),
  ];
  int _selectedScreen = 0;

  _onSelectNavItem(int position) {
    setState(() {
      debugPrint('onSelectNavItem: $position');
      _selectedScreen = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreen],
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedScreen,
        onClickItem: _onSelectNavItem,
      ),
    );
  }
}
