import 'package:base_app/core/utils/constants.dart';

class RateFilterParameters {
  final int? _userId;
  int _page;
  final UserType _userType;

  setPage(int page) => _page = page;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(_userId != null)  data['item_id'] = _userId;
    data['type'] = _userType.name;
    data['page'] = _page;

    return data;
  }

  int get page => _page;

  int? get userId => _userId;

  RateFilterParameters({
    int? userId,
    int page = 1,
    required UserType userType ,
  })  : _page = page,_userType = userType,
        _userId = userId;
}
