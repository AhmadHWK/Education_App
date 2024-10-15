import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/cubit/getsubteacher_cubit/getsubteacher_cubit.dart';

import '../../Constant/colors.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المدرسين'),
      ),
      body: BlocBuilder<GetsubteacherCubit, GetsubteacherState>(
        builder: (context, state) {
          return state is GetsubteacherSuccess
              ? ListView.separated(
                  itemCount: state.teacherModel.data.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
                  itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.all(12),
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'اسم الاستاذ : ${state.teacherModel.data[index].firstName} ${state.teacherModel.data[index].lastName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              ' رقم الهاتف : ${state.teacherModel.data[index].phoneNo}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'الخبرة التعليمية : ${state.teacherModel.data[index].teachingDuration} سنوات',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'المادة : ${state.teacherModel.data[index].subjectName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
