import 'logic/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ne.dart';

List<Language> get languageList => [
      Language(
          name: 'english',
          nameLocal: 'English',
          locale: const Locale('en'),
          localizations: AppLocalizationsEn()),
      Language(
          name: 'nepali',
          nameLocal: 'Nepali',
          locale: const Locale('ne'),
          localizations: AppLocalizationsNe())
    ];
