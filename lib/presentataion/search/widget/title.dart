import 'package:flutter/material.dart';
//namml extract chyunnath ee top search um matte adutha page um orupole ahnu ath komd ahnu

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize:22,
          fontWeight:FontWeight.bold
      ),
    );
  }
}
