import 'dart:async';


import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/domain/provider/local_auth_provider.dart';
import 'package:base_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../../../../core/routing/navigation_services.dart';
import '../../../../../core/routing/routes.dart';
import '../../../component/component.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final LocalAuthProvider _viewModel;

  _playAnimation() async{

    Timer(const Duration(seconds: 1), () async {
      _route();
    });


  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _viewModel = Provider.of<LocalAuthProvider>(context, listen: false);

    super.initState();
    _playAnimation();

  }
  void _route() async{
    Timer(const Duration(seconds: 2), () async {
      bool isAuthed = await _viewModel.isLogin();
      if (isAuthed) {
        NavigationService.pushNamedAndRemoveUntil(Routes.layoutScreen);
      }else{
        NavigationService.pushNamedAndRemoveUntil( Routes.authScreen);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      color: Theme.of(context).primaryColor,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            Assets.svgKafillLogo,
            width: 50.w,
            height: 50.h,
            // width: 245.92.w,
            // height: 120.h,
          ),
        ),
      ),
    );
  }
}
