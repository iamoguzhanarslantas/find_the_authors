import 'package:find_the_authors/src/components/error_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart';
import 'package:find_the_authors/src/components/components.dart'
    show DetailsPageAppBar, DetailsPageAuthorWorkResults;

class DetailsPage extends StatelessWidget {
  static const String routeName = '/details';
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsPageAppBar(),
      body: BlocBuilder<AuthorWorksCubit, AuthorWorksState>(
        builder: (context, state) {
          if (state is AuthorWorksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorWorksLoaded) {
            final authorWorksList = state.authorWorksList!;
            return DetailsPageAuthorWorkResults(
                authorWorksList: authorWorksList);
          } else if (state is AuthorWorksError) {
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
