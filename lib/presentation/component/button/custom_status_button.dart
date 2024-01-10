import 'package:flutter/material.dart';

import '../../../../../../../core/res/resources.dart';
import '../../../../../../core/res/color.dart';
import '../component.dart';


class CustomStatusButton extends StatelessWidget {
  final String _title;
  final bool _isActive;
  final VoidCallback _onTap ;

  const CustomStatusButton({super.key,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  })  : _title = title,
        _isActive = isActive,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: CustomButton(
          onTap: _onTap,
          color: _isActive ? Theme.of(context).primaryColor : Theme.of(context).cardColor ,
          title: _title ,
          textColor: _isActive ? Theme.of(context).primaryColorLight : Theme.of(context).textTheme.headline1?.color)
    );
  }

}
