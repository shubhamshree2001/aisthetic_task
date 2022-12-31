import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:video_player/video_player.dart';

class CarouselWidget extends StatefulWidget {
  CarouselWidget(this.index, this.onChange, {Key? key}) : super(key: key);

  int index;
  Function onChange;

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<CarouselWidget> {
  static VideoPlayerController controller =
      VideoPlayerController.asset("assets/videos/vid.mp4");
  final urlImages = [
    MyVideo(0, controller),
    ImageWidget('assets/images/image1.jpg', 1),
    ImageWidget('assets/images/image2.jpeg', 2),
    ImageWidget('assets/images/image.jpeg', 3),
  ];

  @override
  void initState() {
    controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height * (0.55),
          viewportFraction: 0.75,
          onPageChanged: (index, reason) {
            widget.index = index;
            widget.onChange(widget.index);
            if (index != 0) {
              setState(() {
                controller.pause();
              });
            } else {
              controller.play();
            }
          }),
      itemCount: urlImages.length,
      itemBuilder: (context, index, realIndex) {
        return urlImages[index];
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  String urlImage;
  int index;

  ImageWidget(this.urlImage, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.blueGrey,
      width: double.infinity,
      child: Image.asset(urlImage, fit: BoxFit.fill),
    );
  }
}

class TextSliderWidget extends StatefulWidget {
  const TextSliderWidget(this.header, this.body, {Key? key}) : super(key: key);

  final String header;
  final String body;

  @override
  State<TextSliderWidget> createState() => _TextSliderWidgetState();
}

class _TextSliderWidgetState extends State<TextSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      child: Container(
        height: MediaQuery.of(context).size.height * (0.25),
        padding: const EdgeInsets.fromLTRB(40, 0, 50, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.header,
              style: GoogleFonts.nanumMyeongjo(
                textStyle: const TextStyle(fontSize: 25),
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.body,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 15, height: 1.5),
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class MyVideo extends StatefulWidget {
  final int index;
  final VideoPlayerController? controller;

  const MyVideo(this.index, this.controller, {Key? key}) : super(key: key);

  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  @override
  void initState() {
    widget.controller!.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: MediaQuery.of(context).size.height * (0.55),
      width: MediaQuery.of(context).size.width * (0.75),
      color: Colors.blueGrey,
      child: widget.controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: widget.controller!.value.aspectRatio,
              child: VideoPlayer(
                widget.controller!,
              ),
            )
          : Container(
              color: Colors.blueGrey,
            ),
    );
  }
}
