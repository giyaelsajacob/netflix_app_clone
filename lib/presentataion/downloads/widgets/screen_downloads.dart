import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  //namlk aa circle avatar inte ulil 2 poster vekanum aa picture inte url; kodukanam

  @override
  Widget build(BuildContext context) {
    //to take the size of screen here we use mediaquery
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        //ivde appbar inte type preferred size widget ahnu
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: " Downloads ",
        ),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) => _widgetList[index],
          separatorBuilder: (ctx, index) => SizedBox(
                height: 25,
              ),
          itemCount: _widgetList.length),
    );
  }
}
//nammal screenine 3 section aait kodukuvanu,section 1 smartdownloads ahnu ath already undu,ini section 2 kodukam

// class Section2 extends StatelessWidget {
//   Section2({super.key});
//   @override
//   Widget build(BuildContext context) {
//     //section 2 en paranja event build cgythite ee downloads en paranja event call aaaku
//     //open akuna timil tanne pic varan,ororo samayavum build ayikond irkathe iiekan
//     // WidgetsBinding.instance!.addPostFrameCallback((_) {
//     // BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
//     // });
//     BlocProvider.of<DownloadsBloc>(context)
//         .add(const DownloadsEvent.getDownloadsImage());
//     final Size size = MediaQuery.of(context).size / 1.8;
//     //pagelot kadakuna timil namk image ine vilikanum,getdownloads image ahnu call cheynde
// //ui il vilikunath
// //     BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
//     return Column(
//       children: [
//         Text(
//           "Introducing Downloads For You",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         kheight,
//         Text(
//           "We Will Download A Personalized Selection Of \nMovies And Shows For You,So There's\n Always Something To Watch On Your\n Device ",
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Colors.grey, fontSize: 16),
//         ),
//         SizedBox(height: 60),
//         //ini naml 3 poster kanikanum rotate cheyunne
//         BlocBuilder<DownloadsBloc, DownloadsState>(
//             //serikum stack a use akande error varum apo toot munnile paraent,sized box eduth bloc builder kodukum
//             builder: (context, state) {
//           //if (state.downloads != null && state.downloads!.length >= 3) {
//             return SizedBox(
//               width: size.width,
//               height: size.height / 2,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       radius: size.width * 0.60,
//                       //withOpacity - transparent aakan
//                       backgroundColor: Colors.blueGrey.withOpacity(0.5),
//                     ),
//                   ),
//                   DownloadsImageWidget(
//                     imageList:'$imageAppendUrl${state.downloads[0].posterPath}',
//                       //  '$imageAppendUrl${state.downloads![0].posterPath}',
//                     margin: EdgeInsets.only(left: 110, bottom: 40, top: 50),
//                     angle: 20,
//                   ),
//                   DownloadsImageWidget(
//                     imageList:'$imageAppendUrl${state.downloads[1].posterPath}',
//                         //'$imageAppendUrl${state.downloads![1].posterPath}',
//                     margin: EdgeInsets.only(right: 110, bottom: 40, top: 50),
//                     angle: -20,
//                   ),
//                   DownloadsImageWidget(
//                       imageList:'$imageAppendUrl${state.downloads[2].posterPath}',
//                          //print('image ==>$imageAppendUrl${state.downloads[2].posterPath}'),
//                          // '$imageAppendUrl${state.downloads![2].posterPath}',
//                       margin: EdgeInsets.only(top: 0, bottom: 50),
//                   ),
//                 ],
//               ),
//             );
//          // }else{
//             return CircularProgressIndicator();
//           }
//         ),
//       ],
//     );
//   }
// }
class Section2 extends StatelessWidget {
  Section2({Key? key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());

    final Size size = MediaQuery.of(context).size / 1.8;

    return Column(
      children: [
        Text(
          "Introducing Downloads For You",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          "We Will Download A Personalized Selection Of \nMovies And Shows For You,So There's\n Always Something To Watch On Your\n Device ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(height: 60),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return CircularProgressIndicator();
            // } else if (state.downloadsFailureOrSuccessOption.isSome()) {
            //   print("ia faliure");
            //   final failure = state.downloadsFailureOrSuccessOption.getOrElse(() => throw Error());
            //
            //   // Print the error message
            //   print("Error loading downloads: ${failure}");
            //   return Text("Error loading downloads ${failure}");
            } else if (state.downloads.isNotEmpty) {
              // Check if downloads list is not empty
              return SizedBox(
                width: size.width,
                height: size.height / 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: size.width * 0.60,
                        backgroundColor: Colors.blueGrey.withOpacity(0.5),
                      ),
                    ),
                    DownloadsImageWidget(
                      imageList: '$imageAppendUrl${state.downloads[0].posterPath}',
                      margin: EdgeInsets.only(left: 110, bottom: 40, top: 50),
                      angle: 20,
                    ),
                    DownloadsImageWidget(
                      imageList: '$imageAppendUrl${state.downloads[1].posterPath}',
                      margin: EdgeInsets.only(right: 110, bottom: 40, top: 50),
                      angle: -20,
                    ),
                    DownloadsImageWidget(
                      imageList: '$imageAppendUrl${state.downloads[2].posterPath}',
                      margin: EdgeInsets.only(top: 0, bottom: 50),
                    ),
                  ],
                ),
              );
            } else {
              // Handle empty downloads case
              return Text("No downloads available");
            }
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See What You Can Download ",
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text("Smart Downloads"),
      ],
    );
  }
}

//ini namlk aa picture rotate akanum,apo nammalde container ine oru widget vech wrap cheyanum,athin transformrotate en koduknam
//Transform use aakiyal extract use aakanum
class DownloadsImageWidget extends StatelessWidget {
  var imageList;

  DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
  }) : super(key: key);

  //final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size / 2;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            //margin: margin,
            width: size.width * 0.45,
            height: size.width * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBlackColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
