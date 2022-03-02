import 'package:disenos/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:disenos/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        child: MyApp(),
        create: (context) => ThemeChanger(2),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
      theme: appTheme,
    );
  }
}
