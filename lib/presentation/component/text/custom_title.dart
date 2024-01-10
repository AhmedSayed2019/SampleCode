import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';



class CustomTitle extends StatelessWidget {
  final String _title;
  final GestureTapCallback? _onViewAllTap;
  final MainAxisAlignment _mainAxisAlignment;
  const CustomTitle({super.key,
    required String title,
    GestureTapCallback? onViewAllTap,
     MainAxisAlignment mainAxisAlignment=MainAxisAlignment.start,
  })  : _title = title,
        _onViewAllTap = onViewAllTap,
        _mainAxisAlignment = mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 12.h,
          width: 12.w,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: 4, color: Theme.of(context).primaryColor),
                  left: BorderSide(width: 4, color: Theme.of(context).primaryColor),
              ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(_title,
                  style: const TextStyle().titleStyle().ellipsisStyle().boldBlackStyle(),
                    maxLines: 1,
                ),
              ),
              if(_onViewAllTap!=null)
                GestureDetector(
                  onTap: _onViewAllTap ,
                  child: Row(
                    children: [
                      Text(
                        tr(LocaleKeys.viewAll),
                        style: const TextStyle().regularStyle(),
                        maxLines: 1,
                      ),
                      Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor,size: 16.r,)

                    ],
                  ),
                ),

            ],
          ),
        ),

      ],
    );
  }
}
