import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/models/models.dart' show AuthorsResponse;
import 'package:find_the_authors/src/repositories/repositories.dart'
    show IAuthorRepository;

part 'authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  AuthorsCubit({required this.repository}) : super(AuthorsInitial());

  final IAuthorRepository repository;

  bool isUserSearch = true;

  Future<void> getAuthorsList({required String query}) async {
    emit(AuthorsLoading());
    try {
      final authorsList = await repository.getAuthors(query);
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
