import 'package:find_the_authors/src/blocs/authors/authors_cubit.dart'
    show AuthorsCubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorAlertDialog({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<AuthorsCubit>().returnToSearch();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
    return const SizedBox.shrink();
  }
}
