import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {

  final int _id;
  final String _firstName;
  final String _lastName;
  final String _about;
  final List<DependencyEntity> _skills;
  final List<String> _favoriteSocialMedia;
  final int _salary;
  final String _email;
  final String _birthDate;
  final GenderEnum _gender;
  final DependencyEntity _userType;
  final String _avatar;









  @override
  List<Object> get props => [
    _firstName,
    _about,
    _skills,
    _favoriteSocialMedia,
    _salary,
    _birthDate,
    _gender,
    _userType,
    _email,
    _avatar,
    _lastName,

      ];




  const ProfileEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String about,
    required List<DependencyEntity> skills,
    required List<String> favoriteSocialMedia,
    required int salary,
    required String email,
    required String birthDate,
    required GenderEnum gender,
    required DependencyEntity userType,
    required String avatar,
  })
      : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _about = about,
        _skills = skills,
        _favoriteSocialMedia = favoriteSocialMedia,
        _salary = salary,
        _email = email,
        _birthDate = birthDate,
        _gender = gender,
        _userType = userType,
        _avatar = avatar;

  String get firstName => _firstName;

  int get id => _id;
  String get lastName => _lastName;

  String get about => _about;

  List<DependencyEntity> get skills => _skills;

  List<String> get favoriteSocialMedia => _favoriteSocialMedia;

  int get salary => _salary;

  String get email => _email;

  String get birthDate => _birthDate;

  GenderEnum get gender => _gender;

  DependencyEntity get userType => _userType;

  String get avatar => _avatar;
}
