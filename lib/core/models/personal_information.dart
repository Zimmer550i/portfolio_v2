import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'language.dart';
import 'media.dart';
import 'project.dart';
import 'resume.dart';
import 'skill.dart';
import 'social_link.dart';

/// Comprehensive, future-proof model for personal portfolio information.
@immutable
class PersonalInformation {
  final String id;
  final String fullName;

  final String? firstName;
  final String? lastName;
  final String? preferredName;
  final String? pronouns;

  final String headline;
  final String? subheadline;
  final String? tagline;

  final String? shortBio;
  final String? biography;
  final String? aboutMe;

  final String email;
  final List<String>? alternateEmails;
  final String? phone;
  final String? whatsapp;
  final String? telegram;

  final Media? avatar;
  final String? avatarUrl;
  final Media? coverImage;
  final String? coverImageUrl;

  final String? location;
  final String? city;
  final String? state;
  final String? country;
  final String? countryCode;
  final String? timeZone;

  final bool isOpenForWork;
  final bool isAvailableForFreelance;
  final bool isAvailableForFullTime;
  final bool isAvailableForConsulting;
  final bool isAvailableForRelocation;
  final bool isAvailableForRemote;
  final String? availabilityStatus;
  final DateTime? availableFrom;

  final double? yearsOfExperience;

  final String? website;
  final String? githubUrl;
  final String? linkedinUrl;
  final String? twitterUrl;
  final String? mediumUrl;
  final String? stackOverflowUrl;
  final String? youtubeUrl;
  final String? discordUsername;

  final String? quote;
  final String? quoteAuthor;
  final List<String>? interests;

  final List<Language>? languages;
  final List<Skill>? skills;
  final List<SocialLink>? socialLinks;
  final List<Resume>? resumes;

  final List<String>? featuredProjectIds;
  final List<Project>? featuredProjects;

  /// Open-ended metadata map for custom attributes, dynamic CMS integrations, and future expansion.
  final Map<String, dynamic>? metadata;

  const PersonalInformation({
    required this.id,
    required this.fullName,
    required this.headline,
    required this.email,
    this.firstName,
    this.lastName,
    this.preferredName,
    this.pronouns,
    this.subheadline,
    this.tagline,
    this.shortBio,
    this.biography,
    this.aboutMe,
    this.alternateEmails,
    this.phone,
    this.whatsapp,
    this.telegram,
    this.avatar,
    this.avatarUrl,
    this.coverImage,
    this.coverImageUrl,
    this.location,
    this.city,
    this.state,
    this.country,
    this.countryCode,
    this.timeZone,
    this.isOpenForWork = true,
    this.isAvailableForFreelance = true,
    this.isAvailableForFullTime = true,
    this.isAvailableForConsulting = true,
    this.isAvailableForRelocation = false,
    this.isAvailableForRemote = true,
    this.availabilityStatus,
    this.availableFrom,
    this.yearsOfExperience,
    this.website,
    this.githubUrl,
    this.linkedinUrl,
    this.twitterUrl,
    this.mediumUrl,
    this.stackOverflowUrl,
    this.youtubeUrl,
    this.discordUsername,
    this.quote,
    this.quoteAuthor,
    this.interests,
    this.languages,
    this.skills,
    this.socialLinks,
    this.resumes,
    this.featuredProjectIds,
    this.featuredProjects,
    this.metadata,
  });

  /// The name preferred for display (e.g. nickname or full name).
  String get displayName => preferredName?.trim().isNotEmpty == true ? preferredName! : fullName;

