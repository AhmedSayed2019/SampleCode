/*

import 'dart:convert';

class BaseListModel<T> {

  const BaseListModel({
    required List<KaizenModel> kaizenList,
    required int totalCount,
  })  : _kaizenList = kaizenList,
        _totalCount = totalCount;
  final List<KaizenModel> _kaizenList;
  final int _totalCount;


  List<KaizenModel> get kaizenList => _kaizenList;

  factory BaseListModel.fromRawJson(String str) => BaseListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseListModel.fromJson(Map<String, dynamic> json) => BaseListModel(
    kaizenList: List<KaizenModel>.from(json["dataList"].map((x) => KaizenModel.fromJson(x))),
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "dataList": List<KaizenModel>.from(_kaizenList.map((x) => x.toJson())),
    "totalCount": _totalCount,
  };

  int get totalCount => _totalCount;
}

*/
