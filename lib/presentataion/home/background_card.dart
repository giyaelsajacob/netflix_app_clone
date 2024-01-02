import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/colors/constants.dart';
import 'custom_vutton_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height:600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kMainImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom:0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              const CustomButtonWidget(icon:Icons.add, title:"My List"),
                _playbutton(),
                CustomButtonWidget(icon:Icons.info, title:"Info")
              ],
            ),
          ),
        )
      ],
    );
}


  TextButton _playbutton() {
    return TextButton.icon(
      onPressed:(){},
      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(kWhiteColor) ),
      icon: Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text("Play",style: TextStyle(
            fontSize:20,
            color: kBlackColor
        ),),
      ),);
  }
}
