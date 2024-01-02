//
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netflix_app/application/home/home_bloc.dart';
// import 'package:netflix_app/presentataion/home/background_card.dart';
// import '../../core/colors/constants.dart';
// import '../../widgets/main_card.dart';
// import '../../widgets/main_title.dart';
// import '../search/screen_search.dart';
// import 'number_card.dart';
//
// //boolean value store cheyan vendi namk oru value ine declare cheyan patum and on aai varumbol thanne display cheyth kanikan vendi false mati true aakunu
// ValueNotifier<bool>scrollNotifier=ValueNotifier(true);
//
// class ScreenHome extends StatelessWidget {
//   const ScreenHome({super.key, required this.posterList});
//   final List<String>posterList;
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
//     });
//     return Scaffold(
//         body: ValueListenableBuilder(
//           valueListenable: scrollNotifier,
//           builder: (BuildContext context, index, _){
//             return NotificationListener<UserScrollNotification>(
//               onNotification: (notification) {
//                 final ScrollDirection direction = notification.direction;
//                 print(direction);
//                 if (direction == ScrollDirection.reverse) {
//                   scrollNotifier.value = false;
//                 } else if (direction == ScrollDirection.forward) {
//                   scrollNotifier.value = true;
//                 }
//                 return true;
//               },
//               child: Stack(
//                 children: [
//                   BlocBuilder<HomeBloc, HomeState>(
//   builder: (context, state) {
// if(state.isLoading){
//   return Center(child: CircularProgressIndicator(strokeWidth: 2,));
// }
//     else if(state.hasError)
//       {
// return Center(child: Text('error while getting data',style: TextStyle(color: Colors.white),));
//       }
//     //1 list il nin vere 1 list create aakan map
//
// //releases past year
//     final _releasedPastYear=state.pastYearMovieList.map((m)
//     {
//      // print('Released Past Year Image URL: $imageUrl');
//       //return imageUrl;
//       print('${m.posterPath}');
//       return '$imageAppendUrl${m.posterPath}';
//     }).toList();
//     //trending
//     final _trending=state.trendingMovieList.map((m)
//     {
//       return '$imageAppendUrl${m.posterPath}';
//     }).toList();
//     //tense dramas
//     final _tenseDramas=state.tenseDramaMovieList.map((m)
//     {
//       return '$imageAppendUrl${m.posterPath}';
//     }).toList();
//     //south indian movies
//     final _southIndianMovies=state.southIndianMovieList.map((m)
//     {
//       return '$imageAppendUrl${m.posterPath}';
//     }).toList();
//     _southIndianMovies.shuffle();
//     return SingleChildScrollView(
//                     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       BackgroundCard(),
//                       MainTitle(
//                         title: "Released in the past year",
//                       ),
//                       kheight20,
//                       //listview chumma kodutapo nammlde screen black aaii poi ,apo nammal oru limited box koduta mati
//                       LimitedBox(
//                         maxHeight: 200,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: List.generate(
//                             posterList.length,
//                                 (index) => MainCard(imageUrl:posterList[index], posterList: _releasedPastYear, title: 'Released in the past year',),
//                           ),
//                         ),
//                       ),
//                       kheight,
//                       SingleChildScrollView(
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 MainTitle(
//                                   title: "Trending Now",
//                                 ),
//                                 kheight20,
//                                 //listview chumma kodutapo nammlde screen black aaii poi ,apo nammal oru limited box koduta mati
//                                 LimitedBox(
//                                   maxHeight: 200,
//                                   child: ListView(
//                                     scrollDirection: Axis.horizontal,
//                                     children: List.generate(
//                                       posterList.length,
//                                           (index) => MainCard(imageUrl: posterList[index], title: 'Trending Now', posterList:_trending),
//                                     ),
//                                   ),
//                                 ),
//                                 kheight20,
//                                 SingleChildScrollView(
//                                   child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         MainTitle(
//                                           title: "Top 10 TV show Today",
//                                         ),
//                                         kheight20,
//                                         //listview chumma kodutapo nammlde screen black aaii poi ,apo nammal oru limited box koduta mati
//                                         LimitedBox(
//                                           maxHeight: 200,
//                                           child: ListView(
//                                             scrollDirection: Axis.horizontal,
//                                             children: List.generate(
//                                                 10, (index) => NumberCard(index: index)),
//                                           ),
//                                         ),
//                                         kheight20,
//                                         SingleChildScrollView(
//                                           child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 MainTitle(
//                                                   title: "Tense Drama",
//                                                 ),
//                                                 kheight,
//                                                 //listview chumma kodutapo nammlde screen black aaii poi ,apo nammal oru limited box koduta mati
//                                                 LimitedBox(
//                                                   maxHeight: 200,
//                                                   child: ListView(
//                                                     scrollDirection: Axis.horizontal,
//                                                     children: List.generate(
//                                                       posterList.length,
//                                                           (index) => MainCard(imageUrl: posterList[index], title: 'Tense Drama', posterList:  _tenseDramas),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 kheight20,
//                                                 SingleChildScrollView(
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                     children: [
//                                                       MainTitle(
//                                                         title: "South Indian Cinema",
//                                                       ),
//                                                       kheight20,
//                                                       //listview chumma kodutapo nammlde screen black aaii poi ,apo nammal oru limited box koduta mati
//                                                       LimitedBox(
//                                                         maxHeight: 200,
//                                                         child: ListView(
//                                                           scrollDirection: Axis.horizontal,
//                                                           children: List.generate(
//                                                             posterList.length,
//                                                                 (index) => MainCard(imageUrl: posterList[index], title: 'South Indian Cinema', posterList:_southIndianMovies),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]),
//                                         )
//                                       ]),
//                                 ),
//                               ]
//                           )
//                       )
//                     ]),
//                   );
//   },
// ),
//                   scrollNotifier.value==true?
//                   AnimatedContainer(
//                     duration: Duration(milliseconds:1000),
//                     width: double.infinity,
//                     height: 90,
//                     color: Colors.black.withOpacity(0.3),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Image.network("https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",width: 60,height: 60,
//                             ),
//                             const Spacer(),
//                             const Icon(Icons.cast,color: Colors.white,
//                             ),
//                             kWidth,
//                             Container(
//                               width: 30,
//                               height: 30,
//                               color:Colors.blueAccent,
//                             ),
//                             kWidth,
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text("TV Shows",style: kHomeTitleText),
//                             Text("Movies",style: kHomeTitleText),
//                             Text("Categories",style: kHomeTitleText),
//                           ],
//                         )
//                       ],
//                     ),
//
//                   ):kheight
//                 ],
//               ),
//             );
//
//           },
//
//         )
//     );
//   }
// }
//
// //.sublist koduthal namalk lennth paranj kodukan patun





import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/presentataion/home/background_card.dart';
import '../../core/colors/constants.dart';
import '../../widgets/main_card.dart';
import '../../widgets/main_title.dart';
import '../search/screen_search.dart';
import 'number_card.dart';

// Boolean value store cheyan vendi namk oru value ine declare cheyan patum and on aai varumbol thanne display cheyth kanikan vendi false mati true aakunu
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key, required this.posterList, required this.postersList}) : super(key: key);
  final List<String> posterList;
