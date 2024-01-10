
import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/data/model/response/dependency_model.dart';
import 'package:base_app/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required int id,
    required String firstName,
    required String lastName,
    required String about,
    required List<DependencyModel> skills,
    required List<String> favoriteSocialMedia,
    required int salary,
    required String email,
    required String birthDate,
    required GenderEnum gender,
    required DependencyModel userType,
    required String avatar,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          about: about,
          favoriteSocialMedia: favoriteSocialMedia,
          salary: salary,
          email: email,
          birthDate: birthDate,
          gender: gender,
          userType: userType,
          avatar: avatar,
          skills: skills,
        );

  factory ProfileModel.fromJson(Map<String, dynamic>? json) {
    return ProfileModel(
      id: json?["id"],
      firstName: json?["first_name"]??'',
      lastName: json?["last_name"]??'',
      about: json?["about"]??'',
      skills: List<DependencyModel>.from(json?["tags"].map((x) => DependencyModel.fromJson(x))),
      favoriteSocialMedia: List<String>.from(json?["favorite_social_media"].map((x) =>x)),
      salary: json?["salary"]??0,
      email: json?["email"]??'',
      birthDate: json?["birth_date"]??'',
      gender: (json?["gender"]??0)==0?GenderEnum.male:GenderEnum.female,
      userType: DependencyModel.fromJson(json?["type"]),
      avatar: json?["avatar"]??'',

    );
  }


}
