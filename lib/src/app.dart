import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/blocs/blocs.dart'
    show AuthorWorksCubit, AuthorsCubit;
import 'package:find_the_authors/src/constants/constants.dart'
    show BaseURLExtension;
import 'package:find_the_authors/src/pages/pages.dart'
    show DetailsPage, SearchPage;
import 'package:find_the_authors/src/repositories/repositories.dart'
    show AuthorRepository;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorsCubit>(
          lazy: true,
          create: (context) => AuthorsCubit(
            repository: AuthorRepository(
              Dio().toBaseURL,
            ),
          ),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => AuthorWorksCubit(
            repository: AuthorRepository(
              Dio().toBaseURL,
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SearchPage.routeName,
        routes: {
          DetailsPage.routeName: (context) => const DetailsPage(),
          SearchPage.routeName: (context) => const SearchPage(),
        },
      ),
    );
  }
}
