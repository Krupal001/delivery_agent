import 'package:delivery_agent/src/features/authentication/screens/welcome/welcome_main.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../../../constants/image_strings.dart';
import '../../../../constants/strings.dart';
import '../../../../utils/theme/colors/colors.dart';
import '../../models/models_on_boarding.dart';
import 'OnBoarding_widget.dart';

class FirstScreen extends StatefulWidget {
   const FirstScreen({super.key});


  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Size sizes;
  final controller=LiquidController();
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    sizes=MediaQuery.of(context).size;
    final pages=[
      OnBoardingPage(model: OnBoardingModel(
          image: tOnboardTwo,
          title: tOnBoardingTitle1,
          subtitle:tOnBoardingSubTitle1,
          bgcolor: tOnBoard1,
          height: sizes.height

      ),),
      OnBoardingPage(model: OnBoardingModel(
          image: tOnboardOne,
          title:tOnBoardingTitle2,
          subtitle:tOnBoardingSubTitle2,
          bgcolor: tOnBoard2,
          height: sizes.height

      ),),
    ];
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
              pages: pages,
              liquidController: controller,
              onPageChangeCallback:onPageChangeCallback ,
              slideIconWidget: const Icon(Icons.arrow_back_ios_new),
              enableSideReveal: true,
            ),
           Positioned(
            bottom: 60.0,
              child: OutlinedButton(
                onPressed: (){
                  int nextPage=controller.currentPage+1;
                  if(nextPage>1){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                  }
                  controller.animateToPage(page: nextPage);
                },
                  style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.white,

                  ),
                  child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,

                  ),
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                  ),

                  ),

                  ),
                  Positioned(
                  top: 50.0 ,
                  right: 20,
                   child: TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                      },

                      child: const Text("Skip",style: TextStyle(color: tThemeMain),),

              )),
          Positioned(
            bottom: 15,
              child:AnimatedSmoothIndicator(
                activeIndex: controller.currentPage, count: 2,
                effect: const WormEffect(
                  activeDotColor: Color(0x9D000000),
                  dotHeight: 5.0,
                ),
              ) )
        ],
      ),

    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage=activePageIndex;
    });


  }
}

