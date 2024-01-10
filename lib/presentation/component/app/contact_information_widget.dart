import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/utils/launch_links_and_apps/launch_links_and_apps_helper.dart';
import 'package:base_app/presentation/component/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/assets.dart';

class ContactInformationWidget extends StatelessWidget {
  final String? _email;
  final String? _webSite;
  final String? _twitter;
  final String? _facebook;
  final String? _instagram;
  final String? _whatsapp;
  final LatLng? _mapLocation;
  final String? _phoneCall;

  const ContactInformationWidget({super.key,
     String? email,
     String? webSite,
     String? twitter,
     String? facebook,
     String? instagram,
     String? whatsapp,
     LatLng? mapLocation,
     String? phoneCall,
  })  : _webSite = webSite,_email = email,
        _twitter = twitter,
        _facebook = facebook,
        _instagram = instagram,
        _whatsapp = whatsapp,
        _mapLocation = mapLocation,
        _phoneCall = phoneCall;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if((_email??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.email(email: _email!),child: CustomSVGIcon(size: 30.r , Assets.iconsEmailLinkIcon)),),
        if((_webSite??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.link(link: _webSite!),child: CustomSVGIcon(size: 30.r , Assets.iconsWebSiteIcon)),),
        if((_twitter??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.link(link: _twitter!),child: CustomSVGIcon(size: 30.r , Assets.iconsTwitterIcon)),),
        if((_facebook??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.link(link: _facebook!),child: CustomSVGIcon(size: 30.r , Assets.iconsFacebookIcon)),),
        if((_instagram??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.link(link: _instagram!),child: Image.asset(height: 30.r ,width: 30.r , Assets.imagesInstagramIcon)),),
        if((_whatsapp??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.whatsApp(phone: _whatsapp!),child: CustomSVGIcon(size: 30.r , Assets.iconsWhatsappIcon)),),
        if((_mapLocation?.latitude ??0)!=0) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.maps(context,lat: _mapLocation?.latitude, long: _mapLocation?.longitude),child: CustomSVGIcon(size: 30.r , Assets.iconsMapLocationIcon)),),
        if((_phoneCall??'').isNotEmpty) Expanded(child: GestureDetector(onTap: ()=>LaunchHelper.phone(phone: _phoneCall!),child: CustomSVGIcon(size: 30.r , Assets.iconsPhoneCallIcon)),),
      ],
    );
  }
}
