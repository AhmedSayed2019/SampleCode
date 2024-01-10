import 'package:base_app/generated/assets.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:flutter/material.dart';

import '../../core/res/resources.dart';

class CustomScaffold extends StatelessWidget {
  final String? _image;
  final Widget? _body;
  final bool _extendBodyBehindAppBar;
  final PreferredSizeWidget? _appBar;

  const CustomScaffold({
    super.key,
     String? image ,
     bool extendBodyBehindAppBar = false, Widget? body, PreferredSizeWidget? appBar,
  })  : _image = image,_appBar = appBar,_extendBodyBehindAppBar = extendBodyBehindAppBar, _body = body;

  @override
  Widget build(BuildContext context) {
    return StatusBar(

      color: Colors.transparent,
      // color: Theme.of(context).primaryColor,
      isDark: false,

      child: Scaffold(

        extendBodyBehindAppBar: _extendBodyBehindAppBar,
        extendBody: _extendBodyBehindAppBar,
        appBar: _appBar,
        body: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: _image==null?null:BoxDecoration(
            image: DecorationImage(image: AssetImage(_image!), fit: BoxFit.cover),
          ),
          child: SafeArea(child: _body??const SizedBox(),),
          // top: !_extendBodyBehindAppBar,
        ),
      ),
    );
  }
}
