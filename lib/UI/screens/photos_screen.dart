import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/cubit/saves_cubit/saved_cubit.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int iD;
  ImageViewer({required this.imageUrl, required this.name, required this.iD});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
              onPressed: () => context
                  .read<SavedCubit>()
                  .postSaves(iD, 'App\\Models\\Photo'),
              icon: Icon(Icons.bookmark_add))
        ],
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                  child: Text('Failed to load image',
                      style: TextStyle(color: Colors.white)));
            },
          ),
        ),
      ),
    );
  }
}
