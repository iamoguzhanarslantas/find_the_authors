import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart' show AuthorWorksCubit;
import 'package:find_the_authors/src/models/models.dart' show AuthorsResponse;
import 'package:find_the_authors/src/pages/pages.dart' show DetailsPage;
import 'package:find_the_authors/src/widgets/widgets.dart' show CustomListTile;

class SearchPageAuthorResults extends StatelessWidget {
  const SearchPageAuthorResults({super.key, required this.authorsList});
  final AuthorsResponse authorsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: authorsList.authors!.length,
      itemBuilder: (context, index) {
        final author = authorsList.authors![index];
        return Card(
          child: CustomListTile(
            onTap: () {
              context
                  .read<AuthorWorksCubit>()
                  .getAuthorWorksList(authorKey: author.authorKey!);
              Navigator.pushNamed(
                context,
                DetailsPage.routeName,
                arguments: author.name,
              );
            },
            title: Text(
              'Author: ${author.name!}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            subtitle: Text(
              'Author\'s Top Work:\n${author.topWork!}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Birth Date:'),
                Text(author.birthDate!),
                const Text('Death Date:'),
                Text(author.deathDate!),
              ],
            ),
          ),
        );
      },
    );
  }
}
