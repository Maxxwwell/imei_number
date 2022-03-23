import 'package:flutter/material.dart';
import 'package:imei_number/constants/colors.dart';
import 'package:imei_number/screens/Login.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/new-mtn-logo.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            LoadingAnimationWidget.fourRotatingDots(
              color: AppColors.yellow,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}
