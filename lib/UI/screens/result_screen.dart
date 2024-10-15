import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/cubit/submit_result_cubit/submit_result_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<SubmitResultCubit, SubmitResultState>(
        builder: (context, state) {
          return state is SubmitResultSuccess
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        '${state.submitModel.degree}%',
                        style: const TextStyle(fontSize: 100),
                      ),
                      const Text(
                        'تهانينا',
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
