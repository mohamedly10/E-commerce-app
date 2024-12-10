import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/feature/auth/domin/Entity/User.dart';

import '../../../../core/Failuers/Failuers.dart';




abstract class AuthRepository {

  Future<Either<Failure, UserInfo>> signUp(UserInfo userInfo);

  Future<Either<Failure, bool>> signIn(String email ,String password);
}
