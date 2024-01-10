
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../../core/res/resources.dart';


class CustomChip extends StatefulWidget {
  final bool _isMultipleSelection;
  final bool _canBeNull;

  final List<String> _list;
  final String? _selected;
  final ValueChanged<String>? _onSelected;
  final ValueChanged<List<String>>? _onSelectedList;


  @override
  State<CustomChip> createState() => _CustomChipState();


  const CustomChip({
    bool isMultipleSelection =false,
    bool canBeNull= true,
    required  List<String> list,
    String? selected,
    ValueChanged<String>? onSelected,
    ValueChanged<List<String>>? onSelectedList,
  })  : _isMultipleSelection = isMultipleSelection,
        _canBeNull = canBeNull,
        _list = list,
        _selected = selected,
        _onSelected = onSelected,
        _onSelectedList = onSelectedList;
}

class _CustomChipState extends State<CustomChip> {
  var selectedTags = []; //["love", "me", "summer"];

  @override
  void initState() {
    super.initState();

    if (widget._selected != null) {
      selectedTags = [widget._selected];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        width: deviceWidth,
        padding: EdgeInsets.all(kFormPaddingAllSmall.w),

        child: Wrap(
          spacing: 5.0,
          children:  widget._list.map((tag) => _getChip(tag)).toList(),
        ),
      ),
    );
  }



Widget _getChip(String children) {bool isSelected = !widget._canBeNull && selectedTags.isEmpty ? widget._list[0] == children : selectedTags.contains(children);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kFormPaddingAllSmall.w),
      child: FilterChip(
        padding: EdgeInsets.all(kFormPaddingAllLarge.w),

        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall))),
        selected: isSelected,
        backgroundColor: Theme.of(context).cardColor,
        selectedColor: Theme.of(context).primaryColor,
        disabledColor: hintColor,
        label: Center(child: Text(tr(children), style: const TextStyle().regularStyle().boldStyle().customColor(isSelected ? Colors.white : Colors.black)),),
        elevation: 2,
        showCheckmark: false,
        onSelected: (bool value) {
          setState(() {
            if (widget._isMultipleSelection) {
              if (value) {
                selectedTags.add(children);
              } else {
                selectedTags.remove(children);
              }
            } else {
              selectedTags = [children];
              widget._onSelected!(children);
            }
          });
        },
      ),
    );
  }
}
