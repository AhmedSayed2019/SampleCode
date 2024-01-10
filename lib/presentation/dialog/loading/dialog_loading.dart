import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DialogLoading extends StatelessWidget {

  final String _message;

  const DialogLoading({super.key,
    required String message,
  }) : _message = message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 8),
      child: Column(
        children: [
          SpinKitPulse(color: Theme.of(context).primaryColor , size: 70),
          VerticalSpace(kFormPaddingAllLarge.h),
          Text(_message, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16)),
        ],
      ),
    );
  }


}
