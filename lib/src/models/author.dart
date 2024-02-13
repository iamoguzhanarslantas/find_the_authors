class AuthorResponse {
  AuthorResponse({
    this.authors,
  });

  List<Author>? authors;

  factory AuthorResponse.fromJson(Map<String, dynamic> json) => AuthorResponse(
        authors: (json['docs'] as List<dynamic>)
            .map(
              (e) => Author.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  Map<String, dynamic> toJson(AuthorResponse instance) => <String, dynamic>{
        'docs': instance.authors,
      };
}

class Author {
  Author({
    this.authorKey,
    this.name,
    this.birthDate,
    this.deathDate,
    this.topWork,
  });

  String? authorKey;
  String? name;
  String? birthDate;
  String? deathDate;
  String? topWork;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        authorKey: json['key'] ?? 'No Author Key Info',
        name: json['name'] ?? 'No Name Info',
        birthDate: json['birth_date'] ?? 'No Birth Date Info',
        deathDate: json['death_date'] ?? 'No Death Date Info',
        topWork: json['top_work'] ?? 'No Top Work Info',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': authorKey,
        'name': name,
        'birth_date': birthDate,
        'death_date': deathDate,
        'top_work': topWork,
      };
}
