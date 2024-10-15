import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/Constant/colors.dart';
import '../../core/cubit/auth_cubit/user_cubit.dart';
import '../widgets/search_text_feild.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5)),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        gradient: LinearGradient(
          colors: [primaryColor, primaryColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocListener<UserCubit, UserState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        'signin',
                        (route) => false,
                      );
                    }
                  },
                  child: IconButton(
                    onPressed: () {
                      context.read<UserCubit>().logOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 40,
                      color: color1,
                    ),
                  )),
              IconButton(
                  onPressed: () => print('aa'),
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    size: 40,
                    color: color1,
                  ))
            ],
          ),
          const SearchTextFeild(),
        ],
      ),
    );
  }
}
