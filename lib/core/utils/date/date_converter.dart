import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import '../../../app.dart';
import '../../../domain/logger.dart';

class DateConverter {
  static const  String _locale ='en';

  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
    // return DateFormat('dd MMM yyyy').format(dateTime);
  }
  static DateTime isoStringToLocalDateWithOutTimer(String? dateTime) {
    if(dateTime == null){return DateTime.now();}
    try{
      return DateFormat('yyyy-MM-dd HH:mm:ss',_locale).parse(dateTime).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }

  static String slotDate(DateTime dateTime) {
    String date = DateFormat('MM-dd-yyyy',_locale).format(dateTime);
    return date;
  }

  static String slotDateCalender(DateTime? dateTime) {
    if(dateTime ==null)return'';
    String date = DateFormat('yyyy-MM-dd',_locale).format(dateTime);
    return date;
  }

  static String slotDateAPI(String myDate) {
    DateTime datetime = DateFormat('MM-dd-yyyy',_locale).parse(myDate).toLocal();

    String date = DateFormat('yyyy-MM-dd',_locale).format(datetime);

    return date;
  }
  static DateTime fromAPIToDate(String myDate) {
    DateTime datetime = DateFormat('MM-dd-yyyy',_locale).parse(myDate).toLocal();

    return datetime;
  }

  static DateTime slotStringToLocalDate(String dateTime) {
    return DateFormat('yyyy/MM/dd',_locale).parse(dateTime, true);
  }

  static DateTime convertStringToDatetime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    }
    return DateFormat("yyyy/MM/dd",_locale).parse(dateTime);
  }

  static String isoStringToDateToDomain (String? dateTime) {
     try{
       DateTime date=isoStringToLocalDate(dateTime);
       return  DateFormat('yyyy-MM-dd',_locale).format(date);
     }catch(e){
       return  DateFormat('yyyy-MM-dd',_locale).format(DateTime.now());
     }
    // return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }


  static DateTime isoStringToLocalDate(String? dateTime) {
    if(dateTime == null){return DateTime.now();}
    try{
      return DateFormat('yyyy-mm-ddThh:mm:ss',_locale).parse(dateTime).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }

  static DateTime isoStringToLocalDateCalenderView(String? dateTime,DateTime lastDate) {
    if(dateTime == null){return DateTime.now();}
    try{
      return DateFormat('yyyy-mm-ddThh:mm:ss',_locale).parse(dateTime).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }


  static DateTime isoStringToLocalDateTime({String? date , String? time}) {
    if(date == null|| time == null )return DateTime.now();
    String dateTime = '${date}T$time';
    try{
      return DateFormat('yyyy-mm-ddTHH:mm:ss',_locale).parse(dateTime).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }


  // 2022-01-01T00:00:00
  static String convertDateDomainData(String? dateTime) {
    if (dateTime == null) {
      return "";
    }
    String date = '';
    try {
      date = DateFormat('yyyy-MM-dd',_locale).format(DateFormat('yyyy-mm-ddThh:mm:ss',_locale).parse(dateTime, true).toLocal());
    } catch(e) {
      date = '';
    }
    return date;
  }

  static String isoStringToLocalTimeTimeOnly(String dateTime) {
    return DateFormat('HH:mm a')
        .format(DateFormat('HH:mm',_locale).parse(dateTime, true).toLocal());
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalTimeWithAMPMOnly(String dateTime) {
    return DateFormat('hh:mm a',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalTimeWithAMPMOnlyDate(DateTime dateTime) {
    return DateFormat('hh:mm a',_locale).format(dateTime);
  }

  static String isoStringToLocalTimeWithAmPmAndDay(String dateTime) {
    return DateFormat('hh:mm a, EEE',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String stringToStringTime(String dateTime) {
    DateTime inputDate = DateFormat('HH:mm:ss').parse(dateTime);
    return DateFormat('hh:mm a').format(inputDate);
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String localDateFromDateToIsoString(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('dd MMM hh aa',_locale).format(dateTime);
  }

  static String localDateFromToIsoString(String? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('dd MMM hh aa',_locale)
        .format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String isoDayWithDateString(String dateTime) {
    return DateFormat('EEE, MMM d, yyyy')
        .format(isoStringToLocalDate(dateTime));
  }

  static String convertTimeRange(String start, String end) {
    DateTime startTime = DateFormat('HH:mm:ss').parse(start);
    DateTime endTime = DateFormat('HH:mm:ss').parse(end);
    return '${DateFormat('hh:mm aa',_locale).format(startTime)} - ${DateFormat('hh:mm aa',_locale).format(endTime)}';
  }

  static String stringTimeToDateTime(String time) {
    log('stringTimeToDateTime', time.toString());

    DateTime startTime = DateFormat('HH:mm a').parse(time);

    log('stringTimeToDateTime', startTime.toString());
    return DateFormat('HH:mm:ss').format(startTime);
  }


  // static String dateTimeToTimeString(DateTime dateTime) {
  //
  //   // DateTime startTime = DateFormat('HH:mm a').parse(time);
  //
  //   log('stringTimeToDateTime', startTime.toString());
  //   return DateFormat('HH:mm:ss').format(startTime);
  // }

  static String stringTimeToDateTime1(String time) {
    // log('stringTimeToDateTime', time.toString());
    // try{
    //   DateTime dateTime=  DateFormat('hh:mm',_locale).parse(time);
    //
    // }catch(e){
    //   log('stringTimeToDateTime', e.toString());
    //
    // }
    log('stringTimeToDateTime', time.toString());
    DateTime dateTime= DateFormat('HH:mm',_locale).parse(time);
    String hour ='${dateTime.hour}';
    String minute ='${dateTime.minute}';

      if(dateTime.hour<9){ hour ='0${dateTime.hour}';}
      if(dateTime.minute<9){ minute ='0${dateTime.minute}';}

      String myTime = '$hour:$minute:00';
    log('stringTimeToDateTime', dateTime.toString());
    return myTime.toString();
  }

  static TimeOfDay formatTimeFromStringToTimeOfDay(String? time) {
    if((time??'').isEmpty)return TimeOfDay.now();
    try{
      DateTime dateTime= DateFormat('hh:mm a',_locale).parse(time!);
      log('formatTimeFromStringToTimeOfDay', dateTime.toString());

      return TimeOfDay.fromDateTime(dateTime);
    }catch(e){
      log('formatTimeFromStringToTimeOfDay', e.toString());
      return TimeOfDay.now();
    }
  }


}
