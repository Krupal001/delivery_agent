import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../utils/theme/colors/colors.dart';
import '../../models/models_on_boarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(color: model.bgcolor,
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
              child: Image(image: AssetImage(model.image),height: model.height*0.40,)),

           Column(
            children: [
              Text(model.title,style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                  fontFamily:'Oregano'
              ),
                textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
               Text(model.subtitle,style: const TextStyle(
                color: Colors.black38,
              ),textAlign: TextAlign.center,)
            ],

          ),
          const SizedBox(height: 60.0),
        ],
      ),);
  }
}
