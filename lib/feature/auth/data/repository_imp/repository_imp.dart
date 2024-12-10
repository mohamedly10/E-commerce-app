import 'package:dartz/dartz.dart';
import '../../../../core/Failuers/Failuers.dart';
import '../../domin/Entity/User.dart';
import '../../domin/repository/authRepository.dart';
import '../data_source/Data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure,UserInfo>> signUp(UserInfo userInfo) async {
    try {
      final user = await remoteDataSource.signup(userInfo);
      return Right(user); // Success
    } catch (e) {
      return Left(ServerFailure(e.toString())); // Failure
    }
  }

  @override
  Future<Either<Failure, bool>> signIn( String email ,String password) async {
    try {
      final auth_sign = await remoteDataSource.signin(email, password);
      return right(auth_sign);
    } catch (e) {
      return Left(ServerFailure(e.toString())); // Failure

  }
  }
}
