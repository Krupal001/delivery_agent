// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../welcome/welcome_screen_first.dart';
//import 'dart:js';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate=false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image(
              image:AssetImage(tSplashImage),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 400),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'We Deliver, You Enjoy',
                  style: TextStyle(
                    fontFamily: 'Oregano',
                    fontSize: 39.0,
                    fontWeight: FontWeight.w500,

                  ),

                ),
              ),

            ],
          ),

        ],
        
      ),
    );
  }

  startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500),(){});
     setState(() {
       animate=true;
     });
    await Future.delayed(const Duration(milliseconds: 2500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FirstScreen()));
  }
}
