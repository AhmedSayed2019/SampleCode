
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../../core/res/resources.dart';


class CustomChipRow extends StatefulWidget {
  final bool isMultipleSelection;
  final bool canBeNull;

  final List<String> list;
  final String? selected;
  final ValueChanged<String>? onSelected;
  final ValueChanged<List<String>>? onSelectedList;

  const CustomChipRow(
      {Key? key,
      this.isMultipleSelection = false,
      this.canBeNull = true,
      required this.list,
      this.onSelected,
      this.selected,
      this.onSelectedList})
      : super(key: key);

  @override
  State<CustomChipRow> createState() => _CustomChipRowState();
}

class _CustomChipRowState extends State<CustomChipRow> {
  var selectedTags = []; //["love", "me", "summer"];

  @override
  void initState() {
    super.initState();

    if (widget.selected != null) {
      selectedTags = [widget.selected];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [..._generateTags()],
      ),
    );
  }

  List<Widget> _generateTags()=> widget.list.map((tag) => _getChip(tag)).toList();


Widget _getChip(String children) {bool isSelected = !widget.canBeNull && selectedTags.isEmpty ? widget.list[0] == children : selectedTags.contains(children);
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
            if (widget.isMultipleSelection) {
              if (value) {
                selectedTags.add(children);
              } else {
                selectedTags.remove(children);
              }
            } else {
              selectedTags = [children];
              widget.onSelected!(children);
            }
          });
        },
      ),
    );
  }
}