  /// User initials derived from name (e.g. "WI").
  String get initials {
    if (firstName != null && lastName != null && firstName!.isNotEmpty && lastName!.isNotEmpty) {
      return '${firstName![0]}${lastName![0]}'.toUpperCase();
    }
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts.first.isNotEmpty) {
      return parts.first.substring(0, parts.first.length >= 2 ? 2 : 1).toUpperCase();
    }
    return '';
  }

  /// Primary avatar image URL.
  String? get primaryAvatarUrl => avatar?.url ?? avatarUrl;

  /// Primary cover image URL.
  String? get primaryCoverImageUrl => coverImage?.url ?? coverImageUrl;

  /// Default or featured resume if available.
  Resume? get primaryResume {
    if (resumes == null || resumes!.isEmpty) return null;
    return resumes!.firstWhere((r) => r.featured, orElse: () => resumes!.first);
  }

  bool get hasSocials => socialLinks != null && socialLinks!.isNotEmpty;

  bool get isAvailable =>
      isOpenForWork ||
      isAvailableForFreelance ||
      isAvailableForFullTime ||
      isAvailableForConsulting;

  PersonalInformation copyWith({
    String? id,
    String? fullName,
    String? firstName,
    String? lastName,
    String? preferredName,
    String? pronouns,
    String? headline,
    String? subheadline,
    String? tagline,
    String? shortBio,
    String? biography,
    String? aboutMe,
    String? email,
    List<String>? alternateEmails,
    String? phone,
    String? whatsapp,
    String? telegram,
    Media? avatar,
    String? avatarUrl,
    Media? coverImage,
    String? coverImageUrl,
    String? location,
    String? city,
    String? state,
    String? country,
    String? countryCode,
    String? timeZone,
    bool? isOpenForWork,
    bool? isAvailableForFreelance,
    bool? isAvailableForFullTime,
    bool? isAvailableForConsulting,
    bool? isAvailableForRelocation,
    bool? isAvailableForRemote,
    String? availabilityStatus,
    DateTime? availableFrom,
    double? yearsOfExperience,
    String? website,
    String? githubUrl,
    String? linkedinUrl,
    String? twitterUrl,
    String? mediumUrl,
    String? stackOverflowUrl,
    String? youtubeUrl,
    String? discordUsername,
    String? quote,
    String? quoteAuthor,
    List<String>? interests,
    List<Language>? languages,
    List<Skill>? skills,
    List<SocialLink>? socialLinks,
    List<Resume>? resumes,
    List<String>? featuredProjectIds,
    List<Project>? featuredProjects,
    Map<String, dynamic>? metadata,
  }) {
    return PersonalInformation(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      preferredName: preferredName ?? this.preferredName,
      pronouns: pronouns ?? this.pronouns,
      headline: headline ?? this.headline,
      subheadline: subheadline ?? this.subheadline,
      tagline: tagline ?? this.tagline,
      shortBio: shortBio ?? this.shortBio,
      biography: biography ?? this.biography,
      aboutMe: aboutMe ?? this.aboutMe,
      email: email ?? this.email,
      alternateEmails: alternateEmails ?? this.alternateEmails,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      telegram: telegram ?? this.telegram,
      avatar: avatar ?? this.avatar,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      coverImage: coverImage ?? this.coverImage,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      location: location ?? this.location,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      timeZone: timeZone ?? this.timeZone,
      isOpenForWork: isOpenForWork ?? this.isOpenForWork,
      isAvailableForFreelance: isAvailableForFreelance ?? this.isAvailableForFreelance,
      isAvailableForFullTime: isAvailableForFullTime ?? this.isAvailableForFullTime,
      isAvailableForConsulting: isAvailableForConsulting ?? this.isAvailableForConsulting,
      isAvailableForRelocation: isAvailableForRelocation ?? this.isAvailableForRelocation,
      isAvailableForRemote: isAvailableForRemote ?? this.isAvailableForRemote,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      availableFrom: availableFrom ?? this.availableFrom,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      website: website ?? this.website,
      githubUrl: githubUrl ?? this.githubUrl,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      twitterUrl: twitterUrl ?? this.twitterUrl,
      mediumUrl: mediumUrl ?? this.mediumUrl,
      stackOverflowUrl: stackOverflowUrl ?? this.stackOverflowUrl,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
      discordUsername: discordUsername ?? this.discordUsername,
      quote: quote ?? this.quote,
      quoteAuthor: quoteAuthor ?? this.quoteAuthor,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      skills: skills ?? this.skills,
      socialLinks: socialLinks ?? this.socialLinks,
      resumes: resumes ?? this.resumes,
      featuredProjectIds: featuredProjectIds ?? this.featuredProjectIds,
      featuredProjects: featuredProjects ?? this.featuredProjects,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (preferredName != null) 'preferredName': preferredName,
      if (pronouns != null) 'pronouns': pronouns,
      'headline': headline,
      if (subheadline != null) 'subheadline': subheadline,
      if (tagline != null) 'tagline': tagline,
      if (shortBio != null) 'shortBio': shortBio,
      if (biography != null) 'biography': biography,
      if (aboutMe != null) 'aboutMe': aboutMe,
      'email': email,
      if (alternateEmails != null) 'alternateEmails': alternateEmails,
      if (phone != null) 'phone': phone,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (telegram != null) 'telegram': telegram,
      if (avatar != null) 'avatar': avatar!.toMap(),
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (coverImage != null) 'coverImage': coverImage!.toMap(),
      if (coverImageUrl != null) 'coverImageUrl': coverImageUrl,
      if (location != null) 'location': location,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (countryCode != null) 'countryCode': countryCode,
      if (timeZone != null) 'timeZone': timeZone,
      'isOpenForWork': isOpenForWork,
      'isAvailableForFreelance': isAvailableForFreelance,
      'isAvailableForFullTime': isAvailableForFullTime,
      'isAvailableForConsulting': isAvailableForConsulting,
      'isAvailableForRelocation': isAvailableForRelocation,
      'isAvailableForRemote': isAvailableForRemote,
      if (availabilityStatus != null) 'availabilityStatus': availabilityStatus,
      if (availableFrom != null) 'availableFrom': ModelParsingHelpers.dateTimeToJson(availableFrom),
      if (yearsOfExperience != null) 'yearsOfExperience': yearsOfExperience,
      if (website != null) 'website': website,
      if (githubUrl != null) 'githubUrl': githubUrl,
      if (linkedinUrl != null) 'linkedinUrl': linkedinUrl,
      if (twitterUrl != null) 'twitterUrl': twitterUrl,
      if (mediumUrl != null) 'mediumUrl': mediumUrl,
      if (stackOverflowUrl != null) 'stackOverflowUrl': stackOverflowUrl,
      if (youtubeUrl != null) 'youtubeUrl': youtubeUrl,
      if (discordUsername != null) 'discordUsername': discordUsername,
      if (quote != null) 'quote': quote,
      if (quoteAuthor != null) 'quoteAuthor': quoteAuthor,
      if (interests != null) 'interests': interests,
      if (languages != null) 'languages': languages!.map((l) => l.toMap()).toList(),
      if (skills != null) 'skills': skills!.map((s) => s.toMap()).toList(),
      if (socialLinks != null) 'socialLinks': socialLinks!.map((s) => s.toMap()).toList(),
      if (resumes != null) 'resumes': resumes!.map((r) => r.toMap()).toList(),
      if (featuredProjectIds != null) 'featuredProjectIds': featuredProjectIds,
      if (featuredProjects != null)
        'featuredProjects': featuredProjects!.map((p) => p.toMap()).toList(),
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory PersonalInformation.fromMap(Map<String, dynamic> map) {
    return PersonalInformation(
      id: map['id']?.toString() ?? '',
      fullName: map['fullName']?.toString() ?? '',
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      preferredName: map['preferredName']?.toString(),
      pronouns: map['pronouns']?.toString(),
      headline: map['headline']?.toString() ?? '',
      subheadline: map['subheadline']?.toString(),
      tagline: map['tagline']?.toString(),
      shortBio: map['shortBio']?.toString(),
      biography: map['biography']?.toString(),
      aboutMe: map['aboutMe']?.toString(),
      email: map['email']?.toString() ?? '',
      alternateEmails: ModelParsingHelpers.parseStringList(map['alternateEmails']),
      phone: map['phone']?.toString(),
      whatsapp: map['whatsapp']?.toString(),
      telegram: map['telegram']?.toString(),
      avatar: map['avatar'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['avatar'] as Map))
          : null,
      avatarUrl: map['avatarUrl']?.toString(),
      coverImage: map['coverImage'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['coverImage'] as Map))
          : null,
      coverImageUrl: map['coverImageUrl']?.toString(),
      location: map['location']?.toString(),
      city: map['city']?.toString(),
      state: map['state']?.toString(),
      country: map['country']?.toString(),
      countryCode: map['countryCode']?.toString(),
      timeZone: map['timeZone']?.toString(),
      isOpenForWork: ModelParsingHelpers.parseBool(map['isOpenForWork']) ?? true,
      isAvailableForFreelance:
          ModelParsingHelpers.parseBool(map['isAvailableForFreelance']) ?? true,
      isAvailableForFullTime:
          ModelParsingHelpers.parseBool(map['isAvailableForFullTime']) ?? true,
      isAvailableForConsulting:
          ModelParsingHelpers.parseBool(map['isAvailableForConsulting']) ?? true,
      isAvailableForRelocation:
          ModelParsingHelpers.parseBool(map['isAvailableForRelocation']) ?? false,
      isAvailableForRemote:
          ModelParsingHelpers.parseBool(map['isAvailableForRemote']) ?? true,
      availabilityStatus: map['availabilityStatus']?.toString(),
      availableFrom: ModelParsingHelpers.parseDateTime(map['availableFrom']),
      yearsOfExperience: ModelParsingHelpers.parseDouble(map['yearsOfExperience']),
      website: map['website']?.toString(),
      githubUrl: map['githubUrl']?.toString(),
      linkedinUrl: map['linkedinUrl']?.toString(),
      twitterUrl: map['twitterUrl']?.toString(),
      mediumUrl: map['mediumUrl']?.toString(),
      stackOverflowUrl: map['stackOverflowUrl']?.toString(),
      youtubeUrl: map['youtubeUrl']?.toString(),
      discordUsername: map['discordUsername']?.toString(),
      quote: map['quote']?.toString(),
      quoteAuthor: map['quoteAuthor']?.toString(),
      interests: ModelParsingHelpers.parseStringList(map['interests']),
      languages: ModelParsingHelpers.parseObjectList(map['languages'], Language.fromMap),
      skills: ModelParsingHelpers.parseObjectList(map['skills'], Skill.fromMap),
      socialLinks:
          ModelParsingHelpers.parseObjectList(map['socialLinks'], SocialLink.fromMap),
      resumes: ModelParsingHelpers.parseObjectList(map['resumes'], Resume.fromMap),
      featuredProjectIds: ModelParsingHelpers.parseStringList(map['featuredProjectIds']),
      featuredProjects:
          ModelParsingHelpers.parseObjectList(map['featuredProjects'], Project.fromMap),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
      PersonalInformation.fromMap(json);

  factory PersonalInformation.fromJsonString(String source) =>
      PersonalInformation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonalInformation(id: $id, fullName: $fullName, headline: $headline, email: $email, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PersonalInformation &&
        other.id == id &&
        other.fullName == fullName &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.preferredName == preferredName &&
        other.pronouns == pronouns &&
        other.headline == headline &&
        other.subheadline == subheadline &&
        other.tagline == tagline &&
        other.shortBio == shortBio &&
        other.biography == biography &&
        other.aboutMe == aboutMe &&
        other.email == email &&
        listEquals(other.alternateEmails, alternateEmails) &&
        other.phone == phone &&
        other.whatsapp == whatsapp &&
        other.telegram == telegram &&
        other.avatar == avatar &&
        other.avatarUrl == avatarUrl &&
        other.coverImage == coverImage &&
        other.coverImageUrl == coverImageUrl &&
        other.location == location &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.timeZone == timeZone &&
        other.isOpenForWork == isOpenForWork &&
        other.isAvailableForFreelance == isAvailableForFreelance &&
        other.isAvailableForFullTime == isAvailableForFullTime &&
        other.isAvailableForConsulting == isAvailableForConsulting &&
        other.isAvailableForRelocation == isAvailableForRelocation &&
        other.isAvailableForRemote == isAvailableForRemote &&
        other.availabilityStatus == availabilityStatus &&
        other.availableFrom == availableFrom &&
        other.yearsOfExperience == yearsOfExperience &&
        other.website == website &&
        other.githubUrl == githubUrl &&
        other.linkedinUrl == linkedinUrl &&
        other.twitterUrl == twitterUrl &&
        other.mediumUrl == mediumUrl &&
        other.stackOverflowUrl == stackOverflowUrl &&
        other.youtubeUrl == youtubeUrl &&
        other.discordUsername == discordUsername &&
        other.quote == quote &&
        other.quoteAuthor == quoteAuthor &&
        listEquals(other.interests, interests) &&
        listEquals(other.languages, languages) &&
        listEquals(other.skills, skills) &&
        listEquals(other.socialLinks, socialLinks) &&
        listEquals(other.resumes, resumes) &&
        listEquals(other.featuredProjectIds, featuredProjectIds) &&
        listEquals(other.featuredProjects, featuredProjects) &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      fullName,
      headline,
      email,
      location,
      timeZone,
      isOpenForWork,
      yearsOfExperience,
      website,
      githubUrl,
      linkedinUrl,
    ]);
  }
}
