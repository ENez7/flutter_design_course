import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark().copyWith(
            secondary: Colors.pink,
          ),
        );
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  set darkTheme(bool value) {
    this._customTheme = false;
    this._darkTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(
          secondary: Colors.pink,
        ),
      );
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    this._darkTheme = false;
    this._customTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(
          secondary: Color(0xff48A0EB),
        ),
        primaryColorLight: Color(0xff48A0EB),
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
// * textTheme.bodyText1.color
      );
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
