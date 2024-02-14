import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart';
import 'package:find_the_authors/src/models/models.dart' show AuthorsResponse;
import 'package:find_the_authors/src/pages/pages.dart' show DetailsPage;
import 'package:find_the_authors/src/widgets/widgets.dart'
    show CustomListTile, CustomTextField;

class SearchPage extends StatelessWidget {
  static const String routeName = '/search';
  const SearchPage({super.key});

  List<Widget> actions(context) => context.watch<AuthorsCubit>().isUserSearch
      ? []
      : [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.read<AuthorsCubit>().returnToSearch();
            },
          ),
        ];

  Padding searchTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CustomTextField(
          labeltext: 'Search',
          prefix: const Icon(Icons.search),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              context.read<AuthorsCubit>().getAuthorsList(
                    query: value,
                  );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please type something to search!'),
                ),
              );
              return;
            }
          },
        ),
      ),
    );
  }

  ListView authorListViewBuilder(AuthorsResponse authorsList) {
    return ListView.builder(
      itemCount: authorsList.authors!.length,
      itemBuilder: (context, index) {
        final author = authorsList.authors![index];
        return CustomListTile(
          onTap: () {
            context
                .read<AuthorWorksCubit>()
                .getAuthorWorksList(authorKey: author.authorKey!)
                .then((value) => {
                      Navigator.pushNamed(
                        context,
                        DetailsPage.routeName,
                      )
                    });
          },
          title: Text('Author:${author.name!}'),
          subtitle: Text(
            'Author\'s Top Work:\n${author.topWork!}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Birth Date: ${author.birthDate!}'),
              Text('Death Date: ${author.deathDate!}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
        actions: actions(context),
      ),
      body: BlocBuilder<AuthorsCubit, AuthorsState>(
        builder: (context, state) {
          if (state is AuthorsInitial) {
            return searchTextField(context);
          } else if (state is AuthorsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorsLoaded) {
            final authorsList = state.authorsList!;
            return authorListViewBuilder(authorsList);
          } else if (state is AuthorsError) {
            return Center(
              child: Text(state.errorMessage!),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
