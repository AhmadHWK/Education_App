import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_system/UI/widgets/custom_input_field.dart';
import '../../Constant/colors.dart';
import '../../core/cubit/auth_cubit/user_cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            'signin',
            (route) => false,
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: context.read<UserCubit>().signUpFormKey,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/Sign up-amico.svg',
                    height: 300,
                  ),
                  const Text(
                    'تسجيل الاشتراك',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 40),
                    child: Column(
                      children: [
                        CustomInputField(
                          controller: context.read<UserCubit>().firstName,
                          hintText: 'الاسم الأول',
                          icon: const Icon(Icons.person),
                          suffixIcon: true,
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          controller: context.read<UserCubit>().lastName,
                          hintText: 'الاسم الأخير',
                          icon: const Icon(Icons.person),
                          suffixIcon: true,
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          controller: context.read<UserCubit>().email,
                          hintText: 'البريد الالكتروني',
                          icon: const Icon(Icons.email),
                          suffixIcon: true,
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          controller: context.read<UserCubit>().phonenumber,
                          hintText: 'رقم الهاتف',
                          icon: const Icon(Icons.phone),
                          suffixIcon: true,
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          controller: context.read<UserCubit>().password,
                          hintText: 'كلمة السر',
                          icon: const Icon(Icons.lock),
                          suffixIcon: true,
                          prefixIcon: true,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          controller: context.read<UserCubit>().repassword,
                          hintText: 'إعادة كلمة السر',
                          icon: const Icon(Icons.lock),
                          suffixIcon: true,
                          prefixIcon: true,
                          obscureText: true,
                        )
                      ],
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
                        child: state is SignUpLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('تسجيل اشتراك',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                        onPressed: () {
                          if (context
                              .read<UserCubit>()
                              .signUpFormKey
                              .currentState!
                              .validate()) {
                            context.read<UserCubit>().signUp();
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(color: primaryColor),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('signin');
                            },
                          ),
                          const Text(
                            'مشترك مسبقا ؟',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
