// import 'package:base_app/core/utils/constants.dart';
//
// import '../../../component/inputs/country/countries.dart';
//
//
// class ContractorRegisterParameters {
//   String? _companyName;
//   String? _mobile;
//   String? _email;
//   String? _image;
//   String? _password;
//   Country _mobileCountry;
//   bool _isConfirmTerms;
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     (_companyName ?? '').isNotEmpty ? data['company_name'] = _companyName : null;
//     (_email ?? '').isNotEmpty ? data['email'] = _email : null;
//     (_password ?? '').isNotEmpty ? data['password'] = _password : null;
//     (_mobile ?? '').isNotEmpty ? data['phone'] = _mobile : null;
//
//
//     data["phone_code"] = (_mobileCountry.dialCode);
//     data["phone_country"] = (_mobileCountry.code);
//
//
//     return data;
//   }
//
//   void setData(
//       {required String companyName,
//       required String password,
//       required String mobile,
//       required String email}) {
//     _companyName = companyName;
//     _password = password;
//     _mobile = mobile;
//     _email = email;
//   }
//
//
//
//
//
//   void setImage({required String path}) => _image = path;
//
//   void setIsConfirmTerms({required bool isConfirmTerms}) =>
//       _isConfirmTerms = isConfirmTerms;
//
//   void setMobileCountry(Country mobileCountry) {_mobileCountry = mobileCountry;}
//
//
//
//
//   Country get mobileCountry => _mobileCountry;
//
//
//   String? get image => _image;
//
//   String? get email => _email;
//
//   String? get phone => _mobile;
//
//
//
//   String? get companyName => _companyName;
//
//   bool get isConfirmTerms => _isConfirmTerms;
//
//   String? get password => _password;
//
//   ContractorRegisterParameters({
//     String companyName = '',
//     String? mobile,
//     String? password,
//     String? email,
//     String? image,
//     bool isConfirmTerms = false,
//     Country mobileCountry = Constants.initmobileCountry,
//   })  : _companyName = companyName,
//         _mobile = mobile,
//         _isConfirmTerms = isConfirmTerms,
//         _email = email,
//         _image = image,
//         _password = password,
//         _mobileCountry = mobileCountry;
// }
