import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/models/models.dart';
import 'package:find_the_authors/src/repositories/repositories.dart'
    show AuthorRepository;

part 'authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  AuthorsCubit() : super(AuthorsInitial());

  Future<void> getAuthorsList(String query) async {
    emit(AuthorsLoading());
    try {
      final authorsList = await AuthorRepository().getAuthors(query);
      if (authorsList == null) {
        emit(const AuthorsError('Failed to load data'));
        return;
      }
      emit(AuthorsLoaded(authorsList));
    } catch (e) {
      emit(AuthorsError(e.toString()));
    }
  }
}
