
class AddressParameters {
 final int? _id;
  final String? _name;
  final String? _placeId;
  String? _address;
  String? _zipCode;
  double? _latitude;
  double? _longitude;
  String? _city;
  String? _state;



 setLocation({String? address, String? city, String? zipCode, String? state, double? latitude, double? longitude}){
   _city=city;
   _state=state;
   _address=address;
   _latitude=latitude;
   _zipCode=zipCode;
   _longitude=longitude;
 }
  AddressParameters({
    int? id,
    String? placeId,
    String? name,
    String? zipCode,
    String? address,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
  })  : _id = id,
        _placeId = placeId,
        _city = city,
        _zipCode = zipCode,
        _state = state,
        _name = name,
        _address = address,
        _latitude = latitude,
        _longitude = longitude;

 double? get longitude => _longitude;

  double? get latitude => _latitude;

  String? get zipCode => _zipCode;
  String? get address => _address;

  String? get name => _name;
  String? get placeId => _placeId;

  int? get id => _id;

 String? get state => _state;

  String? get city => _city;
}
