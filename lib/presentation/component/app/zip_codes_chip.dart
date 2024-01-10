
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../../core/res/resources.dart';


class ZipCodesChip extends StatefulWidget {

  final List<String> _list;
  final List<String> _selectedList;
  final ValueChanged<String> _onRemoveSelected;



  @override
  State<ZipCodesChip> createState() => _ZipCodesChipState();


  const ZipCodesChip({super.key,
    required List<String> list,
    required List<String> selectedList,
    required ValueChanged<String> onRemoveSelected,
  })
      :
        _list = list,
        _selectedList = selectedList,
        _onRemoveSelected = onRemoveSelected;
}

class _ZipCodesChipState extends State<ZipCodesChip> {

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          padding: EdgeInsets.all(kFormPaddingAllSmall.w),

          child: Wrap(
            spacing: 5.0,
            children:  widget._list.map((tag) => _getChip(context,tag)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _getChip(BuildContext context,String zipCode) {
    bool isSelected = widget._selectedList.where((element) => element == zipCode).isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kFormPaddingAllSmall.w),
      child: FilterChip(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall))),
        selected: isSelected,
        backgroundColor:Theme.of(context).hoverColor,
        selectedColor: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).hintColor,

        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(zipCode, style: const TextStyle().regularStyle(fontSize: 12).customColor( Colors.white)),
            HorizontalSpace(kFormPaddingAllLarge.w),
            Container(
              width: 20.r,
              height: 20.r,
              decoration:const BoxDecoration(shape: BoxShape.circle, color: Colors.white),

              child: Icon(isSelected ? Icons.close : Icons.done, size: 16.r,color: Theme.of(context).hoverColor),
            ),
          ],
        ),
        // label: Center(child: Text(children.title, style: const TextStyle().descriptionStyle().customColor(isSelected ? Colors.white : Colors.black)),),
        elevation: 1,
        showCheckmark: false,
        onSelected: (bool value) {
          setState(() {
            widget._onRemoveSelected(zipCode);
          });
        },
      ),
    );
  }

}
