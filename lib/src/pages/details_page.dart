import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart';
import 'package:find_the_authors/src/widgets/widgets.dart' show CustomListTile;

class DetailsPage extends StatelessWidget {
  static const String routeName = '/details';
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Author Works'),
      ),
      body: BlocBuilder<AuthorWorksCubit, AuthorWorksState>(
        builder: (context, state) {
          if (state is AuthorWorksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorWorksLoaded) {
            final authorWorksList = state.authorWorksList!;
            return ListView.builder(
              itemCount: authorWorksList.authorWorks!.length,
              itemBuilder: (context, index) {
                final authorWorks = authorWorksList.authorWorks![index];
                return CustomListTile(
                  title: Text(authorWorks.title!),
                );
              },
            );
          } else if (state is AuthorWorksError) {
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
