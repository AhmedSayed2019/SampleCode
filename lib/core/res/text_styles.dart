import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';


import 'resources.dart';
import 'color.dart';


extension TextCustom on TextStyle {

  TextStyle activeColor() => (this).copyWith(color: primaryColor);
  TextStyle customColor(Color? color) => (this).copyWith(color: color);
  TextStyle colorWhite() => (this).copyWith(color: Colors.white);
  TextStyle liteColor() => (this).copyWith(color: cardColor);
  TextStyle activeLiteColor() => (this).copyWith(color: primaryColorLight);
  TextStyle errorStyle() => (this).copyWith(color: errorColor);
  TextStyle colorHint() => (this).copyWith(color: hintColor);
  TextStyle colorHintLiteColor() => (this).copyWith(color: highlightColor);
  TextStyle colorHover() => (this).copyWith(color: hoverColor);
  TextStyle textFamily({String? fontFamily} ) => (this).copyWith(fontFamily: fontFamily);
  TextStyle darkTextStyle() => (this).copyWith(color: textPrimaryDark);
  TextStyle boldActiveStyle() => (this).copyWith(fontWeight: FontWeight.bold,color: primaryColor);
  TextStyle boldStyle() => (this).copyWith(fontWeight: FontWeight.bold);
  TextStyle boldBlackStyle() => (this).copyWith(fontWeight: FontWeight.bold,color: Colors.black);
  TextStyle heavyBlackStyle() => (this).copyWith(fontWeight: FontWeight.w800,color: Colors.black);
  TextStyle boldWhiteStyle() => (this).copyWith(fontWeight: FontWeight.bold,color: Colors.white);
  TextStyle heavyWhiteStyle() => (this).copyWith(fontWeight: FontWeight.w800,color: Colors.white);
  TextStyle italic() => (this).copyWith(fontStyle: FontStyle.italic);
  TextStyle boldLiteStyle() => (this).copyWith(fontWeight: FontWeight.w500);
  TextStyle colorBlack() => (this).copyWith(color: Colors.black);
  TextStyle greenStyle() => (this).copyWith(color: Colors.green);
  TextStyle underLineStyle() => (this).copyWith(decoration: TextDecoration.underline);
  TextStyle ellipsisStyle({int line = 1}) => (this).copyWith( overflow: TextOverflow.ellipsis,);
  TextStyle heightStyle({double height = 1}) => (this).copyWith( height: height);


  TextStyle semiBoldStyle({double fontSize = 14}) => (this).copyWith( fontSize: fontSize.sp,fontWeight: FontWeight.w600,);



  TextStyle titleStyle({double fontSize = 15}) => (this).copyWith(fontSize: fontSize.sp, color: Colors.black, fontWeight: FontWeight.w700, fontFamily: FontConstants.fontFamily );
  TextStyle regularStyle({double fontSize = 14}) => (this).copyWith(fontSize: fontSize.sp, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: FontConstants.fontFamily );
  TextStyle descriptionStyle({double fontSize = 10}) => (this).copyWith(fontSize: fontSize.sp, color: hintColor, fontWeight: FontWeight.w300, fontFamily: FontConstants.fontFamily );


}
