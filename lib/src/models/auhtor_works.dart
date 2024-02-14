class AuthorWorksResponse {
  AuthorWorksResponse({
    this.authorWorks,
  });

  List<AuthorWork>? authorWorks;

  factory AuthorWorksResponse.fromJson(Map<String, dynamic> json) =>
      AuthorWorksResponse(
        authorWorks: (json['entries'] as List<dynamic>)
            .map(
              (e) => AuthorWork.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  Map<String, dynamic> toJson(AuthorWorksResponse instance) =>
      <String, dynamic>{
        'entries': instance.authorWorks,
      };
}

class AuthorWork {
  AuthorWork({
    this.title,
  });

  String? title;

  factory AuthorWork.fromJson(Map<String, dynamic> json) => AuthorWork(
        title: json['title'] ?? 'No Title Info',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
      };
}
