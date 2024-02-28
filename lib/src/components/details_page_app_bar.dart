import 'package:flutter/material.dart';

class DetailsPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Text appBarTitle(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Text('$args\'s Works');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appBarTitle(context),
    );
  }
}
