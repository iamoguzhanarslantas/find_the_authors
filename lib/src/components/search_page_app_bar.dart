import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart' show AuthorsCubit;

class SearchPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Text appBarTitle(BuildContext context) =>
      context.watch<AuthorsCubit>().isUserSearch
          ? const Text('Find the Authors')
          : const Text('Authors');

  List<Widget> appBarActions(BuildContext context) =>
      context.watch<AuthorsCubit>().isUserSearch
          ? []
          : [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 40,
                ),
                onPressed: () {
                  context.read<AuthorsCubit>().returnToSearch();
                },
              ),
            ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appBarTitle(context),
      actions: appBarActions(context),
    );
  }
}
