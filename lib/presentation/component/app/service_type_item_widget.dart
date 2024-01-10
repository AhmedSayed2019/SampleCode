import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class ServiceTypeItem extends StatefulWidget {
  final List<ContractorWorkTypes> _selectedItems;


  @override
  State<ServiceTypeItem> createState() => _ServiceTypeItemState();

  const ServiceTypeItem({super.key,
    required List<ContractorWorkTypes> selectedItems,
  }) : _selectedItems = selectedItems;
}

class _ServiceTypeItemState extends State<ServiceTypeItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
