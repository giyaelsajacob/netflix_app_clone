// import 'package:bordered_text/bordered_text.dart';
// import 'package:flutter/material.dart';
// import 'package:netflix_app/core/colors/colors.dart';
//
// import '../../core/colors/constants.dart';
//
// class NumberCard extends StatelessWidget {
//   const NumberCard({super.key, required this.index});
// final int index;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Stack(
//         //aadyum kedakuna widget stack inte adiyil arikum,pine kodukuna widget athinte mukalil varu
//         children: [
//           Row(
//             children: [
//               SizedBox(width: 30),
//               Container(
//                       width: 140,
//                       height: 250,
//                       decoration: BoxDecoration(
//                         borderRadius:kRadius20,
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                             image: NetworkImage("https://m.media-amazon.com/images/M/MV5BMTIzYzM0ZTktMDA1ZC00NTkwLWI0OGYtNDA0MTQ2ZmUyMTk2XkEyXkFqcGdeQXVyMTQ3Mzk2MDg4._V1_FMjpg_UX1000_.jpg",)
//                         ),
//
//                       )
//                   ),
//             ],
//
//           ),
//           Positioned(
//             left: 13,
//               bottom:15,
//               child: BorderedText(
//                 strokeWidth:10.0 ,
//                 strokeColor: kWhiteColor,
//                 child: Text(
//                     "${index+1}",
//                     style:TextStyle(
//                         fontSize:140,
//                         color:kBlackColor,
//                         fontWeight: FontWeight.bold,
//                         decoration: TextDecoration.none,
//                         decorationColor: Colors.black,
//                     )
//                 ),
//               )
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//



import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

import '../../core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        //aadyum kedakuna widget stack inte adiyil arikum,pine kodukuna widget athinte mukalil varu
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Container(
                  width: 140,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius:kRadius20,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                    ),

                  )
              ),
            ],

          ),
          Positioned(
              left: 13,
              bottom:15,
              child: BorderedText(
                strokeWidth:10.0 ,
                strokeColor: kWhiteColor,
                child: Text(
                    "${index+1}",
                    style:TextStyle(
                      fontSize:140,
                      color:kBlackColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.black,
                    )
                ),
              )
          )
        ],
      ),
    );
  }
}