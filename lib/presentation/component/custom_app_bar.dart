import 'package:base_app/core/res/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:flutter/services.dart';

import '../../../core/res/values_manager.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final bool isBackButtonExist;
  final VoidCallback? onBackPress;
  // final IconData? icon;
  final bool showIcon;
  final Widget? titleWidget;
  final Widget? leading;
  final double height;
  final Color? color;

  final List<Widget>? actions;
  final Widget? logo;
  final bool isCenterTitle;
  final Widget? bottomWidget;
  final double bottomSize;
  final Color? bottomColor;
  final Widget? centerLogo;
  final double elevation;
  final IconData? iconBack;

  const CustomAppBar(
      {Key? key,
        this.title,
        this.titleWidget,
        this.centerLogo,
        this.elevation=0.0,
        this.titleColor,
        this.isBackButtonExist = true,
        this.isCenterTitle = false,
        this.showIcon = false,
        // this.icon,
        this.bottomWidget,
        this.bottomSize=20,
        this.leading,
        this.bottomColor,
        this.height=50,
        this.logo,
        this.color,
        this.actions,
        this.onBackPress,
        this.iconBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight((height + bottomSize ).h),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:  Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).primaryColorDark,
          systemNavigationBarIconBrightness:   Brightness.dark,
          systemNavigationBarDividerColor: Theme.of(context).primaryColor,
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true,
        ),
        backgroundColor:color??Theme.of(context).scaffoldBackgroundColor/* Colors.transparent*/,
        title: titleWidget??(title != null
            ? Text(title ?? '', style: const TextStyle().titleStyle(fontSize: 16).customColor(titleColor?? Colors.black))
            : centerLogo ?? const SizedBox.shrink()),
        centerTitle: isCenterTitle,
        leading:leading ?? (
            isBackButtonExist
                ? IconButton(icon: Icon(iconBack ?? Icons.arrow_back_ios, color:titleColor?? Colors.black), onPressed: onBackPress ?? () => Navigator.pop(context),)
                : const SizedBox()
        ),
        elevation:elevation ,
        leadingWidth: isBackButtonExist?null:0,

        bottomOpacity: 0.0,
        flexibleSpace: Container(decoration: BoxDecoration(color: color??Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: logo ?? const SizedBox()),

              if(bottomWidget!=null)
              Column(
                children: [
                  Container(
                    height:bottomSize.h,
                    width: deviceWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(kFormRadius),
                          topRight: Radius.circular(kFormRadius)),
                    ),
                    child: bottomWidget??const SizedBox.expand(),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: actions,
      ),
    );
  }
  @override
  Size get preferredSize => Size(double.maxFinite,(height + bottomSize ));
}
