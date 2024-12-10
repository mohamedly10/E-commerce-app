import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/feature/auth/domin/use_case/Sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/snackBar/snackbar.dart';
import '../../data/data_source/Data_source.dart';
import '../../data/repository_imp/repository_imp.dart';
import '../../domin/repository/authRepository.dart';
import '../manger/sign_in/Cubit.dart';
import '../manger/sign_in/states.dart';

class Sign_in extends StatelessWidget {
  const Sign_in({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var screenheight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: BlocProvider(
        create: (context) => SignInCubit(
            SignInUseCase(AuthRepositoryImpl(AuthRemoteDataSource(Dio())))),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Sucessfuly')));
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            var auth_cubit = BlocProvider.of<SignInCubit>(context);
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight * 0.05,
                  ),
                  Image.asset("assets/image/route.png"),
                  SizedBox(height: screenheight * 0.04),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Welcome Back To Route",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600))),
                            SizedBox(
                              height: screenheight * 0.01,
                            ),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text('Please sign in with your email',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                            SizedBox(height: screenheight * 0.05),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Email",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            SizedBox(height: screenheight * 0.02),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
                                }
                                return null;
                              },
                              controller: auth_cubit.emailController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  filled: true,
                                  // Ensures the fillColor is applied
                                  fillColor: Colors.white,
                                  hintText: 'enter your Email',
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(height: screenheight * 0.05),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Password",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            SizedBox(height: screenheight * 0.02),
                            TextFormField(
                              obscureText: auth_cubit.visPassord,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              controller: auth_cubit.passwordController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        auth_cubit.togglePasswordVisibility();
                                      },
                                      icon: Icon(auth_cubit.visPassord
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined)),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  filled: true,
                                  // Ensures the fillColor is applied
                                  fillColor: Colors.white,
                                  hintText: 'enter your password',
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            FittedBox(
                                alignment: Alignment.topRight,
                                fit: BoxFit.scaleDown,
                                child: Text("Forget Password",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400))),
                            SizedBox(height: screenheight * 0.05),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    var isSucessfulySign = auth_cubit.signin();
                                    isSucessfulySign.then((isSucessfuly) {
                                      if (isSucessfuly) {
                                        MotionToastUtils.showSuccess(context,
                                            "Successful", "Welcome back");
                                        Navigator.pushReplacementNamed(
                                            context, RouteName.Layout_Page);
                                      }
                                    });
                                  } else {
                                    MotionToastUtils.showError(context, "error",
                                        "you have error in input");
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: const EdgeInsets.all(22)),
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text("login",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                                    color: theme.primaryColor,
                                                    fontWeight:
                                                        FontWeight.w600))))),
                            SizedBox(height: screenheight * 0.04),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.Sign_Up);
                                  },
                                  child: Text(
                                      "Don’t have an account? Create Account",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                ))
                          ],
                        )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
