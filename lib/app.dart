
import 'package:country_code_picker/country_localizations.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';

import 'core/res/theme/theme.dart';
import 'core/routing/navigation_services.dart';
import 'core/routing/route_generator.dart';
import 'core/routing/routes.dart';
import 'presentation/component/component.dart';

BuildContext? appContext;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return MaterialApp(
      theme: lightTheme,
      color:Theme.of(context).scaffoldBackgroundColor,

      localizationsDelegates: [

        CountryLocalizations.delegate, ...context.localizationDelegates,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Ahmed Sayed',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigationKey,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteBaseGenerator.generateRoute,
      builder: (context, child) => Directionality(
        textDirection: context.locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: StatusBar(color: Theme.of(context).primaryColorDark,isDark: true,child: ( child ?? const SizedBox())),
      ),
    );
  }
}
