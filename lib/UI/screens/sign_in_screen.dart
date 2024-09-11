import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_system/UI/widgets/custom_input_field.dart';
import 'package:learning_system/core/cubit/auth_cubit/user_cubit.dart';
import '../../Constant/colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
          Navigator.pushNamedAndRemoveUntil(context, '', (route) => false);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/Tablet login-amico.svg',
                  height: 300,
                ),
                const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                  child: Form(
                    key: context.read<UserCubit>().signInFormKey,
                    child: Column(
                      children: [
                        CustomInputField(
                          controller: context.read<UserCubit>().email1,
                          hintText: 'البريد الإلكتروني',
                          icon: const Icon(Icons.person),
                          suffixIcon: true,
                          validator: true,
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          controller: context.read<UserCubit>().password1,
                          hintText: 'كلمة السر',
                          icon: const Icon(Icons.lock),
                          suffixIcon: true,
                          prefixIcon: true,
                          obscureText: true,
                          validator: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    MaterialButton(
                      elevation: 10,
                      color: primaryColor,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      height: 40,
                      minWidth: 200,
                      child: state is SignInLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('تسجيل الدخول',
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () {
                        context.read<UserCubit>().signIn();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            child: const Text(
                              'تسجيل الاشتراك',
                              style: TextStyle(color: primaryColor),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'signup');
                            }),
                        const Text(
                          'مستخدم جديد ؟',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
