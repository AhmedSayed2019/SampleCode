import 'dart:io';

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




}
