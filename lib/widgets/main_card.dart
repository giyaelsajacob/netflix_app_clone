import 'package:flutter/material.dart';
import '../core/colors/constants.dart';
class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    super.key, required this.imageUrl, required this.title, required this.posterList,
  });
  //namk title um ayaakanum image um ayakanum
  final String title;
  final List<String>posterList;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width:10 ),
        Container(
            width: 140,
            height: 200,
            decoration: BoxDecoration(
              borderRadius:kRadius20,
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(imageUrl)
              ),

            )
        ),
      ],
    );
  }
}
