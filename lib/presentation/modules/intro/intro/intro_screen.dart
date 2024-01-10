
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/text_styles.dart';
import '../../../../core/routing/routes.dart';
import 'package:base_app/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/res/values_manager.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../component/component.dart';
import 'widgets/page_pop_view.dart';


class PageViewData {
  final String titleText;
  final String subText;
  final String assetsImage;

  PageViewData({
    required this.titleText,
    required this.subText,
    required this.assetsImage,
  });
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  List<PageViewData> _pageViewModelData = [];

  var _currentShowIndex = 0;

  @override
  void initState() {
     _pageController = PageController(initialPage: 0);
    _pageViewModelData = [
      PageViewData(titleText: LocaleKeys.introTitle1, subText: LocaleKeys.introDesc1, assetsImage:  Assets.introIntro1),
      PageViewData(titleText: LocaleKeys.introTitle2, subText: LocaleKeys.introDesc2, assetsImage:  Assets.introIntro2),
      PageViewData(titleText: LocaleKeys.introTitle3, subText: LocaleKeys.introDesc3, assetsImage:  Assets.introIntro3),

    ];


    super.initState();
  }
  _animateNext(){
      if ((_currentShowIndex) == 0) {
        _pageController.animateTo(MediaQuery.of(context).size.width, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if ((_currentShowIndex) == 1) {
        _pageController.animateTo(MediaQuery.of(context).size.width * 2, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if ((_currentShowIndex) == 2) {
        _pageController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);

      }

  }
  _animateBack(){
    if ((_currentShowIndex) == 0) {
      _pageController.animateTo(MediaQuery.of(context).size.width * 2, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    } else if ((_currentShowIndex) == 1) {
      _pageController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    } else if ((_currentShowIndex) == 2) {
      _pageController.animateTo(MediaQuery.of(context).size.width, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top,),
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  pageSnapping: true,
                  onPageChanged: (index) {
                    setState(() {_currentShowIndex = index;});
                  },
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    PagePopup(pageViewData: _pageViewModelData[0]),
                    PagePopup(pageViewData: _pageViewModelData[1]),
                    PagePopup(pageViewData: _pageViewModelData[2]),
                  ],
                ),
                Positioned(
                  right: kScreenPaddingNormal.r,
                  left: kScreenPaddingNormal.r,
                  top: kScreenPaddingNormal.r,

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(Assets.svgLogoWithoutText),

                      FloatingActionButton.extended(
                          elevation: 0,
                          backgroundColor: Theme.of(context).highlightColor,
                          onPressed: ()=> NavigationService.pushReplacement(Routes.authScreen),
                          label:  Text(tr(LocaleKeys.skip),style: const TextStyle().regularStyle().colorBlack())
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kScreenPaddingNormal.w),
            child: Row(
              children: [
                Expanded(
                  child: SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Theme.of(context).highlightColor,
                      dotHeight: 12.0,
                      dotWidth: 12.0,
                      spacing: 5.0,
                    ), // your preferred effect
                    onDotClicked: (index) {
                      // _animateTo(index: index==0?0:index-1);
                    },
                  ),
                ),
                Row(
                  children: [
                    if(_currentShowIndex > 0 )
                      FloatingActionButton(
                        elevation: 0,
                        heroTag: 'back',

                        backgroundColor: Theme.of(context).highlightColor,
                        onPressed: () {
                          _animateBack();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child:  Icon(Icons.arrow_back_ios,size: 12.r,color: Colors.black),
                        ),
                      ),
                    HorizontalSpace(kFormPaddingAllLarge.w),
                    if(_currentShowIndex != _pageViewModelData.length-1 )...[
                      FloatingActionButton(
                        heroTag: 'next',
                        elevation: 0,
                        backgroundColor: Theme.of(context).highlightColor,
                        onPressed: () => _animateNext(),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child:  Icon(Icons.arrow_forward_ios,size: 12.r,color: Colors.black),
                        ),
                      ),
                    ]else...[
                      FloatingActionButton.extended(
                          heroTag: 'start',

                          elevation: 0,

                          backgroundColor: Theme.of(context).primaryColor,
                          onPressed: ()=> NavigationService.pushReplacement(Routes.authScreen),
                        label:  Text(tr(LocaleKeys.start),style: const TextStyle().regularStyle().colorWhite())
                      ),
                    ]

                  ],
                ),

              ],
            ),
          ),
          VerticalSpace(kScreenPaddingNormal.h)
        ],
      ),
    );
  }

/*  int _goBack() {
    int index = 0;
    if (_currentShowIndex == 0) {
      index = _pageViewModelData.length - 1;
    } else {
      index = currentShowIndex+1;
    }
    return index ;
  }*/
}
