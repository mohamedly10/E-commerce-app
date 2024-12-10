import 'package:dartz/dartz.dart';
import '../../../../core/Failuers/Failuers.dart';
import '../repository/authRepository.dart';


class SignInUseCase {

  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, bool>> execute(String email,String password) {
    return repository.signIn(email, password);
  }
}
