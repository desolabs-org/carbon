import 'package:carbon/dao/feed_id.dart';
import 'package:carbon/dao/network_kind.dart';
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

  static FeedId defaultFeed = FeedId(
    "b239e037-3faf-4e1d-9d6b-85624ecc7538",
    NetworkKind.DesoNinja
  );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => DefaultScreen(
          defaultFeed
        ),
      ),
      GoRoute(
        path: '/feeds/:feedId',
        builder: (BuildContext context, GoRouterState state) {
          final String feedId = state.params['feedId']!;
          return DefaultScreen(FeedId(feedId, NetworkKind.DesoNinja));
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      onGenerateTitle: (BuildContext context) => S.of(context).app_title,
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
