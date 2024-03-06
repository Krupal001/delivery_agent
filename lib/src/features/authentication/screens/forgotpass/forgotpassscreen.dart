import 'package:flutter/material.dart';


import '../../../../constants/strings.dart';
import '../../../../utils/theme/colors/colors.dart';

class ForgotPassMailScreen extends StatefulWidget {
  const ForgotPassMailScreen({super.key});

  @override
  State<ForgotPassMailScreen> createState() => _ForgotPassMailScreenState();
}

class _ForgotPassMailScreenState extends State<ForgotPassMailScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                const Image(image: AssetImage("assets/images/blackcircle.png",)),
                const Column(
                  children:[ Text(tForgotPassTitle,style:TextStyle(
                    fontFamily: "Open Sans",
                     fontSize: 35,
                    fontWeight: FontWeight.bold,)),
                    SizedBox(height: 20,),
                  Text(tForgotPAssSubtitle,style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.normal,),textAlign: TextAlign.center,),
              ], ),
                const SizedBox(height: 40,),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(Icons.mail_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15),)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tThemeMain),),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                        height: 50,
                        child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            backgroundColor: tThemeMain,
                            foregroundColor: Colors.white,
                
                            side: const BorderSide(color: tThemeMain),),
                            child: const Text("Next",style: TextStyle(fontSize: 20),)),
                
                    )],
                ))
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

