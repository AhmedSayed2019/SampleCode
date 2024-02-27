
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:base_app/providers.dart';

import 'app.dart';
import 'injection.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // print('${record.level.name}: ${record.time}: ${record.message}');
  });
  // for the responsive service to work (I don't know the reason until now)
  await Future.delayed(const Duration(milliseconds: 300));
  await EasyLocalization.ensureInitialized();

  initInjection();

  runApp(
      GenerateMultiProvider(
        child: EasyLocalization(
            supportedLocales:  _supportedLocales,
            path: 'assets/translations',
            // if device language not supported
            fallbackLocale: _supportedLocales.first,
            saveLocale: true,
            useOnlyLangCode: true,
            startLocale:_supportedLocales.first,
            child:  const MyApp()),
      ));
}

final _supportedLocales = <Locale>[
  const Locale('en'),
];
