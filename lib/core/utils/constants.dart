

import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/component/inputs/country/countries.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/app_urls/app_url.dart';

class Constants {
  static const String empty = "";
  static const int connectTimeout = 30000;
  static const String kGoogleMapKey = 'AIzaSyBBjDj68RPeZw7ma24Bexc8MNRmegxWEdk';
  // static const String kMap = 'AIzaSyBZ1qmUYusPS5lQIqR79svQOfUJgbqokyc';


  static const Country initMobileCountry =  Country(name: "United States", flag: "🇺🇸", code: "US", dialCode: "1", minLength: 10, maxLength: 10);

    static String getPaymentMethodLink({required int requestId ,required String type})=>'${AppURL.kBaseURL}orders/payment?order_id=$requestId&payment_type=$type';
}
double convertToDouble(var d) => d / 1 ;

String convertListToString(List<String?> list) =>list.join(',');


enum CheckOTPType { login , register , reset}
enum UserType { customer , contractor}
enum OfferType { featured , regular}
enum ContractorWorkTypes { roof , wall , site}
enum RequestStatusTypes { current , closed}
enum RequestStatusTypesEnum { newRequest , accepted , relisted , extended , ended , cancelled, closed}
enum ContractorProfilePages { main , address , links}
enum NotificationType { general ,offer,request}
enum GenderEnum{ male , female }



UserType getUserTypeByKey(String type){
  switch(type){
    case"customer": return UserType.customer;
    case"contractor": return UserType.contractor;
    default:return UserType.customer;
  }
}

NotificationType getNotificationTypeByKey(String type){
  switch(type){
    case"new_offer": return NotificationType.offer;
    case"new_bid_received":
    case"bid_cancellation":
    case"request_closed_by_time":
    case"request_closed_by_admin":
    case"request_remind_before_closed":
    case"new_request_added":
    case"request_cancelled":
    case"bid_accepted":
    case"bid_refused_or_rejected":
    case"request_extended":
    case"request_relisted": return NotificationType.request;
    default: return NotificationType.general;
  }
}
//1=new, 2=accepted, 3=relisted, 4=extended, 5=ended, 6=cancelled, 7=closed
String getRequestStatusName(int status){
  switch(status){
    case 1: return tr(LocaleKeys.newRequest);
    case 2: return tr(LocaleKeys.accepted);
    case 3: return tr(LocaleKeys.relisted);
    case 4: return tr(LocaleKeys.extended);
    case 5: return tr(LocaleKeys.ended);
    case 6: return tr(LocaleKeys.cancelled);
    case 7: return tr(LocaleKeys.closed);
    default:return '';
  }
}

Color getRequestStatusColor(int status){
  switch(status){
    case 1: return Colors.white;
    case 2: return Colors.green;
    case 3: return Colors.white;
    case 4: return Colors.white;
    case 5: return Colors.grey;
    case 6: return Colors.red;
    case 7: return Colors.black;
    default:return Colors.white;
  }
}
int getRequestStatusNumber(RequestStatusTypesEnum status){
  switch(status){
    case RequestStatusTypesEnum.newRequest: return 1;
    case RequestStatusTypesEnum.accepted: return 2;
    case RequestStatusTypesEnum.relisted: return 3;
    case RequestStatusTypesEnum.extended: return 4;
    case RequestStatusTypesEnum.ended: return 5;
    case RequestStatusTypesEnum.cancelled: return 6;
    case RequestStatusTypesEnum.closed: return 7;
  }
}
RequestStatusTypesEnum getRequestStatusKey(int status){
  switch(status){
    case  1: return RequestStatusTypesEnum.newRequest;
    case  2: return RequestStatusTypesEnum.accepted;
    case  3: return RequestStatusTypesEnum.relisted;
    case  4: return RequestStatusTypesEnum.extended;
    case  5: return RequestStatusTypesEnum.ended;
    case  6: return RequestStatusTypesEnum.cancelled;
    case  7: return RequestStatusTypesEnum.closed;
    default: return RequestStatusTypesEnum.newRequest;

  }
}

EdgeInsets kScreenPadding = EdgeInsets.all(kScreenPaddingNormal.r).copyWith(top: 0);

