// // import 'package:flutter/material.dart';
// // import 'package:netflix_app/presentataion/downloads/widgets/screen_downloads.dart';
// // import 'package:netflix_app/presentataion/fast_laugh/screen_fast_laugh.dart';
// // import 'package:netflix_app/presentataion/home/screen_home.dart';
// // import 'package:netflix_app/presentataion/main_page/widgets/bottom_navigation.dart';
// // import 'package:netflix_app/presentataion/new_and_hot/screen_new_and_hot.dart';
// // import 'package:netflix_app/presentataion/search/screen_search.dart';
// //
// // class ScreenMainPage extends StatelessWidget {
// //   final List<String> releasedPastYear;
// //
// //   ScreenMainPage({Key? key, required this.releasedPastYear}) : super(key: key);
// //   //ithipo nammal ivde valuelistenable builder use cheythath oroor bottom navigation marumbolum nammalde screen maran vendi,ithin vedni oru list create cheyanum.
// //   final _pages = [
// //     ScreenHome(posterList:_releasedPastYear.sublist(0,10),),
// //     ScreenNewandHot(),
// //     ScreenFastLaugh(),
// //     ScreenSearch(),
// //     ScreenDownloads()
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       //ithipo nammal ivde valuelistenable builder use cheythath oroor bottom navigation marumbolum nammalde screen maran vendi
// //       body: SafeArea(
// //         child: ValueListenableBuilder(
// //           valueListenable: indexChangeNotifier,
// //           builder: (context, int index, _) {
// //             return _pages[index];
// //           },
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationWidget(),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:netflix_app/presentataion/downloads/widgets/screen_downloads.dart';
// import 'package:netflix_app/presentataion/fast_laugh/screen_fast_laugh.dart';
// import 'package:netflix_app/presentataion/home/screen_home.dart';
// import 'package:netflix_app/presentataion/main_page/widgets/bottom_navigation.dart';
// import 'package:netflix_app/presentataion/new_and_hot/screen_new_and_hot.dart';
// import 'package:netflix_app/presentataion/search/screen_search.dart';
//
// class ScreenMainPage extends StatelessWidget {
//   final List<String> releasedPastYear;
//   final List<String> top10TvShow;
//   ScreenMainPage({Key? key, required this.releasedPastYear, required this.top10TvShow}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final _pages = [
//       ScreenHome(posterList: releasedPastYear, postersList:top10TvShow ),
//       ScreenNewandHot(),
//       ScreenFastLaugh(),
//       ScreenSearch(),
//       ScreenDownloads(),
//     ];
//
//     return Scaffold(
//       body: SafeArea(
//         child: ValueListenableBuilder(
//           valueListenable: indexChangeNotifier, // Assuming this is defined somewhere
//           builder: (context, int index, _) {
//             return _pages[index];
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationWidget(),
//     );
//   }
// }
//


// import 'package:flutter/material.dart';
// import 'package:netflix_app/presentataion/downloads/widgets/screen_downloads.dart';
// import 'package:netflix_app/presentataion/fast_laugh/screen_fast_laugh.dart';
// import 'package:netflix_app/presentataion/home/screen_home.dart';
// import 'package:netflix_app/presentataion/main_page/widgets/bottom_navigation.dart';
// import 'package:netflix_app/presentataion/new_and_hot/screen_new_and_hot.dart';
// import 'package:netflix_app/presentataion/search/screen_search.dart';
//
// class ScreenMainPage extends StatelessWidget {
//   final List<String> releasedPastYear;
//   final List<String> top10TvShow;
//
//   ScreenMainPage({Key? key, required this.releasedPastYear, required this.top10TvShow}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final _pages = [
//       ScreenHome(posterList: releasedPastYear, postersList: top10TvShow),
//       ScreenNewandHot(),
//       ScreenFastLaugh(),
//       ScreenSearch(),
//       ScreenDownloads(),
//     ];
//
//     return Scaffold(
//       body: SafeArea(
//         child: ValueListenableBuilder(
//           valueListenable: indexChangeNotifier, // Assuming this is defined somewhere
//           builder: (context, int index, _) {
//             return _pages[index];
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationWidget(),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:netflix_app/presentataion/downloads/widgets/screen_downloads.dart';
import 'package:netflix_app/presentataion/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_app/presentataion/home/screen_home.dart';
import 'package:netflix_app/presentataion/main_page/widgets/bottom_navigation.dart';
import 'package:netflix_app/presentataion/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/presentataion/search/screen_search.dart';

import '../../../core/colors/constants.dart';

class ScreenMainPage extends StatelessWidget {
  final List<String> releasedPastYear;
  final List<String> top10TvShow;

  ScreenMainPage({Key? key, required this.releasedPastYear, required this.top10TvShow}) : super(key: key);

  late List<String> _top10TvShow;

  final _pages = [
    ScreenHome(posterList: [], postersList: []),
    ScreenNewandHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    _top10TvShow = top10TvShow.map((t) {
      return '$imageAppendUrl$t';
    }).toList();
    _top10TvShow.shuffle();

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier, // Assuming this is defined somewhere
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
