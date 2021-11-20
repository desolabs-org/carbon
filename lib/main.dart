import 'package:carbon/generated/l10n.dart';
import 'package:carbon/models/deso_node_data.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeManager>(
              create: (_) => new ThemeManager(sharedPreferences)),
          ChangeNotifierProvider<DesoNodeData>(
              create: (_) => new DesoNodeData(sharedPreferences)),
        ],
        child: Consumer2<ThemeManager, DesoNodeData>(
            builder: (context, manager, desoNodeData, _) {
              return MaterialApp(
                onGenerateTitle: (BuildContext context) =>
                  S.of(context).appTitle + " - " + desoNodeData.apiEndpoint,
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
                home: DefaultLayout(desoNodeData),
              );
            }
        ),
    );
  }
}
