// import 'package:flutter/material.dart';
//
// import '../core/colors/constants.dart';
// import '../presentataion/search/widget/search_result.dart';
// import 'main_title.dart';
//
// class MainTitleCard extends StatelessWidget {
//   const MainTitleCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MainTitle(
//           title:"Released in the past year",
//         ),
//         kheight,
//         //listview chumma kodutapo nammlde screen black aaii poi ,apo nammal oru limited box koduta mati
//         LimitedBox(
//           maxHeight: 200,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: List.generate(
//               10,
//                   (index) =>  MainCard(),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
//
