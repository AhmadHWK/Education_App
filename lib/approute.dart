import 'package:flutter/material.dart';
import 'package:learning_system/UI/screens/home_screen.dart';
import 'package:learning_system/UI/screens/profile_screen.dart';
import 'package:learning_system/UI/screens/sign_up_screen.dart';
import 'UI/screens/sign_in_screen.dart';
import 'UI/screens/teacher_screen.dart';

class AppRoute {
  Route? generateroute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );

      case 'profile':
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case 'signin':
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
        );
      case 'signup':
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );

      case 'teacherpage':
        return MaterialPageRoute(
          builder: (_) => TeacherPage(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const Home(),
    );
  }
}
