import 'package:base_app/generated/assets.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/modules/layout/children/services/services_screen.dart';

import '../../../../../core/utils/navigation_tab_data.dart';
import 'children/countries/countries_screen.dart';
import 'children/home/home_screen.dart';

class _NavigationTabs {
  /// Default constructor is private because this class will be only used for
  /// static fields and you should not instantiate it.
  _NavigationTabs._();
  static const profile = 0;
  static const countries = 1;
  static const services = 2;
}

const List<NavigationTabData> kCustomerTabs = <NavigationTabData>[
  NavigationTabData(
    title: LocaleKeys.profile,
    selectedIcon: Assets.navNavSelectedProfileIcon,
    unSelectedIcon: Assets.navNavUnselectedProfileIcon,
    initialRoute: HomeScreen(),
    index: _NavigationTabs.profile,
  ),
  NavigationTabData(
    title: LocaleKeys.countries,
    selectedIcon: Assets.navNavSelectedCountriesIcon,
    unSelectedIcon: Assets.navNavUnselectedCountriesIcon,
    initialRoute: CountriesScreen(),
    index: _NavigationTabs.countries,
  ),
  NavigationTabData(
    title: LocaleKeys.services,
    selectedIcon: Assets.navNavSelectedServicesIcon,
    unSelectedIcon: Assets.navNavUnselectedServicesIcon,
    initialRoute: ServicesScreen(),
    index: _NavigationTabs.services,
  ),


];