final List<String>postersList;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator(strokeWidth: 2));
                    } else if (state.hasError) {
                      return Center(child: Text('Error while getting data', style: TextStyle(color: Colors.white)));
                    }

                    // 1 list il nin vere 1 list create aakan map

                    // Releases past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      print('${m.posterPath}');
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // Trending
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // Tense dramas
                    final _tenseDramas = state.tenseDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // South Indian movies
                    final _southIndianMovies = state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();



                  //top10movies
                    final top10TvShow=state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    top10TvShow.shuffle();

                    print(top10TvShow.length);

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BackgroundCard(),
                          MainTitle(
                            title: "Released in the past year",
                          ),
                          kheight20,
                          // Listview chumma kodutapo nammlde screen black aaii poi, apo nammal oru limited box koduta mati
                          LimitedBox(
                            maxHeight: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                _releasedPastYear.length,
                                    (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    _releasedPastYear[index],
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight,
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTitle(
                                  title: "Trending Now",
                                ),
                                kheight20,
                                // Listview chumma kodutapo nammlde screen black aaii poi, apo nammal oru limited box koduta mati
                                LimitedBox(
                                  maxHeight: 200,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                      _trending.length,
                                          (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          _trending[index],
                                          width: 100,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                kheight20,
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTitle(
                                        title: "Top 10 TV show Today",
                                      ),
                                      kheight20,
                                      // Listview chumma kodutapo nammlde screen black aaii poi, apo nammal oru limited box koduta mati
                                      LimitedBox(
                                        maxHeight: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                            top10TvShow.length,
                                                (index) {
                                              final imageUrl = top10TvShow[index];
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: NumberCard(index: index, imageUrl: imageUrl),
                                              );
                                            },
                                          ),
                                        ),
                                      ),

                                      kheight20,
                                      SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MainTitle(
                                              title: "Tense Drama",
                                            ),
                                            kheight,
                                            // Listview chumma kodutapo nammlde screen black aaii poi, apo nammal oru limited box koduta mati
                                            LimitedBox(
                                              maxHeight: 200,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: List.generate(
                                                  _tenseDramas.length,
                                                      (index) => Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Image.network(
                                                      _tenseDramas[index],
                                                      width: 100,
                                                      height: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            kheight20,
                                            SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MainTitle(
                                                    title: "South Indian Cinema",
                                                  ),
                                                  kheight20,
                                                  // Listview chumma kodutapo nammlde screen black aaii poi, apo nammal oru limited box koduta mati
                                                  LimitedBox(
                                                    maxHeight: 200,
                                                    child: ListView(
                                                      scrollDirection: Axis.horizontal,
                                                      children: List.generate(
                                                        _southIndianMovies.length,
                                                            (index) => Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Image.network(
                                                            _southIndianMovies[index],
                                                            width: 100,
                                                            height: 150,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  width: double.infinity,
                  height: 90,
                  color: Colors.black.withOpacity(0.3),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            "https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",
                            width: 60,
                            height: 60,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.cast,
                            color: Colors.white,
                          ),
                          kWidth,
                          Container(
                            width: 30,
                            height: 30,
                            color: Colors.blueAccent,
                          ),
                          kWidth,
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("TV Shows", style: kHomeTitleText),
                          Text("Movies", style: kHomeTitleText),
                          Text("Categories", style: kHomeTitleText),
                        ],
                      )
                    ],
                  ),
                )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}