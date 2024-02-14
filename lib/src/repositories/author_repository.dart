import 'dart:io';

import 'package:find_the_authors/src/constants/constants.dart'
    show APIEndPoints;
import 'package:find_the_authors/src/models/models.dart'
    show AuthorsResponse, AuthorWorksResponse;
import 'package:find_the_authors/src/repositories/repositories.dart'
    show IAuthorRepository;

class AuthorRepository extends IAuthorRepository {
  AuthorRepository(super.dio);

  @override
  Future<AuthorsResponse?> getAuthors(String query) async {
    final response = await dio
        .get(APIEndPoints.kSearchAuthorsPath, queryParameters: {'q': query});
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data as Map<String, dynamic>?;
      if ((jsonBody?['docs'] as List<dynamic>).isNotEmpty && jsonBody != null) {
        return AuthorsResponse.fromJson(jsonBody);
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  @override
  Future<AuthorWorksResponse?> getAuthorWorks(String authorKey) async {
    final response = await dio.get(
      '${APIEndPoints.kAuthorsPath}/$authorKey${APIEndPoints.kWorksPath}.json',
    );
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data as Map<String, dynamic>?;
      if (jsonBody == null) {
        return null;
      }
      return AuthorWorksResponse.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
