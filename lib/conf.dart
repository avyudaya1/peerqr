import 'package:peerqr/logic/sharing_object.dart';
import 'package:peerqr/screens/error.dart';
import 'package:peerqr/screens/home.dart';
import 'package:peerqr/screens/languages.dart';
import 'package:peerqr/screens/loading.dart';
import 'package:peerqr/screens/settings.dart';
import 'package:peerqr/screens/share.dart';

import 'logic/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ne.dart';

const List<int> ports = [50500, 50050];

// only for fetching update
const String currentVersion = '1.0';
const String multipleFilesDelimiter = '|peer_qr|';

List<Language> get languageList => [
      Language(
          name: 'english',
          nameLocal: 'English',
          locale: const Locale('en'),
          localizations: AppLocalizationsEn()),
      Language(
          name: 'nepali',
          nameLocal: 'नेपाली',
          locale: const Locale('ne'),
          localizations: AppLocalizationsNe())
    ];

enum Screens {
  loading,
  languagePicker,
  home,
  sharing,
  error,
  settings,
}

Widget screen2widget(Screens s, [Object? args]) {
  switch (s) {
    case Screens.loading:
      return LoadingScreen();
    case Screens.languagePicker:
      return LanguagePickerScreen();
    case Screens.home:
      return HomeScreen();
    case Screens.sharing:
      return SharingScreen(args! as SharingObject);
    case Screens.settings:
      return SettingsScreen();
    case Screens.error:
      return ErrorScreen(args! as String);
  }
}
