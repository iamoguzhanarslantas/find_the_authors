import 'package:find_the_authors/src/models/models.dart'
    show AuthorResponse, AuthorWorksResponse;

abstract class IAuthorRepository {
  Future<AuthorResponse?> getAuthors(String query);
  Future<AuthorWorksResponse?> getAuthorWorks(String authorKey);
}
