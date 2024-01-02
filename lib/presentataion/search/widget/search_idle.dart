
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentataion/search/widget/title.dart';

import '../../../application/search/search_bloc.dart';
const imageUrl="https://i.pinimg.com/550x/cd/44/13/cd441305da6487ac06b84dfa445c6d9e.jpg";
class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});
@override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title:'Top Searches'),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
  builder: (context, state) {
    if(state.isLoading)
      {
        return Center(child: CircularProgressIndicator());
      }else if(state.isError){
      return Center(child:Text('Error While Getting Data'));
    }else if(state.idleList.isEmpty)
      {
        return Center(child:Text('List is empty'));
      }
    return ListView.separated(
 shrinkWrap: true,//etra elements undo athin anusarich ath height set cheytolum
  itemBuilder:(ctx,index){
final movie=state.idleList[index];
return TopSearchItemTile(title:movie.title??'No Title Provided', imageUrl:'$imageAppendUrl${movie.posterPath}');
  },
  separatorBuilder: (ctx,index)=>kheight,
  itemCount:state.idleList.length);
  },
),
        )
      ],
    );
  }
}
class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;

   TopSearchItemTile({super.key, required this.title, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth*0.35,
          height:65 ,
          decoration: BoxDecoration(
            image:DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(imageUrl)   
    )
          ),
        ),
        Expanded(child: Text(title,style: TextStyle(color:kWhiteColor,fontWeight: FontWeight.bold,fontSize: 15 ),
        )
        ),
     CircleAvatar(
       backgroundColor: kWhiteColor,
       radius: 25,
       child:  CircleAvatar(
    backgroundColor: kBlackColor,
    radius: 23,
    child: Icon(CupertinoIcons.play_fill,color: kWhiteColor),
     )
     )],
    );
  }
}
