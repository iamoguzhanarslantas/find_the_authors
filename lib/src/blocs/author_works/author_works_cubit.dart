import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_the_authors/src/models/models.dart'
    show AuthorWorksResponse;
import 'package:find_the_authors/src/repositories/repositories.dart'
    show IAuthorRepository;

part 'author_works_state.dart';

class AuthorWorksCubit extends Cubit<AuthorWorksState> {
  AuthorWorksCubit({required this.repository}) : super(AuthorWorksInitial());

  final IAuthorRepository repository;

  Future<void> getAuthorWorksList(String authorKey) async {
    emit(AuthorWorksLoading());
    try {
      final authorWorksList = await repository.getAuthorWorks(authorKey);
      if (authorWorksList == null) {
        emit(const AuthorWorksError('No Author Works Found!'));
        return;
      }
      emit(AuthorWorksLoaded(authorWorksList));
    } catch (e) {
      emit(AuthorWorksError(e.toString()));
    }
  }
}
