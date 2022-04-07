import 'package:carbon/generated/l10n.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      ProviderScope(
          child: CarbonApp()
      )
  );
}

final themeProvider = StateNotifierProvider<ThemeManager, ThemeData>((_) => new ThemeManager());
final layoutProvider = StateNotifierProvider<LayoutManager, Widget>((_) => new LayoutManager());

class CarbonApp extends ConsumerWidget {

  static CarbonApp? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<CarbonApp>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      theme: ref.watch(themeProvider),
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
      home: ref.watch(layoutProvider),
    );
  }
}
