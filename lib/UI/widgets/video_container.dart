import 'package:flutter/material.dart';

class VideoContainer extends StatelessWidget {
  final String image;
  final dynamic play;
  const VideoContainer({super.key, required this.image, required this.play});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: .7, fit: BoxFit.cover, image: AssetImage(image)),
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(40))),
      child: Stack(children: [
        Positioned(
          top: 30,
          left: 30,
          child:
              Text('Title', style: Theme.of(context).textTheme.headlineMedium!),
        ),
        Positioned(
          bottom: 50,
          left: 30,
          child: Text('Descreptions',
              style: Theme.of(context).textTheme.headlineSmall!),
        ),
        Positioned(
          right: 30,
          top: 20,
          child: IconButton(
            onPressed: play,
            icon: const Icon(
              Icons.play_circle_outline,
              size: 40,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 30,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_add_outlined,
              size: 40,
            ),
          ),
        ),
      ]),
    );
  }
}
