import 'package:base_app/core/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';


class SelectMapType extends StatelessWidget {
  final num _lat;
  final num _long;

  const SelectMapType({
    super.key,
    required num lat,
    required num long,
  })  : _lat = lat,
        _long = long;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(kFormRadius)),
          color: Theme.of(context).cardColor),
      // height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('اي تطبيق تريد استخدامه', style: const TextStyle().titleStyle(fontSize: 14).colorBlack()),
          ),
          const SizedBox(height: 16),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()=>_launchGoogleMap(),
              child: Text('جوجل ماب', style: const TextStyle().regularStyle().colorBlack()),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()=>_launchAppleMap(),
              child: Text('ابل ماب', style: const TextStyle().regularStyle().colorBlack()),
              ),
            ),
          const SizedBox(height: 30),

        ],
      ),
    );
  }

  void _launchGoogleMap() async {
    Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$_lat,$_long');


    if (await MapLauncher.isMapAvailable(MapType.google)??false) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(double.parse(_lat.toString()), double.parse(_long.toString())),
        title: "الصالونات",
      );
    }else{
      await launchUrl(Uri.parse('https://apps.apple.com/us/app/google-maps/id585027354'));
    }


  }

  void _launchAppleMap() async {
    Uri url = Uri.parse('https://maps.apple.com/?sll=$_lat,$_long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      await launchUrl(Uri.parse('https://apps.apple.com/us/app/google-maps/id585027354'));
    }
  }


}

showSelectMapType(BuildContext context, {num lat = 47.6, num long = -122.3}) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SelectMapType(lat: lat, long: long);
      });
}
