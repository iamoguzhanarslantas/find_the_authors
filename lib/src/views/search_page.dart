import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart';
import 'package:find_the_authors/src/views/views.dart' show DetailsPage;
import 'package:find_the_authors/src/widgets/widgets.dart'
    show CustomListTile, CustomTextField;

class SearchPage extends StatelessWidget {
  static const String routeName = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<AuthorsCubit, AuthorsState>(
        builder: (context, state) {
          if (state is AuthorsInitial) {
            return CustomTextField(
              labeltext: 'Search',
              prefix: const Icon(Icons.search),
              onSubmitted: (value) {
                context.read<AuthorsCubit>().getAuthorsList(value);
              },
            );
          } else if (state is AuthorsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorsLoaded) {
            final authorsList = state.authorsList!;
            return ListView.builder(
              itemCount: authorsList.authors!.length,
              itemBuilder: (context, index) {
                final author = authorsList.authors![index];
                return CustomListTile(
                  onTap: () {
                    context
                        .read<AuthorWorksCubit>()
                        .getAuthorWorksList(author.authorKey!)
                        .then((value) => {
                              Navigator.pushNamed(
                                context,
                                DetailsPage.routeName,
                              )
                            });
                  },
                  title: Text(author.name!),
                  subtitle: Text(author.topWork!),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(author.birthDate!),
                      Text(author.deathDate!),
                    ],
                  ),
                );
              },
            );
          } else if (state is AuthorsError) {
            return const Center(
              child: Text('Search Error'),
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
