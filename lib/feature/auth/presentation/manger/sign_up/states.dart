import '../../../domin/Entity/User.dart';


abstract class SignupState {}
class AuthInitial extends SignupState {}
class AuthLoading extends SignupState {}
class AuthSuccess extends SignupState {
  final UserInfo userInfo;
  AuthSuccess(this.userInfo);
}
class AuthFailure extends SignupState {


  final String message;
  AuthFailure(this.message);
}
class PasswordState extends SignupState{}
