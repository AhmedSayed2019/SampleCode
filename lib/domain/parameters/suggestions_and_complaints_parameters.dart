

class SuggestionsAndComplaintsParameters {
final String _name;
final String _mobile;
final String _reason;


  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "phone": _mobile,
      "reason": _reason ,
    };
  }

const SuggestionsAndComplaintsParameters({
    required String name,
    required String mobile,
    required String reason,
  })  : _name = name,
        _mobile = mobile,
        _reason = reason;
}
