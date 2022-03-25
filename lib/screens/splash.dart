import 'package:flutter/material.dart';
import 'package:imei_number/constants/colors.dart';
import 'package:imei_number/screens/Login.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Login(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Image.asset(
              'assets/images/new-mtn-logo.jpg',
              height: animation.value * 200,
              fit: BoxFit.contain,
            ),
            LoadingAnimationWidget.fourRotatingDots(
              color: AppColors.black,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
