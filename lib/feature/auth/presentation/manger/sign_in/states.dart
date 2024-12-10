
abstract class SignInState {}
class AuthInitial extends SignInState {}
class AuthLoading extends SignInState {}
class AuthSuccess extends SignInState {
}
class AuthFailure extends SignInState {
  final String message;
  AuthFailure(this.message);
}
class PasswordState extends SignInState{}
