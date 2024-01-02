import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/colors/constants.dart';
import '../../home/custom_vutton_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String url;
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    super.key, required this.id, required this.month, required this.day, required this.posterpath, required this.movieName, required this.description, required this.url,
  });


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(width: 50,height:500,child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(month,style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueGrey)
            ),
            Text(day,style: TextStyle(
                fontSize: 30,letterSpacing: 2,
                fontWeight: FontWeight.bold
            ),)
          ],
        ),
        ),
        Stack(
          children: [
            SizedBox(
              width: size.width-50,
              height: 500,
              child: Column(
              children: [
                Container(
                  width: double.infinity,height: 200,color: Colors.black,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            ),
            Positioned(
              bottom: 300,
              right: 10,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off,color: kWhiteColor,size: 20,
                    )
                ),
              ),
            ),
            Positioned(
                top:200,
                left:0,
                child: Text(movieName,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
            ),
            Spacer(),
            Positioned(
              top:200,
              right: 10,
              child: Row(
                children: [
                  CustomButtonWidget(icon:Icons.all_out_sharp, title: "Remind Me",
                    textSize: 10,iconSize: 20,),
                  kWidth,
                  CustomButtonWidget(icon:Icons.info, title: "info",
                    textSize: 10,iconSize: 20,)
                ],
              ),
            ),
            Positioned(
              top:250,
              child: Row(
                children: [
                  Text("Coming On $day $month"),
                  kheight,
                ],
              ),
            ),
            Positioned(
                top: 280,
                child: Text(
                  movieName,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            ),
            Positioned(
                top: 300,
                child: Text(description,style:TextStyle(fontSize:15,color: Colors.grey),))
          ],
        ),
      ],
    );
  }
}