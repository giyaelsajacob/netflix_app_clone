//nammlde downloads ilum nammldenew & hot ilum same mate caste ath k varunnd,athond ahnu common aait oru app bar create aakunath

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
   const AppBarWidget({
     Key?key,
     required this.title,
   }):
     super(key:key);
   final String title;
   //nammlde downloads ilum same pole ahnu new & hot um,so athin vendi oru constructor create cheyuka

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
            title,style:GoogleFonts.montserrat(
          fontSize:30,fontWeight: FontWeight.bold
        )),
        const Spacer(),
        const Icon(Icons.cast,color: Colors.white,
        ),
        kWidth,
        Container(
          width: 30,
          height: 30,
          color:Colors.blueAccent,
        ),
        kWidth,
      ],
    );
  }
}
