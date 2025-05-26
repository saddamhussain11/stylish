import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylish/constant/appimages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      // final bool onbordingply =
      //     box.read('onbording') ?? false; // Default false if null
      // if (onbordingply) {
      //   User? user = FirebaseAuth
      //       .instance.currentUser; // `await` hatane ki zaroorat nahi hai

      //   if (user != null) {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (_) => HomeScreen()));
      //   } else {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (_) => LoginScreen()));
      //   }
      // } else {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (_) => Onboarding()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(Appimages.splash)));
  }
}
