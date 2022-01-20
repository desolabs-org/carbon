import 'package:carbon/app.dart';
import 'package:carbon/dao/deso_node.dart';
import 'package:carbon/generated/l10n.dart';
import 'package:carbon/layouts/manager.dart';
import 'package:carbon/dao/deso_ninja.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(CarbonApp(prefs));
}

class CarbonApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  CarbonApp(this.sharedPreferences): super();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeManager>(
              create: (_) => new ThemeManager(sharedPreferences)),
          ChangeNotifierProvider<DesoNinjaDao>(
              create: (_) => new DesoNinjaDao()),
          ChangeNotifierProvider<DesoNodeDao>(
              create: (_) => new DesoNodeDao(sharedPreferences)),
          ChangeNotifierProvider<LayoutManager>(
              create: (_) => new LayoutManager(sharedPreferences)),
        ],
        child: Consumer4<ThemeManager, DesoNinjaDao, DesoNodeDao, LayoutManager>(
            builder: (context, themeManager, ninjaDao, desoDao, layoutManager, _) {
              return MaterialApp(
                onGenerateTitle: (BuildContext context) =>
                  S.of(context).appTitle + " - " + ninjaDao.endpoint,
                theme: themeManager.themeData,
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
                home: App(
                  data: ninjaDao,
                  theme: themeManager,
                  layout: layoutManager,
                  child: layoutManager.current(),
                ),
              );
            }
        ),
    );
  }
}
