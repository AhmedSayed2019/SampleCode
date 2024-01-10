
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/component.dart';
import 'layout_view_model.dart';
import 'navigation_tabs.dart';

class CustomerLayoutScreen extends StatefulWidget {
  final int? _currentPage;
  const CustomerLayoutScreen({Key? key,
    required int? currentPage,
  }) : _currentPage = currentPage, super(key: key);
  @override
  State<CustomerLayoutScreen> createState() => _CustomerLayoutScreenState();
}
class _CustomerLayoutScreenState extends State<CustomerLayoutScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CustomerLayoutViewModel>(context, listen: false).init(widget._currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final CustomerLayoutViewModel viewModel = Provider.of<CustomerLayoutViewModel>(context);
    return Scaffold(
      body: WillPopScope(child: kCustomerTabs[viewModel.currentIndex].initialRoute,
        onWillPop: () async {
          if (viewModel.currentIndex != 0) {
            viewModel.setCurrentIndex(0);
            return true;
          } else {
            return true ;
          }
        },
      ),

      bottomNavigationBar: BottomNavigationBarWidget(
        onTap: viewModel.setCurrentIndex,
        currentIndex: viewModel.currentIndex,
        tabs: kCustomerTabs,
      ),

    );
  }
}

