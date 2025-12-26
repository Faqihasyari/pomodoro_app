import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pomodoro_app/presentation/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
    },);

    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/notifikasi.json', width: 200, height: 200, repeat: true, animate: true),
      ),
    );
  }
}