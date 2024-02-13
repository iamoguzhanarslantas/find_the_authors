import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/models/models.dart';
import 'package:find_the_authors/src/repositories/repositories.dart'
    show AuthorRepository;

part 'author_works_state.dart';

class AuthorWorksCubit extends Cubit<AuthorWorksState> {
  AuthorWorksCubit() : super(AuthorWorksInitial());

  Future<void> getAuthorWorksList(String authorKey) async {
    emit(AuthorWorksLoading());
    try {
      final authorWorksList =
          await AuthorRepository().getAuthorWorks(authorKey);
      if (authorWorksList == null) {
        emit(const AuthorWorksError('Failed to load data'));
        return;
      }
      emit(AuthorWorksLoaded(authorWorksList));
    } catch (e) {
      emit(AuthorWorksError(e.toString()));
    }
  }
}
