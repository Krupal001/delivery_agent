import 'package:flutter/material.dart';
//import 'package:flutter_projects/src/constants/strings.dart';

import 'package:get/get.dart';

import '../../../../utils/theme/colors/colors.dart';
import '../../controllers/login_controller.dart';
import '../signup/signup_screen.dart';
import 'loginform.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               const SizedBox(height: 50,),
                const Text("SIGN IN",style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: tThemeMain,
                ),textAlign: TextAlign.center,),
                const Text("Hi! Welcome back,you've been missed",textAlign: TextAlign.center,),
                const SizedBox(height: 50,),
                const LoginForm(),
                 const SizedBox(height: 30),
                const Text("OR",style: TextStyle(
                  fontSize: 25,)),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,height: 50,
                  child: OutlinedButton.icon(
                      icon: const Image(image: AssetImage("assets/images/google.png"),height: 80,),
                      onPressed: ()=>controller.googleSignIn(),
                      label: const Text("Sign-in with Google",style: TextStyle(fontSize: 16,color: Colors.black),),
                    style: OutlinedButton.styleFrom(
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
      
                ),
      
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,height: 50,
                  child: OutlinedButton.icon(
                    icon: const Image(image: AssetImage("assets/images/apple.png"),height: 35,width: 60,),
                    onPressed: (){},
                    label: const Text("Sign-in with Apple",style: TextStyle(fontSize: 16,color: Colors.black),),
                    style: OutlinedButton.styleFrom(
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
      
                  ),
      
                ),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
                    },
                    child:  Text.rich(TextSpan(
                      text: "Don't have an Account ? ",style:Theme.of(context).textTheme.bodyLarge,
                      children: const [TextSpan(
                        text: "Signup",style: TextStyle(color: tThemeMain),
                      ),
                      ]),
                      style: const TextStyle(color: tThemeMain,
                      fontSize: 18),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



