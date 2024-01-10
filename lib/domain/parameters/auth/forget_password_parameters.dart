import 'package:base_app/presentation/component/inputs/country/countries.dart';

import '../../../../core/utils/constants.dart';

class ForgetPasswordParameters {
  String? _mobile;
  Country _mobileCountry;
  String? _password;
  String? _otp;
  final String? _deviceToken;
  final CheckOTPType _checkOTPType;
  UserType _userType;

  ForgetPasswordParameters({
   String? mobile,
   String? password,
   String? deviceToken,
   String? otp,
   Country mobileCountry = Constants.initMobileCountry,
    required UserType userType,
    required CheckOTPType checkOTPType,
  })  : _checkOTPType = checkOTPType,
        _otp = otp,
        _mobile = mobile,
        _mobileCountry = mobileCountry,
        _password = password,
        _userType = userType,
        _deviceToken = deviceToken;
  void setMobileCountry(Country mobileCountry) => _mobileCountry = mobileCountry;

  String? get deviceToken => _deviceToken;

  String? get password => _password;

  String? get mobile => _mobile;

  String? get otp => _otp;

  CheckOTPType get checkOTPType => _checkOTPType;

  UserType get userType => _userType;
  Country get mobileCountry => _mobileCountry;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = _mobile;
    // data['mobile'] = _mobile;
    data['mobile_code'] = _mobileCountry.code;

    if (_otp != null) data['otp_code'] = _otp;
    return data;
  }


  Map<String, dynamic> toResetPasswordJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['password'] = _password;
    data['password_confirmation'] = _password;

    return data;
  }





  setMobile( String mobile) {
    _mobile = mobile;
  }

  setOtp(String otp) {
    _otp = otp;
  }

  setPassword({required String password}) {
    _password = password;
  }

  setUserType(UserType userType) {
    _userType = userType;
  }



  copyWith(String mobile) =>
      ForgetPasswordParameters(mobile: '+${_mobileCountry.dialCode}${_mobile}',
          password: _password,
          deviceToken: _deviceToken,
          otp: _otp,
          mobileCountry: _mobileCountry,
          userType: _userType,
          checkOTPType: _checkOTPType);

}
