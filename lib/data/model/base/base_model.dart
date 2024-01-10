class BaseModel<E> {
 final bool _status;
 final String _code;
 final dynamic _message;
 final E? _responseData;
 final Map<String, dynamic>  _response;

 factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
      // status: (json['status']??'200')=='success',
      status: ((json['code']??'200').toString() == '200')||((json['code']??'201').toString() == '201'),
      code: (json['status']??'success').toString(),
      message: json['message']??"Error",
      responseData: json['data'], response: json
 );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['success'] = status;
  //   data['message'] = message;
  //   data['code'] = code;
  //   data['data'] = responseData??{};
  //   return data;
  // }

 const BaseModel({
    required bool status,
    required String code,
    required dynamic message,
    required E? responseData,
    required Map<String, dynamic> response,
  })  : _status = status,
        _code = code,
        _message = message,
        _responseData = responseData,
        _response = response;

 Map<String, dynamic> get response => _response;

  E? get responseData => _responseData;

  dynamic get message => _message;

  String get code => _code;

  bool get status => _status;
}
