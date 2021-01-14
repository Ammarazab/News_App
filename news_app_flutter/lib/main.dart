import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/home.dart';
import 'package:news_app_flutter/screens/onboarding.dart';
import 'package:news_app_flutter/utilities/apptheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget _screen;
  bool seen = prefs.getBool('seen');
  if (seen == false || seen == null) {
    _screen = OnboardingScreen();
  } else {
    _screen = HomeScreen();
  }
  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;
 NewsApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: this._screen,
    );
  }
}
