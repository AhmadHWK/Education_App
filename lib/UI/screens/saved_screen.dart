import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/cubit/saves_cubit/saved_cubit.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    //context.read<SavedCubit>().getSaves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحفوظات'),
      ),
      body: BlocBuilder<SavedCubit, SavedState>(
        builder: (context, state) {
          return state is GetSuccess
              ? ListView.builder(
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(state.favorites[index].favoritable.photoName),
                    ),
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
