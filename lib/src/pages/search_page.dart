import 'package:find_the_authors/src/components/error_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart';
import 'package:find_the_authors/src/components/components.dart'
    show SearchPageAppBar, SearchPageAuthorResults, SearchPageTextField;

class SearchPage extends StatelessWidget {
  static const String routeName = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchPageAppBar(),
      body: BlocBuilder<AuthorsCubit, AuthorsState>(
        builder: (context, state) {
          if (state is AuthorsInitial) {
            return const SearchPageTextField();
          } else if (state is AuthorsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorsLoaded) {
            final authorsList = state.authorsList!;
            return SearchPageAuthorResults(authorsList: authorsList);
          } else if (state is AuthorsError) {
            return ErrorAlertDialog(errorMessage: state.errorMessage!);
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
