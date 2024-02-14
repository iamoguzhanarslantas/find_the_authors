import 'package:find_the_authors/src/models/models.dart'
    show AuthorsResponse, AuthorWorksResponse;

abstract class IAuthorRepository {
  Future<AuthorsResponse?> getAuthors(String query);
  Future<AuthorWorksResponse?> getAuthorWorks(String authorKey);
}
