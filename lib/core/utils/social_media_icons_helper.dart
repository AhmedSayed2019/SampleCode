import 'package:base_app/generated/assets.dart';

class SocialMediaIconsHelper{


 static String? getIcon(String key){
    switch(key.toLowerCase()){
      case 'x': return Assets.iconsTwitterIcon;
      case 'instagram': return Assets.iconsInstagramIcon;
      case 'facebook': return Assets.iconsFacebookIcon;
      case 'whatsapp': return Assets.iconsWhatsappIcon;
      default:return null;
    }
  }
}