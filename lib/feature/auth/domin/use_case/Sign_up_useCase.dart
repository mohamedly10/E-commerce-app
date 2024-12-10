import 'package:dartz/dartz.dart';

import '../../../../core/Failuers/Failuers.dart';
import '../Entity/User.dart';
import '../repository/authRepository.dart';


class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserInfo>> execute(UserInfo userInfo) {

    print(userInfo.name);
    return repository.signUp(userInfo);
  }
}
