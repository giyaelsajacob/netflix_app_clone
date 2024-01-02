import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/domain/debounce/debounce.dart';
import 'package:netflix_app/presentataion/search/widget/search_idle.dart';
import 'package:netflix_app/presentataion/search/widget/search_result.dart';

import '../../core/colors/constants.dart';

const imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYyB40pNp-uiXT0LvISqCEH6IOk6rqYxzSY7y1tdHJoebQMbrOD0xNantfVDlMdhOUCjw&usqp=CAU";

class ScreenSearch extends StatelessWidget {
   ScreenSearch({super.key});
final _debouncer=Debouncer(milliseconds: 1*1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.5),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              if(value.isEmpty){
                return;
              }
              _debouncer.run(() {  //ith nammal chyathth search il namamlk venda movies search chyth nokukayanuu
                BlocProvider.of<SearchBloc>(context).add(
                    SearchMovie(movieQuery: value));});
              //ith nammal chyathth search il namamlk venda movies search chyth nokukayanuu
            },
          ),
          kheight,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if(state.searchResultList.isEmpty)
                {
                  return SearchIdleWidget();
                }
              else{
                return SearchResultWidget();
              }
            },
          )),
          // Expanded(child: SearchResultWidget()),
        ], //
      ),
    ), //
    );
  }
}
