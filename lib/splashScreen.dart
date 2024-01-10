import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewat2/view/form_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nav();
  }

  void nav() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.to(() => MyForm());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/splash.gif")),
    );
  }
}
