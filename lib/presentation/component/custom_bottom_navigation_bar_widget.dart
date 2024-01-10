import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/utils/navigation_tab_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'component.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  final ValueChanged<int> _onTap;
  final int _currentIndex;
  final List<NavigationTabData> _tabs;

  const BottomNavigationBarWidget({
    Key? key,
    required ValueChanged<int> onTap,
    required int currentIndex,
    required List<NavigationTabData> tabs,
  })  : _onTap = onTap,
        _currentIndex = currentIndex,
        _tabs = tabs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).highlightColor,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: true, //selected item
        showUnselectedLabels: true, //unselected item
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [..._generateTags(context)],
      ),
    );
  }

  _generateTags(BuildContext context) {
    return _tabs.map((tab) => _buildItem(context, tab)).toList();
  }

  _buildItem(BuildContext context, NavigationTabData tab) {
    String icon =
    tab.index == _currentIndex ? tab.selectedIcon : tab.unSelectedIcon;
    return BottomNavigationBarItem(
      label: tr(tab.title),
      icon: TapEffect(
        onTap: () => _onTap(tab.index),
        child: CustomSVGIcon(
          icon,
          width: 26.r,
          height: 26.r,
          color: tab.index == _currentIndex
              ? Theme.of(context).primaryColor
              : Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
