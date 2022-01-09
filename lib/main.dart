import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:peerqr/conf.dart';
import 'package:peerqr/logic/language.dart';

import 'package:peerqr/logic/theme.dart';
import 'package:peerqr/screens/loading.dart';
import 'package:provider/provider.dart';
import 'utils/material_ink_well.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager()),
      ChangeNotifierProvider(create: (_) => LanguageManager())
    ],
    child: const PeerQrApp(),
  ));
}

class PeerQrApp extends StatelessWidget {
  const PeerQrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: context.watch<ThemeManager>().brightness == Brightness.dark
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.grey.shade900.withOpacity(0.4),
              systemNavigationBarColor: Colors.deepPurple.shade100,
              // systemNavigationBarDividerColor: Colors.deepPurple.shade100,
              systemNavigationBarIconBrightness: Brightness.dark)
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.grey.shade100.withOpacity(0.6),
              systemNavigationBarColor: Colors.deepPurple.shade100,
              // systemNavigationBarDividerColor: Colors.deepPurple.shade100,
              systemNavigationBarIconBrightness: Brightness.dark),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: context.watch<LanguageManager>().language.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: languageList.map((e) => e.locale),
        title: 'Peer Qr',
        theme: ThemeData(
            splashFactory: MaterialInkSplash.splashFactory,
            brightness: Brightness.light,
            inputDecorationTheme: InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.shade900.withOpacity(0.8),
                        width: 2))),
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.grey.shade600,
                selectionHandleColor: Colors.grey.shade200.withOpacity(0.9),
                selectionColor: Colors.deepPurple.shade100.withOpacity(0.6)),

            // peerqr top icon color
            accentColor: Colors.deepPurple.shade500,

            // primarySwatch: Colors.deepPurple,

            // right click selection color
            cardColor: Colors.grey.shade200.withOpacity(0.9),

            // color of the button on the default background
            dividerColor: Colors.deepPurple.shade400,

            // about card color
            buttonColor: Colors.deepPurple.shade50.withOpacity(0.6)),
        darkTheme: ThemeData(
          splashFactory: MaterialInkSplash.splashFactory,

          brightness: Brightness.dark,
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.deepPurple.shade50.withOpacity(0.8),
                      width: 2))),

          // primarySwatch: Colors.grey,

          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.deepPurple.shade50,
              selectionHandleColor: Colors.deepPurple.shade300.withOpacity(0.9),
              selectionColor: Colors.deepPurple.shade50.withOpacity(0.4)),

          // peerqr top icon color
          accentColor: Colors.deepPurple.shade300,

          // right click selection color
          cardColor: Colors.deepPurple.shade400.withOpacity(0.9),

          // color of the button on the default background
          dividerColor: Colors.deepPurple.shade50,

          // about card color
          buttonColor: Colors.deepPurple.shade100.withOpacity(0.8),
        ),
        themeMode: context.watch<ThemeManager>().theme,
        home: LoadingScreen(),
      ),
    );
  }
}
