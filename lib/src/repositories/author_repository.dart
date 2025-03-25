import 'dart:io';

import 'package:dio/dio.dart';
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
    try {
      final response = await dio.get(
        APIEndPoints.kSearchAuthorsPath,
        queryParameters: {'q': query},
      );
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data as Map<String, dynamic>?;
        if (jsonBody != null &&
            (jsonBody['docs'] as List<dynamic>).isNotEmpty) {
          return AuthorsResponse.fromJson(jsonBody);
        }
        return null;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        throw Exception(
            'There is no internet connection. Please check your network.');
      } else {
        throw Exception('Request failed: ${e.message}');
      }
    }
  }

  @override
  Future<AuthorWorksResponse?> getAuthorWorks(String authorKey) async {
    try {
      final response = await dio.get(
        '${APIEndPoints.kAuthorsPath}/$authorKey${APIEndPoints.kWorksPath}.json',
      );
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data as Map<String, dynamic>?;
        return jsonBody != null ? AuthorWorksResponse.fromJson(jsonBody) : null;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        throw Exception('No internet connection. Please check your network.');
      } else {
        throw Exception('Request failed: ${e.message}');
      }
    }
  }
}
