part of 'authors_cubit.dart';

@immutable
sealed class AuthorsState extends Equatable {
  const AuthorsState();

  @override
  List<Object> get props => [];
}

final class AuthorsInitial extends AuthorsState {}

final class AuthorsLoading extends AuthorsState {}

final class AuthorsLoaded extends AuthorsState {
  final AuthorsResponse? authorsList;
  const AuthorsLoaded(this.authorsList);

  @override
  List<Object> get props => [authorsList ?? ''];
}

final class AuthorsError extends AuthorsState {
  final String? errorMessage;
  const AuthorsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage ?? ''];
}
