import 'package:e_commerce_app/feature/auth/domin/Entity/User.dart';
import 'package:e_commerce_app/feature/auth/presentation/manger/sign_up/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domin/use_case/Sign_up_useCase.dart';


class SignUpCubit extends Cubit<SignupState> {
  final SignUpUseCase signInUseCase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
bool visPassord=false;

  SignUpCubit(this.signInUseCase) : super(AuthInitial());

  Future<void> signUp() async {
    UserInfo userInfo = UserInfo(
      name: nameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      password: passwordController.text,);

    emit(AuthLoading());
    final result = await signInUseCase.execute(userInfo);

    result.fold(
            (failure) {
          emit(AuthFailure(failure.message));
        },
            (user) {

         // saveUserInformation(user);

          emit(AuthSuccess(userInfo)

          );
        }
    );
  }

  saveUserInformation(UserInfo userInfo) async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', userInfo.name);
    await prefs.setString('email', userInfo.email);
    await prefs.setString('password', userInfo.password);
    await prefs.setString('phoneNumber', userInfo.phoneNumber);
    await prefs.setString('token', userInfo.token??"");



}
readData()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys(); // Get all keys stored in SharedPreferences
  print('All keys in SharedPreferences: $keys');
  final String? myemail = prefs.getString('email');
  print('the email from ram is here $myemail');
}

  void togglePasswordVisibility() {
    visPassord =!visPassord;
    emit(PasswordState());
  }
}
