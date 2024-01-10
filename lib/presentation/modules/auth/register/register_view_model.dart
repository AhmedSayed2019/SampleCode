import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/entities/dependencies_entity.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/parameters/auth/user_register_parameters.dart';
import 'package:base_app/domain/usecase/auth/register_usecase.dart';
import 'package:base_app/domain/usecase/common/get_dependencies_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/base/response_model.dart';
import '../../../../generated/locale_keys.g.dart';


class RegisterViewModel extends ChangeNotifier{
  final tag = 'RegisterViewModel';

  final RegisterUseCase _registerUseCase;
  final GetDependenciesUseCase  _getDependenciesUseCase;

  RegisterViewModel({
    required RegisterUseCase registerUseCase,
    required GetDependenciesUseCase getDependenciesUseCase,
  })  : _registerUseCase = registerUseCase,
        _getDependenciesUseCase = getDependenciesUseCase;


  ///variables
  bool _isLoading = false;
  late RegisterParameters _parameters  ;
  int _currentPage = 0;
  late PageController _controller;



  String? _skillsError;
  String? _userTypeError;
  String? _imageError;
  String? _socialError;
  String? _genderError;
  ResponseModel<DependenciesEntity>? _responseModel;

  ///getters
  bool get isLoading => _isLoading;
  int get currentPage => _currentPage;
  String? get skillsError => _skillsError;
  String? get userTypeError => _userTypeError;
  String? get imageError => _imageError;
  String? get socialError => _socialError;
  String? get genderError => _genderError;
  RegisterParameters get parameters => _parameters;
  ResponseModel<DependenciesEntity>? get responseModel => _responseModel;


  //start page
  init(PageController controller){
    _parameters = RegisterParameters();
    _controller =controller;
    _getSkills();
    _currentPage = 0;
  }

  //open next Page
  onOpenNextPage(int page){_currentPage = page;_controller.jumpToPage(page);notifyListeners();}
  //on update image
  onUpdateImage(String image) {_parameters.setImage(image);checkImageError();}
  //on update user type
  onUpdateUserType(DependencyEntity entity) {_parameters.setUserType(entity);checkUserTypeError();}
  //on update skills
  onUpdateUserSkills(DependencyEntity entity) {_parameters.setUserType(entity);checkSkillsError();}
  //On Update Salary
  onUpdateSalary(int salary) {_parameters.setSalary(salary);notifyListeners();}
  //On Update Gender
  onUpdateGender(GenderEnum gender) {_parameters.setGender(gender);notifyListeners();}
  //On Update Skills
  onSelectSkills(List<DependencyEntity> list) {_parameters.setSkills(list);checkSkillsError(); notifyListeners();}
  //On Update Tags
  onSelectSocialMedia(DependencyEntity entity, bool isSelected) {_parameters.updateSocialMedia( entity,isSelected);checkSocialError(); notifyListeners();}


  //Save step one data
  saveStepOneData({required String firstName,required String lastName,required String email,required String password}){
    _parameters.setStepOneData(firstName: firstName, lastName: lastName, email: email, password: password);
    onOpenNextPage(1);
  }

  //Save step one data
  saveStepTwoData({required String birthDate,required String about}){
    _parameters.setStepTwoData(about: about, birthDate: birthDate);
  }


  ///check data
  //check user type error
  bool checkUserTypeError() {
    if (_parameters.userType == null) {_userTypeError = tr(LocaleKeys.msgUserTypeRequired);notifyListeners();return false;
    } else {_userTypeError = null;notifyListeners();return true;}
  }
  bool checkSkillsError(){
    if(_parameters.skills.isEmpty){_skillsError=''; notifyListeners();return false ;}
    else{_skillsError=null; notifyListeners();return true;}
  }

  bool checkImageError(){
    if(_parameters.image==null){_imageError=''; notifyListeners();return false ;}
    else{_imageError=null; notifyListeners();return true;}
  }
  bool checkSocialError(){
    if(_parameters.socialMedia.isEmpty){_socialError=''; notifyListeners();return false ;}
    else{_socialError=null; notifyListeners();return true;}
  }

  ///colling api functions


//register user
  Future<ResponseModel> register() async {
    _isLoading = true;
    notifyListeners();
    ResponseModel responseModel = await _registerUseCase.call(registerParameters: _parameters);
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<void> _getSkills() async {
    _responseModel = await _getDependenciesUseCase.call();
    notifyListeners();
  }
}