import 'package:base_app/core/res/resources.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextClickWidget extends StatelessWidget {
  final String _text ;
  final String _subText ;
  final Color? _textColor ;
  final GestureTapCallback? _onTap;
  const TextClickWidget({super.key,
    String text='',
    String subText='',
    Color? textColor,
    GestureTapCallback? onTap,
  })  : _text = text,
        _subText = subText,
        _textColor = textColor,
        _onTap = onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _text ,
            style: const TextStyle().regularStyle().colorHint()
          ),
          TextSpan(
            text: _subText,
            style:const TextStyle().regularStyle().boldStyle().activeColor(),//.underLineStyle() Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).primaryColor, height: 1.4, fontSize: 16,decoration:TextDecoration.underline ),
            recognizer: TapGestureRecognizer()..onTap = _onTap,
          ),
        ],
      ),
    );
  }


}

