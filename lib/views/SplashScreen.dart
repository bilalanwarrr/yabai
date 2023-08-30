import 'package:flutter/material.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/views/auth/views/StartScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration(seconds: 3)).then((value) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      body: Center(
        child: Image.asset('assets/images/splash_logo.png'),
      ),
    );
  }
}
