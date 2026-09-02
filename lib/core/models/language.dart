import 'package:portfolio_v2/core/models/enums/language_proficiency.dart';

class Language {
  final String language;
  final LanguageProficiency proficiency;
  const Language({required this.language, required this.proficiency});
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      language: json['language'] as String,
      proficiency: LanguageProficiency.values.byName(
        json['proficiency'] as String,
      ),
    );
  }
  Map<String, dynamic> toJson() => {
    'language': language,
    'proficiency': proficiency.name,
  };
  Language copyWith({String? language, LanguageProficiency? proficiency}) {
    return Language(
      language: language ?? this.language,
      proficiency: proficiency ?? this.proficiency,
    );
  }
}
