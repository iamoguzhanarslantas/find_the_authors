part of 'authors_cubit.dart';

abstract class AuthorsState {
  const AuthorsState();
}

class AuthorsInitial extends AuthorsState {}

class AuthorsLoading extends AuthorsState {}

class AuthorsLoaded extends AuthorsState {
  final AuthorResponse? authorsList;
  const AuthorsLoaded(this.authorsList);
}

class AuthorsError extends AuthorsState {
  final String? errorMessage;
  const AuthorsError(this.errorMessage);
}
