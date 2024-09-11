import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/Constant/colors.dart';
import 'package:learning_system/UI/screens/Quiz.dart';
import 'package:learning_system/UI/screens/file_screen.dart';
import 'package:learning_system/UI/screens/photos_screen.dart';
import 'package:learning_system/UI/screens/videos_screen.dart';
import 'package:learning_system/core/cubit/books_cubit/books_cubit.dart';
import 'package:learning_system/core/cubit/exam_cubit/get_exam_cubit.dart';
import 'package:learning_system/core/cubit/get_files_cubit/getfiles_cubit.dart';
import 'package:learning_system/core/cubit/getall_exams_cubit/getexams_cubit.dart';
import 'package:learning_system/core/cubit/getphoto_cubit/getphotos_cubit.dart';
import 'package:learning_system/core/cubit/subvideos_cubit/subvideos_cubit.dart';

class SubjectContents extends StatefulWidget {
  const SubjectContents({super.key, required this.title});
  final String title;

  @override
  State<SubjectContents> createState() => _SubjectContentsState();
}

class _SubjectContentsState extends State<SubjectContents> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 4,
        length: 5,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                TextButton(
                  child: const Card(
                    child: Row(
                      children: [Text('المدرسين'), Icon(Icons.person)],
                    ),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('teacherpage'),
                )
              ],
              title: Center(child: Text(widget.title)),
              backgroundColor: color1,
              bottom: const TabBar(
                automaticIndicatorColorAdjustment: true,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      'الخطة الدراسية',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الملفات',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الكتب',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'اختبارات',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'فيديوهات',
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(children: [
              PhotoList(),
              FilesList(),
              BooksList(),
              ExamsList(),
              VideoList()
            ])));
  }
}

class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetphotosCubit, GetphotosState>(
      builder: (context, state) {
        return state is GetPhotoSuccess
            ? GridView.count(
                crossAxisCount: 5,
                children: List.generate(
                  state.photoModel.data.length,
                  (index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ImageViewer(
                                  iD: state.photoModel.data[index].id,
                                  name: state.photoModel.data[index].name,
                                  imageUrl: state.photoModel.data[index].url)));
                        },
                        child: Image.network(
                          state.photoModel.data[index].url,
                          fit: BoxFit.fill,
                        ));
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class FilesList extends StatelessWidget {
  const FilesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetfilesCubit, GetfilesState>(
      builder: (context, state) {
        return state is GetfilesSuccess
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.separated(
                  itemCount: state.filesModel.data.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PDFViewer(
                        iD: state.filesModel.data[index].id,
                        pdfUrl: state.filesModel.data[index].url,
                        name: state.filesModel.data[index].name,
                      ),
                    )),
                    child: Card(
                      color: primaryColor,
                      child: ListTile(
                        title: Text(
                          state.filesModel.data[index].name,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        trailing: const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return state is GetBooksSuccess
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.separated(
                  itemCount: state.booksModel.data.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PDFViewer(
                        iD: state.booksModel.data[index].id,
                        pdfUrl: state.booksModel.data[index].url,
                        name: state.booksModel.data[index].bookName,
                      ),
                    )),
                    child: Card(
                      color: primaryColor,
                      child: ListTile(
                        title: Text(
                          state.booksModel.data[index].bookName,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        trailing: const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubvideosCubit, SubvideosState>(
      builder: (context, state) {
        return state is SubVideosSuccess
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.separated(
                  itemCount: state.subVideos.totalVideos,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => Card(
                    color: primaryColor,
                    child: ListTile(
                      title: Text(
                        state.subVideos.data[index].name,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                              iD: state.subVideos.data[index].id,
                              name: state.subVideos.data[index].name,
                              videoUrl: state.subVideos.data[index].url),
                        )),
                      ),
                    ),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ExamsList extends StatelessWidget {
  const ExamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllExamsCubit, GetExamsState>(
      builder: (context, state) {
        return state is GetExamsSuccess
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.separated(
                  itemCount: state.examsListModel.data.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.read<GetExamCubit>().getExam(index + 1);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => QuizScreen(
                            iD: state.examsListModel.data[index].id,
                            name: state.examsListModel.data[index].examName),
                      ));
                    },
                    child: Card(
                      color: primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.examsListModel.data[index].examTime}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'عدد الاسئلة',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.examsListModel.data[index].qestionsNumber}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'درجة النجاح',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.examsListModel.data[index].successDegree}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'عنوان الاختبار',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.examsListModel.data[index].examName,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
