import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/UI/screens/appbar_screen.dart';
import 'package:learning_system/UI/screens/subject_contents.dart';
import 'package:learning_system/UI/widgets/mycontainer.dart';
import 'package:learning_system/core/cubit/books_cubit/books_cubit.dart';
import 'package:learning_system/core/cubit/get_files_cubit/getfiles_cubit.dart';
import 'package:learning_system/core/cubit/getall_exams_cubit/getexams_cubit.dart';
import 'package:learning_system/core/cubit/getphoto_cubit/getphotos_cubit.dart';
import 'package:learning_system/core/cubit/getsub-cubit/subjects_cubit.dart';
import 'package:learning_system/core/cubit/getsubteacher_cubit/getsubteacher_cubit.dart';
import 'package:learning_system/core/cubit/subvideos_cubit/subvideos_cubit.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBody> {
  @override
  void initState() {
    context.read<SubjectsCubit>().getSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsCubit, SubjectsState>(
      builder: (context, state) {
        return Scaffold(
          body: state is GetSubjectLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetSubjectSuccess
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MyAppBar(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () => context
                                        .read<SubjectsCubit>()
                                        .getSubject(),
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: Colors.black,
                                    )),
                                Text(
                                  state.subjects.message!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 3,
                            padding: const EdgeInsets.all(8),
                            children: List.generate(
                              state.subjects.subjects!.length,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<SubvideosCubit>()
                                        .getSubVideos(index + 1);
                                    context
                                        .read<BooksCubit>()
                                        .getSubBooks(index + 1);
                                    context
                                        .read<GetfilesCubit>()
                                        .getSubFiles(index + 1);
                                    context
                                        .read<GetphotosCubit>()
                                        .getSubPhoto(index + 1);
                                    context
                                        .read<GetAllExamsCubit>()
                                        .getSubExams(index + 1);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SubjectContents(
                                            title: state.subjects
                                                .subjects![index].subjectName!),
                                      ),
                                    );
                                  },
                                  child: MyContainer(
                                      title: state.subjects.subjects![index]
                                          .subjectName!,
                                      image: 'assets/images/pro_logo.png'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text(state.toString()),
                    ),
        );
      },
    );
  }
}
