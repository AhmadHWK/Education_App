import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoControls({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller.value.isPlaying
            ? const SizedBox.shrink()
            : ColoredBox(
                color: Colors.black26,
                child: Center(
                  child: IconButton(
                    onPressed: () => controller.value.isPlaying
                        ? controller.play()
                        : controller.pause(),
                    icon: controller.value.isPlaying
                        ? const Icon(Icons.pause_circle_outline)
                        : const Icon(Icons.play_circle_outlined),
                    color: Colors.white,
                  ),
                ),
              ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.fullscreen,
            ),
          ),
        ),
      ],
    );
  }
}
