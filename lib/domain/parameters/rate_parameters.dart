
import '../../core/utils/globals.dart';

class RateParameters {
  final int _userId;
  double _rate;
  String _comment;

  RateParameters({
    required int userId,
    double rate =1,
    String comment ='',
  })  : _userId = userId,
        _rate = rate,
        _comment = comment;


  setRate(double rate)=>_rate = rate;
  setComment(String comment)=>_comment = comment;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = _userId;
    data['rate'] = _rate.toInt();
    data['comment'] = _comment;
    data['type'] = kIsCustomer?'contractor':'customer';
    return data;
  }

}
