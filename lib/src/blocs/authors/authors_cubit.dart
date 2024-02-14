import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/models/models.dart' show AuthorsResponse;
import 'package:find_the_authors/src/repositories/repositories.dart'
    show AuthorRepository;

part 'authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  AuthorsCubit() : super(AuthorsInitial());

  bool isUserSearch = true;

  Future<void> getAuthorsList(String query) async {
    emit(AuthorsLoading());
    try {
      final authorsList = await AuthorRepository().getAuthors(query);
      if (authorsList == null) {
        emit(const AuthorsError('No Authors Found!'));
        isUserSearch = false;
        return;
      }
      emit(AuthorsLoaded(authorsList));
      isUserSearch = false;
    } catch (e) {
      emit(AuthorsError(e.toString()));
    }
  }

  void returnToSearch() {
    emit(AuthorsInitial());
    isUserSearch = true;
  }
}
