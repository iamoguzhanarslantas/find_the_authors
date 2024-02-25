part of 'authors_cubit.dart';

@immutable
sealed class AuthorsState {
  const AuthorsState();
}

final class AuthorsInitial extends AuthorsState {}

final class AuthorsLoading extends AuthorsState {}

final class AuthorsLoaded extends AuthorsState {
  final AuthorsResponse? authorsList;
  const AuthorsLoaded(this.authorsList);
}

final class AuthorsError extends AuthorsState {
  final String? errorMessage;
  const AuthorsError(this.errorMessage);
}
