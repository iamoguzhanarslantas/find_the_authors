class AuthorWorksResponse {
  AuthorWorksResponse({
    this.authorWorks,
  });

  List<AuthorWorks>? authorWorks;

  factory AuthorWorksResponse.fromJson(Map<String, dynamic> json) =>
      AuthorWorksResponse(
        authorWorks: (json['entries'] as List<dynamic>)
            .map(
              (e) => AuthorWorks.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  Map<String, dynamic> toJson(AuthorWorksResponse instance) =>
      <String, dynamic>{
        'entries': instance.authorWorks,
      };
}

class AuthorWorks {
  AuthorWorks({
    this.title,
  });

  String? title;

  factory AuthorWorks.fromJson(Map<String, dynamic> json) => AuthorWorks(
        title: json['title'] ?? 'No Title Info',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
      };
}
