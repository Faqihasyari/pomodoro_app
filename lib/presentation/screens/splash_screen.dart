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

    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(),));
    },);

    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/loading.json', width: 350, height: 350, repeat: true, animate: true),
      ),
    );
  }
}