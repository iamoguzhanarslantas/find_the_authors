part of 'author_works_cubit.dart';

@immutable
sealed class AuthorWorksState extends Equatable {
  const AuthorWorksState();

  @override
  List<Object> get props => [];
}

final class AuthorWorksInitial extends AuthorWorksState {}

final class AuthorWorksLoading extends AuthorWorksState {}

final class AuthorWorksLoaded extends AuthorWorksState {
  final AuthorWorksResponse? authorWorksList;
  const AuthorWorksLoaded(this.authorWorksList);

  @override
  List<Object> get props => [authorWorksList!];
}

final class AuthorWorksError extends AuthorWorksState {
  final String? errorMessage;
  const AuthorWorksError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage!];
}
