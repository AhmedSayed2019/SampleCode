// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class GoogleMapSearch extends StatefulWidget {
//   const GoogleMapSearch({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleMapSearch> createState() => _GoogleMapSearchState();
// }
//
// class _GoogleMapSearchState extends State<GoogleMapSearch> {
//   final LayerLink _layerLink = LayerLink();
//
//   @override
//   Widget build(BuildContext context) {
//     RenderBox renderBox = context.findRenderObject() as RenderBox;
//     var size = renderBox.size;
//     var offset = renderBox.localToGlobal(Offset.zero);
//
//     return CompositedTransformFollower(
//       link: _layerLink,
//       offset: Offset(0.0, size.height + 5.0),
//     );
//   }
//   OverlayEntry? _createOverlayEntry() {
//     if (context != null && context.findRenderObject() != null) {
//       RenderBox renderBox = context.findRenderObject() as RenderBox;
//       var size = renderBox.size;
//       var offset = renderBox.localToGlobal(Offset.zero);
//       return OverlayEntry(
//           builder: (context) => Positioned(
//             left: offset.dx,
//             top: size.height + offset.dy,
//             width: size.width,
//             child: CompositedTransformFollower(
//               showWhenUnlinked: false,
//               link: _layerLink,
//               offset: Offset(0.0, size.height + 5.0),
//               child: Material(
//                   elevation: 1.0,
//                   child: ListView.builder(
//                     padding: EdgeInsets.zero,
//                     shrinkWrap: true,
//                     itemCount: alPredictions.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return InkWell(
//                         onTap: () {
//                           if (index < alPredictions.length) {
//                             widget.itmClick!(alPredictions[index]);
//                             if (!widget.isLatLngRequired) return;
//
//                             getPlaceDetailsFromPlaceId(
//                                 alPredictions[index]);
//
//                             removeOverlay();
//                           }
//                         },
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             child: Text(alPredictions[index].description!)),
//                       );
//                     },
//                   )),
//             ),
//           ));
//     }
//   }
//
// }
