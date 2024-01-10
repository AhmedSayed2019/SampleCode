import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../core/res/resources.dart';

class CustomHtmlViewerWidget extends StatelessWidget {
  final String _data;

  const CustomHtmlViewerWidget({super.key,
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    String data ='';
    if(_data.isNotEmpty) {
      data = _data.replaceAll('href=', 'target="_blank" href=');
    }


    return Center(
      child: SizedBox(
        width: 1170,
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
          padding: EdgeInsets.all(kFormPaddingAllSmall.r),
          physics: const BouncingScrollPhysics(),
          child: HtmlWidget(
            data,
            key: Key('ss'.toString()),
            textStyle: const TextStyle().regularStyle().colorBlack(),

          ),
        ),
      ),
    );
  }


}
