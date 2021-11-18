import 'package:carbon/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layouts/default.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(CarbonApp(prefs));
}

class CarbonApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  CarbonApp(this.sharedPreferences): super();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new ThemeManager(
            sharedPreferences.getInt(ThemeManager.keyThemePreference)??0
        ),
        child: Consumer<ThemeManager>(
            builder: (context, manager, _) {
              return MaterialApp(
                onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
                theme: manager.themeData,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en', ''),
                  Locale('pl', ''),
                ],
                home: DefaultLayout(),
              );
            }
        ),
    );
  }
}
