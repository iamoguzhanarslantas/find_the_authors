import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_the_authors/src/constants/constants.dart'
    show APIEndPoints;
import 'package:find_the_authors/src/models/models.dart'
    show AuthorResponse, AuthorWorksResponse;
import 'package:find_the_authors/src/repositories/repositories.dart'
    show IAuthorRepository;

class AuthorRepository extends IAuthorRepository {
  @override
  Future<AuthorResponse?> getAuthors(String query) async {
    final response = await Dio().get(
        APIEndPoints.kBaseUrl + APIEndPoints.kSearchAuthorsPath,
        queryParameters: {'q': query});
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data as Map<String, dynamic>;
      return AuthorResponse.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  @override
  Future<AuthorWorksResponse?> getAuthorWorks(String authorKey) async {
    final response = await Dio().get(
      '${APIEndPoints.kBaseUrl + APIEndPoints.kAuthorsPath}/$authorKey${APIEndPoints.kWorksPath}.json',
    );
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data as Map<String, dynamic>;
      return AuthorWorksResponse.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
