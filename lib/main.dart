import 'package:carbon/generated/l10n.dart';
import 'package:carbon/screens/default.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(
      ProviderScope(
          child: CarbonApp()
      )
  );
}

final themeProvider = StateNotifierProvider<ThemeManager, ThemeData>((_) => new ThemeManager());

class CarbonApp extends ConsumerWidget {

  static CarbonApp? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<CarbonApp>();

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => DefaultScreen(
          "128b4a0b-4431-4e14-a6b5-3b000e40e0e7"
        ),
      ),
      GoRoute(
        path: '/feeds/:feedId',
        builder: (BuildContext context, GoRouterState state) {
          final String feedId = state.params['feedId']!;
          return DefaultScreen(feedId);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
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
    );
  }
}
