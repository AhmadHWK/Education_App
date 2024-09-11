import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/UI/screens/onboarding_screen.dart';
import 'package:learning_system/cache/Mycache.dart';
import 'package:learning_system/core/api/dio_consumer.dart';
import 'package:learning_system/core/cubit/auth_cubit/user_cubit.dart';
import 'package:learning_system/core/cubit/books_cubit/books_cubit.dart';
import 'package:learning_system/core/cubit/exam_cubit/get_exam_cubit.dart';
import 'package:learning_system/core/cubit/get_files_cubit/getfiles_cubit.dart';
import 'package:learning_system/core/cubit/getall_exams_cubit/getexams_cubit.dart';
import 'package:learning_system/core/cubit/getphoto_cubit/getphotos_cubit.dart';
import 'package:learning_system/core/cubit/getsub-cubit/subjects_cubit.dart';
import 'package:learning_system/core/cubit/getsubcontents_cubit/sub_contents_cubit.dart';
import 'package:learning_system/core/cubit/getsubteacher_cubit/getsubteacher_cubit.dart';
import 'package:learning_system/core/cubit/profile_cubit/profile_cubit.dart';
import 'package:learning_system/core/cubit/saves_cubit/saved_cubit.dart';
import 'package:learning_system/core/cubit/submit_result_cubit/submit_result_cubit.dart';
import 'package:learning_system/core/cubit/subvideos_cubit/subvideos_cubit.dart';
import 'Constant/colors.dart';
import 'approute.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyCache().init();
  runApp(MyApp(
    approute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute approute;
  MyApp({super.key, required this.approute});
  final DioConsumer dioProvider = DioConsumer(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => SubjectsCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => SubContentsCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => SubvideosCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => GetAllExamsCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => GetphotosCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => BooksCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => GetExamCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => GetsubteacherCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => GetfilesCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => SavedCubit(dioProvider),
        ),
        BlocProvider(
          create: (context) => SubmitResultCubit(dioProvider),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ULearning',
        theme: ThemeData(
          appBarTheme:
              const AppBarTheme(elevation: 12, shadowColor: primaryColor),
          fontFamily: 'Cairo',
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showUnselectedLabels: true,
            backgroundColor: color1,
            selectedItemColor: primaryColor,
            unselectedItemColor: color7,
            type: BottomNavigationBarType.fixed,
          ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryColor,
          ),
        ),
        home: const OnboardingPage(),
        onGenerateRoute: approute.generateroute,
      ),
    );
  }
}
