import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/theme/colors/colors.dart';
import '../../controllers/signup_controller.dart';
import '../login/login_screen.dart';
import 'signupform.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignupController());
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
                const Text("SIGN UP",style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: tThemeMain,
                ),textAlign: TextAlign.center,),
                const Text("Fill your information below or register With your social account.",textAlign: TextAlign.center,),
                const SizedBox(height: 50,),
                const SignupForm(),
                const SizedBox(height: 30),
                const Text("OR",style: TextStyle(
                  fontSize: 25,)),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,height: 50,
                  child: OutlinedButton.icon(
                    icon: const Image(image: AssetImage("assets/images/google.png"),height: 80,),
                    onPressed: (){
                      controller.googleSignIn();
                    },
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    },
                    child: Text.rich(TextSpan(
                        text: "Already have an Account ? ",style: Theme.of(context).textTheme.bodyLarge,
                        children: const [TextSpan(
                          text: "Signin",style: TextStyle(color: tThemeMain),
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



