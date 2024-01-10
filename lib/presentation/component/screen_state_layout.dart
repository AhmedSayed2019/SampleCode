import 'package:flutter/material.dart';
import 'package:base_app/data/datasource/remote/exception/error_widget.dart';

import 'component.dart';

class ScreenStateLayout extends StatelessWidget {
  final bool _isEmpty;
  final bool _isLoading;
  final ErrorModel? _error;
  final WidgetBuilder? _errorBuilder;
  final WidgetBuilder? _loadingBuilder;
  final VoidCallback? _onRetry;
  final WidgetBuilder _builder ;
  final WidgetBuilder? _noDataBuilder ;

  const ScreenStateLayout({Key? key,
    required  WidgetBuilder builder,
    bool isEmpty = false,
    ErrorModel? error,
    bool isLoading = false,
    WidgetBuilder? errorBuilder,
    WidgetBuilder? loadingBuilder,
    WidgetBuilder? noDataBuilder,
    VoidCallback? onRetry,
  })
      :_isEmpty = isEmpty,_isLoading = isLoading,_error= error,
        _errorBuilder = errorBuilder,
        _loadingBuilder = loadingBuilder,
        _noDataBuilder = noDataBuilder,
        _builder = builder,
        _onRetry = onRetry, super(key: key);

  @override
  Widget build(BuildContext context) {
    return  _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    if (_isLoading) {
      return _loadingBuilder!=null? _loadingBuilder!(context):const Center(child: CustomLoadingSpinner());
    }   else if(_error != null){
      return _errorBuilder!=null? _errorBuilder!(context): ErrorLayout(errorModel: _error, onRetry: _onRetry,);
    } else if(_isEmpty){
      return _noDataBuilder!=null? _noDataBuilder!(context): const NoDataScreen();

    } else{
      return _builder(context);
    }

  }
}
