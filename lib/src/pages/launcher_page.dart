import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import '../routes/routes.dart' show pageRoutes;
import 'package:disenos/src/theme/theme_changer.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Desings'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final secondary = appTheme.colorScheme.secondary;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: secondary,
        ),
        title: Text(pageRoutes[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: secondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[i].page),
          );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final secondary = appTheme.currentTheme.colorScheme.secondary;
    return SafeArea(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: secondary,
                  child: Text(
                    'ENC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Expanded(
                child: _ListaOpciones(),
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb_outline,
                  color: secondary,
                ),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  onChanged: (value) => appTheme.darkTheme = value,
                  activeColor: secondary,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb_outline,
                  color: secondary,
                ),
                title: Text('Custom Theme Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                  activeColor: secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
