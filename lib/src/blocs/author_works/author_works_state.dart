part of 'author_works_cubit.dart';

@immutable
sealed class AuthorWorksState {
  const AuthorWorksState();
}

final class AuthorWorksInitial extends AuthorWorksState {}

final class AuthorWorksLoading extends AuthorWorksState {}

final class AuthorWorksLoaded extends AuthorWorksState {
  final AuthorWorksResponse? authorWorksList;
  const AuthorWorksLoaded(this.authorWorksList);
}

final class AuthorWorksError extends AuthorWorksState {
  final String? errorMessage;
  const AuthorWorksError(this.errorMessage);
}
