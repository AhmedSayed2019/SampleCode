
import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/entities/profile_entity.dart';



ProfileEntity? kUser;
UserType kUserType = UserType.customer;


bool get kIsAuth=> kUser!=null;
bool get kIsCustomer=> kUserType == UserType.customer;
