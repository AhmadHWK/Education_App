import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/Constant/colors.dart';
import 'package:learning_system/UI/screens/result_screen.dart';
import 'package:learning_system/core/cubit/exam_cubit/get_exam_cubit.dart';
import 'package:learning_system/core/cubit/submit_result_cubit/submit_result_cubit.dart';

class QuizScreen extends StatefulWidget {
  final int iD;
  final String name;

  const QuizScreen({super.key, required this.iD, required this.name});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Map<int, int> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExamCubit, GetExamState>(
      builder: (context, state) {
        return state is GetExamSuccess
            ? Scaffold(
                appBar: AppBar(
                  title: Text(widget.name),
                ),
                body: ListView.builder(
                  itemCount: state.examModel.data.questions.length,
                  itemBuilder: (context, index) {
                    final question = state.examModel.data.questions[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(question.questionText,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: question.options.map((option) {
                                return RadioListTile<int>(
                                  title: Text(option.optionText),
                                  value: option.id,
                                  groupValue: selectedOptions[question.id],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOptions[question.id] = value!;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: primaryColor,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context
                        .read<SubmitResultCubit>()
                        .submitResult(state.examModel.data.id, selectedOptions);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultScreen(),
                    ));
                  },
                ),
              )
            : Scaffold(body: Container());
      },
    );
  }
}
