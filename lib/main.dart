import 'package:carbon/app.dart';
import 'package:carbon/generated/l10n.dart';
import 'package:carbon/layouts/desogram.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/models/deso_node_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layouts/classic_layout.dart';

void main() async {
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
          ChangeNotifierProvider<DesoNodeManager>(
              create: (_) => new DesoNodeManager(sharedPreferences)),
          ChangeNotifierProvider<LayoutManager>(
              create: (_) => new LayoutManager(sharedPreferences)),
        ],
        child: Consumer3<ThemeManager, DesoNodeManager, LayoutManager>(
            builder: (context, themeManager, desoNodeData, layoutManager, _) {
              return MaterialApp(
                onGenerateTitle: (BuildContext context) =>
                  S.of(context).appTitle + " - " + desoNodeData.apiEndpoint,
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
                  data: desoNodeData,
                  theme: themeManager,
                  layout: layoutManager,
                  child:
                  DesoGramLayout(),
                  //ClassicLayout(),
                ),
              );
            }
        ),
    );
  }
}
