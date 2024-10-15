import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:learning_system/core/cubit/saves_cubit/saved_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class PDFViewer extends StatefulWidget {
  final String pdfUrl;
  final String name;
  final int iD;

  PDFViewer({required this.pdfUrl, required this.name, required this.iD});

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    _downloadAndSavePDF();
  }

  Future<void> _downloadAndSavePDF() async {
    Dio dio = Dio();
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/temp.pdf';

      await dio.download(
        widget.pdfUrl,
        filePath,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 60), // تعيين مهلة غير محدودة
        ),
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        },
      );

      setState(() {
        localPath = filePath;
      });
    } catch (error) {
      print("Error downloading PDF: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
              onPressed: () => context
                  .read<SavedCubit>()
                  .postSaves(widget.iD, 'App\\Models\\File'),
              icon: const Icon(Icons.bookmark_add))
        ],
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath!,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: true,
              pageFling: true,
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
