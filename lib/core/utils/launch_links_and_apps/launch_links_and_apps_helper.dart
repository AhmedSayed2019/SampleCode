import 'dart:io';

import 'package:base_app/core/utils/launch_links_and_apps/select_map_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchHelper{

  static store() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId = Platform.isAndroid ? 'com.lynk.app' : '1636676175';
      final url = Uri.parse(Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId");
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static link({required String link}) async {
    var url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  static email({required String email}) async {
    var url = Uri.parse("mailto:$email");
    // var url = Uri.parse("mailto:<$email>?subject=<subject>&body=<body>");

    if (await canLaunchUrl(url)) {

      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }


  static whatsApp({required String phone}) async {
    var url = Uri.parse(Platform.isIOS ? "https://wa.me/$phone?text=${''}" : "whatsapp://send?phone=$phone&text=${''}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static phone({required String phone}) async {
    var url = Uri.parse("tel://$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }


  static maps(BuildContext context,{num? lat = 47.6, num? long = -122.3}) async {

    if( lat==null || long==null )return;
    if(Platform.isIOS){
      showSelectMapType(context,long: long,lat: lat);

    }else{
      var uri = Uri.parse("google.navigation:q=$lat,$long&mode=d");
      Uri appleUrl = Uri.parse('https://maps.apple.com/?sll=$lat,$long');
      Uri googleUrl = Uri.parse('https://www.google.com/maps/?api=1&query=$lat,$long');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else if (await canLaunchUrl(appleUrl)) {
        await launchUrl(appleUrl);
      } else if (await canLaunchUrl(googleUrl)) {
        await launchUrl(googleUrl);
      } else {
        throw 'Could not launch ${uri.toString()}';
      }
    }



/*
  var uri = "google.navigation:q=$lat,$long&mode=d";
  // var uri = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  // var uri = 'geo:$lat,$long';
  String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';


  if (await canLaunch(uri)) {
    await launch(uri);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else if (await canLaunch(appleUrl)) {
    await launch(appleUrl);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
  */

// }

  }


}



/*void launchMap(BuildContext context,{num? lat = 47.6, num? long = -122.3}) async {

  if( lat==null || long==null )return;
  if(Platform.isIOS){
    showSelectMapType(context);
    // final availableMaps = await MapLauncher.installedMaps;
    // await availableMaps.first.showMarker(coords: Coords(double.parse(lat.toString()), double.parse(long.toString())), title: "المركز",);

  }else{
    var uri = "google.navigation:q=$lat,$long&mode=d";
    // var uri = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    // var uri = 'geo:$lat,$long';
    String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(uri)) {
      await launch(uri);
      // if (await canLaunchUrl(uri)) {
      // await launchUrl(uri);
    } else if (await canLaunch(appleUrl)) {
      await launch(appleUrl);
      // if (await canLaunchUrl(uri)) {
      // await launchUrl(uri);
    } else if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
      // if (await canLaunchUrl(uri)) {
      // await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }



*//*
  var uri = "google.navigation:q=$lat,$long&mode=d";
  // var uri = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  // var uri = 'geo:$lat,$long';
  String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';


  if (await canLaunch(uri)) {
    await launch(uri);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else if (await canLaunch(appleUrl)) {
    await launch(appleUrl);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
  *//*

// }

}*/
/*void launchMap({num? lat = 47.6, num? long = -122.3}) async {
  var uri = Uri.parse("google.navigation:q=$lat,$long&mode=d");
  // var uri = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  // var uri = 'geo:$lat,$long';

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
    // if (await canLaunchUrl(uri)) {
    // await launchUrl(uri);
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}*/
