import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Center(
            child: Text(
              'Grocery Shopping',
              textAlign: TextAlign.center,
              style: textTheme.displayLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 48.h,
            left: 16.w,
            right: 16.w,
            child: Column(
              children: [
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: Size.fromHeight(38.h),
                  ),
                  child: Text(
                    'Login or Register',
                    style: textTheme.titleMedium!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                OutlinedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(38.h),
                    side: BorderSide(color: colorScheme.background, width: 2.2),
                  ),
                  child: Text(
                    'Shop as Guest',
                    style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.background,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
