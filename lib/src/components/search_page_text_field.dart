import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart' show AuthorsCubit;
import 'package:find_the_authors/src/widgets/widgets.dart' show CustomTextField;

class SearchPageTextField extends StatelessWidget {
  const SearchPageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CustomTextField(
          labeltext: 'Search Authors',
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
}
