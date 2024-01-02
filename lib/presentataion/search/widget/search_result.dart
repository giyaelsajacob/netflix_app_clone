import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/presentataion/search/screen_search.dart';
import 'package:netflix_app/presentataion/search/widget/title.dart';

import '../../../application/search/search_bloc.dart';
import '../../../core/colors/constants.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title:'Movies & TV'),
        kheight,
        //crosssaxiscount=horizontal aait,builder use cheyunnath count ariyathapo,count ariyuvanel count use aakam
        Expanded(
        child: BlocBuilder<SearchBloc, SearchState>(
    builder: (context, state) {
    final searchResults = state.searchResultList;

    if (searchResults.isEmpty) {
    return Center(
    child: Text('No search results.'),
    );
    }

    return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 1 / 1.4, //width/height
    ),
    shrinkWrap: true,
    itemCount: searchResults.length,
    itemBuilder: (context, index) {
    final movie = searchResults[index];
    return MainCard(imageUrl: movie.posterImageUrl);
    },
    );
    },
    ),
    ),
    ]);
  }
}
class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover),
borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}
