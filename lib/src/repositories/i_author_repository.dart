import 'package:dio/dio.dart';
import 'package:find_the_authors/src/models/models.dart'
    show AuthorsResponse, AuthorWorksResponse;

abstract class IAuthorRepository {
  final Dio dio;

  IAuthorRepository(this.dio);
  Future<AuthorsResponse?> getAuthors(String query);
  Future<AuthorWorksResponse?> getAuthorWorks(String authorKey);
}
