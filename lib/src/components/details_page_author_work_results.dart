import 'package:flutter/material.dart';

import 'package:find_the_authors/src/models/models.dart'
    show AuthorWorksResponse;
import 'package:find_the_authors/src/widgets/widgets.dart' show CustomListTile;

class DetailsPageAuthorWorkResults extends StatelessWidget {
  const DetailsPageAuthorWorkResults(
      {super.key, required this.authorWorksList});

  final AuthorWorksResponse authorWorksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: authorWorksList.authorWorks!.length,
      itemBuilder: (context, index) {
        final authorWorks = authorWorksList.authorWorks![index];
        return CustomListTile(
          title: Text('${index + 1}. ${authorWorks.title}'),
        );
      },
    );
  }
}
