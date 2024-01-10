import 'package:base_app/domain/logger.dart';
import 'package:flutter/material.dart';

import '../component.dart';

class PaginationListView<T> extends StatefulWidget {
  final VoidCallback _onLoadMore;

  final bool _isLoading;
  final bool _isMoreLoading;
  final List<Widget>? _slivers;
  final List<T> _list;
  final int _currentPage;
  final bool _hasMorePages;
 final NullableIndexedWidgetBuilder _builder;

  @override
  _PaginationListViewState createState() => _PaginationListViewState();

  const PaginationListView({Key? key,
    required VoidCallback onLoadMore,
    required bool isMoreLoading,
     bool isLoading=false,
    List<Widget>? slivers,
    required List<T> list,
    required int currentPage,
    required bool hasMorePages,
    required NullableIndexedWidgetBuilder builder,
  })  : _onLoadMore = onLoadMore,
        _isMoreLoading = isMoreLoading,
        _isLoading = isLoading,
        _slivers = slivers,
        _list = list,
        _currentPage = currentPage,
        _hasMorePages = hasMorePages,
        _builder = builder, super(key: key);
}

class _PaginationListViewState extends State<PaginationListView> {
  final ScrollController _scrollController =  ScrollController();


  @override
  void dispose() {
    super.dispose();

    _scrollController.removeListener(() {});
  }

  @override
  void initState() {
    super.initState();

    if (!widget._hasMorePages) {
      log('PaginationListView', 'removeListener');
      _scrollController.removeListener(() {});
    }

    _scrollController.addListener(() {
      // Listening while at the bottom of the page
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent-50 && !widget._isMoreLoading && !widget._isLoading && widget._hasMorePages) {
      // if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && ! widget._isLoading && !_scrollController.position.outOfRange &&  widget._hasMorePages) {
        widget._onLoadMore();
      }
    });
    // _scrollController.addListener(() {
    //   // Listening while at the bottom of the page
    //   if (_scrollController.position.pixels >= (_scrollController.position.maxScrollExtent-150.h) &&! widget._isLoading&&
    //   // if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
    //       !_scrollController.position.outOfRange && widget._currentPage <= widget._hasMorePages
    //   ) {
    //     widget._onLoadMore();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,

      slivers: [
        if (widget._slivers != null)...widget._slivers!,

        if(widget._isLoading)...[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            leadingWidth: 0,
            elevation: 0.0,
            leading: const SizedBox(),
            expandedHeight: 100.0,
            backgroundColor: Theme.of(context).backgroundColor,
            flexibleSpace:  const CustomLoadingSpinner(),
          ),

        ]else...[
          SliverList(delegate: SliverChildBuilderDelegate(widget._builder, childCount: widget._list.length),),
        ],


        SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
            child: Center(
              child: !widget._isLoading &&widget._isMoreLoading
                  ? const CustomLoadingSpinner(size: 20)
                  :  const SizedBox(height: 40.0),
            ),
          ),
        ),
      ],
    );
  }
}
