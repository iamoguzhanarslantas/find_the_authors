part of 'author_works_cubit.dart';

abstract class AuthorWorksState {
  const AuthorWorksState();
}

class AuthorWorksInitial extends AuthorWorksState {}

class AuthorWorksLoading extends AuthorWorksState {}

class AuthorWorksLoaded extends AuthorWorksState {
  final AuthorWorksResponse? authorWorksList;
  const AuthorWorksLoaded(this.authorWorksList);
}

class AuthorWorksError extends AuthorWorksState {
  final String? errorMessage;
  const AuthorWorksError(this.errorMessage);
}
