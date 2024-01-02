import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentataion/new_and_hot/widgets/coming_soon_widget.dart';

import '../../core/colors/constants.dart';
import '../home/custom_vutton_widget.dart';


class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});


  @override
  Widget build(BuildContext context) {
    //ipo namml scaffold wrap chythath tab kanikan vendi ahnu tab varanum enkil nammal length mention cheynum
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            //ivde appbar inte type preferred size widget ahnu
            preferredSize: Size.fromHeight(90),
            child: AppBar(
              title: Text(
                  "New & hOT",
                  style: GoogleFonts.montserrat(
                      fontSize: 30, fontWeight: FontWeight.bold
                  )
              ),
              actions: [
                const Icon(Icons.cast, color: Colors.white,
                ),
                kWidth,
                Container(
                  width: 30,
                  height: 40,
                  color: Colors.blueAccent,
                ),
                kWidth,
              ],
              bottom: TabBar(
                labelColor: kBlackColor,
                unselectedLabelColor: kWhiteColor,
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 16),
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: [
                  Tab(
                    text: "🍟 Coming Soon",
                  ),
                  Tab(
                    text: "👀Everyone's Watching",
                  ),
                ],
                indicatorColor: Colors.black,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ComingSoonList(key: Key('coming_soon')),
              EveryonesWatchingList(key: Key('everyones_watching')),// data persist cheyn vedni ahnu coming soon key en koduthe
              _buildEveryonesWatching(),
              // _buildTabBarView("Coming Soon"),
              // _buildTabBarView("EveryOne's Watching"),
            ],
          )
      ),
    );
  }



 Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 15,
       itemBuilder: (BuildContext context,index)=>SizedBox());
 }


}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInEveryOneWatching());
    });

    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator(strokeWidth: 2));
        } else if (state.hasError) {
          return Center(child: Text('Error While Loading Every One Watching List'));
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return Center(child: Text('Every One Watching List Is Empty'));
        } else {
          return ListView.builder(
            itemCount: state.everyOneIsWatchingList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.everyOneIsWatchingList[index];
              if (movie.id == null) {
                return SizedBox();
              }
              print("Movie Title: ${movie.originalLanguage}");
              return EveryonesWatchingWidget(
                posterpath: '$imageAppendUrl${movie.posterPath}',
                name: movie.originalLanguage?? 'No title', // Updated this line
                description: movie.overview ?? 'No Description',
                url: '$imageAppendUrl${movie.posterPath}',
              );
            },
          );
        }
      },
    );
  }
}


//build coming soon oeu stateless widget aait chyamm,function ezhutunnathilum nallath widget aait cheyunnne ahnnu

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
      if(state.isLoading){
        return Center(child: CircularProgressIndicator(strokeWidth: 2,));
      }else if(state.hasError)
      {
        return Center(child: Text('Error While Loading Coming Soon List'));
      }else if(state.comingSoonList.isEmpty){
        return Center(child: Text('Coming Soon List Is Empty'));
      }else{
        return ListView.builder(
          itemCount:state.comingSoonList.length,
          itemBuilder: (BuildContext context, index) {
final movie=state.comingSoonList[index];
if(movie.id==null)

  {
    return SizedBox();
  }
// print(movie.releaseDate);
// final _date=DateTime.parse(movie.releaseDate);
// final formatedDate= DateFormat.yMMMMd('en_US').format(_date);
// print(formatedDate);
return ComingSoonWidget(
  id: movie.id.toString(),
              month: 'MAR',
              day: '11',
              posterpath:'$imageAppendUrl${movie.posterPath}',
              movieName:movie.originalTitle??'No title',
              description: movie.overview??'No Description', url: '$imageAppendUrl${movie.posterPath}');
          }
            );
      }
      },
    );
  }
}


class EveryonesWatchingWidget extends StatelessWidget {
  final String posterpath;
  final String name;
  final String description;

  const EveryonesWatchingWidget({
    Key? key,
    required this.posterpath,
    required this.description,
    required this.name,
    required String url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          name, // Ensure this is correct
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
          description,
          style: TextStyle(color: Colors.grey),
        ),
        kheight,
        kheight,
        kheight,
        kheight,
        Stack(
          children: [
            Image.network(
              '$posterpath',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            Positioned(
              top: 250,
              left: 350,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.volume_off_outlined),
              ),
            ),
          ],
        ),
        kheight,
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(icon: Icons.share, title: "Share"),
              kWidth,
              CustomButtonWidget(icon: Icons.add, title: "My List"),
              kWidth,
              CustomButtonWidget(icon: Icons.play_arrow, title: "Play"),
            ],
          ),
        )
      ],
    );
  }
}


