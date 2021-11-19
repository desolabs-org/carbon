import 'package:carbon/generated/l10n.dart';
import 'package:carbon/models/deso_sdk_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:deso_sdk/deso_sdk.dart';
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
          ChangeNotifierProvider<DesoSdkManager>(
              create: (_) => new DesoSdkManager(sharedPreferences)),
        ],
        child: Consumer2<ThemeManager, DesoSdkManager>(
            builder: (context, manager, desoSdk, _) {
              return MaterialApp(
                onGenerateTitle: (BuildContext context) =>
                  S.of(context).appTitle + " - " + (desoSdk.desoSdk.client.host??""),
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
                home: DefaultLayout(desoSdk),
              );
            }
        ),
    );
  }
}
