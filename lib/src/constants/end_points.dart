class APIEndPoints {
  APIEndPoints._();

  static const String kBaseUrl = 'https://openlibrary.org';
  static const String kSearchPath = '/search';
  static const String kAuthorsPath = '/authors';
  static const String kWorksPath = '/works';
  static const String kSearchAuthorsPath = '$kSearchPath$kAuthorsPath.json';
}
