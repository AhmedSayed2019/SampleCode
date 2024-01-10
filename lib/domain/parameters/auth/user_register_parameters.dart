import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/logger.dart';



class RegisterParameters {
  String? _image;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _birthDate;
  String? _about;
  String? _password;
  int _salary;
  GenderEnum _gender;
  DependencyEntity? _userType;
   List<DependencyEntity> _skills;
  final List<DependencyEntity> _socialMedia;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (_firstName ?? '').isNotEmpty ? data['first_name'] = _firstName : null;
    (_lastName ?? '').isNotEmpty ? data['last_name'] = _lastName : null;
    (_about ?? '').isNotEmpty ? data['about'] = _about : null;//اقل حاجه 10 حروف
    (_email ?? '').isNotEmpty ? data['email'] = _email : null;
    (_password ?? '').isNotEmpty ? data['password'] = _password : null;
    (_password ?? '').isNotEmpty ? data['password_confirmation'] = _password : null;
    (_birthDate ?? '').isNotEmpty ? data['birth_date'] = _birthDate : null;//update format
    if( _userType!=null) data['type'] = _userType!.id ;
     data['salary'] = _salary ;
    log('RegisterParameters', _socialMedia.length.toString());

    if(_skills.isNotEmpty)  data['tags[]'] = _skills.map((e) => e.id).toList();
    if(_socialMedia.isNotEmpty)  data['favorite_social_media[]'] = _socialMedia.map((e) => e.id).toList();


    data["gender"] = _gender==GenderEnum.male?0:1;


    return data;
  }



  void setUserType(DependencyEntity userType) => _userType = userType;
  void setUserTags(DependencyEntity userType) => _userType = userType;
  void setSalary(int salary) => _salary = salary;
  void setGender(GenderEnum gender) => _gender = gender;
  void setImage(String image) => _image = image;
  void setSkills(List<DependencyEntity> skills) => _skills = skills;


  setStepOneData({required String firstName,required String lastName,required String email,required String password}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
  }
  setStepTwoData({required String birthDate,required String about,}){
    _about = about;
    _birthDate = birthDate;

  }

  void updateSocialMedia(DependencyEntity socialMedia, isSelected) {
    if (isSelected) {
      _socialMedia.add(socialMedia);
    } else {
      _socialMedia.removeWhere((element) => element.id ==socialMedia.id);
    }
  }

  DependencyEntity? get userType => _userType;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get password => _password;
  String? get image => _image;
  String? get about => _about;
  String? get birthDate => _birthDate;
  int get salary => _salary;
  GenderEnum get gender => _gender;
  List<DependencyEntity> get skills => _skills;
  List<DependencyEntity> get socialMedia => _socialMedia;

  RegisterParameters({
    String firstName = '',
    String? image,
    int? salary,
    String? password,
    String? birthDate,
    String? about,
    String? email,
    GenderEnum? gender,
    DependencyEntity? userType,
    List<DependencyEntity>? skills,
    List<DependencyEntity>? socialMedia,
  })  : _firstName = firstName,
        _image = image,
        _birthDate = birthDate,
        _about = about,
        _salary = salary ?? 500,
        _skills = skills ?? [],
        _socialMedia = socialMedia ?? [],
        _gender = gender ?? GenderEnum.male,
        _email = email,
        _password = password,
        _userType = userType;
}
