
import 'package:equatable/equatable.dart';

class DropDownEntity extends Equatable {
  final int _id;
  final String _title;
  final String? _image;
  final String? _key;



  @override
  List<Object> get props => [_id, _title];

  const DropDownEntity({
    required int id,
    required String title,
    String? image,
    String? key,
  })  : _id = id,
        _title = title,
        _key = key,
        _image = image;


  String? get image => _image;
  String? get key => _key;
  String get title => _title;
  int get id => _id;
}
