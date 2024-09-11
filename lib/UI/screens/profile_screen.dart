import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/Constant/colors.dart';
import 'package:learning_system/core/cubit/profile_cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: state is GetProfileLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetProfileSuccess
                  ? Column(
                      children: [
                        const CircleAvatar(
                            backgroundColor: primaryColor,
                            foregroundColor: color1,
                            minRadius: 100,
                            child: Icon(
                              Icons.person,
                              size: 100,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          margin: const EdgeInsets.all(30),
                          shadowColor: primaryColor,
                          elevation: 5,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                title: Text(
                                  state.fName,
                                ),
                                leading: const Icon(Icons.person),
                              ),
                              const SizedBox(height: 16),
                              ListTile(
                                title: Text(
                                  state.lName,
                                ),
                                leading: const Icon(Icons.person),
                              ),
                              const SizedBox(height: 16),
                              ListTile(
                                title: Text(state.email),
                                leading: const Icon(Icons.email),
                              ),
                              const SizedBox(height: 16),
                              ListTile(
                                title: Text(state.phnum),
                                leading: const Icon(Icons.phone),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(state.toString()),
                    ),
        );
      },
    );
  }
}
