class SocialProfile {
  final int userId;
  final String username;
  final String email;
  final String profilePic;
  final String bio;
  final String homepage;
  final String fullName;
  final String location;
  final String birthDate;
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final String joinedDate;
  final bool verifiedStatus;
  final String education;
  final String work;
  final String relationshipStatus;
  final String gender;
  final String pronouns;
  final String coverPhoto;
  final String lastActive;
  final String statusMessage;
  final List<String> hobbies;
  final List<String> languages;
  final List<String> interests;
  final PrivacySettings privacySettings;
  final ContactInfo contactInfo;
  final List<CustomField> customFields;
  SocialProfile({
    required this.userId,
    required this.username,
    required this.email,
    required this.profilePic,
    required this.bio,
    required this.homepage,
    required this.hobbies,
    required this.fullName,
    required this.location,
    required this.birthDate,
    required this.followersCount,
    required this.followingCount,
    required this.postsCount,
    required this.joinedDate,
    required this.verifiedStatus,
    required this.languages,
    required this.education,
    required this.work,
    required this.relationshipStatus,
    required this.gender,
    required this.pronouns,
    required this.interests,
    required this.coverPhoto,
    required this.privacySettings,
    required this.lastActive,
    required this.statusMessage,
    required this.contactInfo,
    required this.customFields,
  });

  factory SocialProfile.fromJson(Map<String, dynamic> json) {
    return SocialProfile(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      profilePic: json['profilePic'],
      bio: json['bio'],
      homepage: json['homepage'] ?? '',
      hobbies: List<String>.from(json['hobbies']),
      fullName: json['fullName'],
      location: json['location'],
      birthDate: json['birthDate'] ?? '',
      followersCount: json['followersCount'],
      followingCount: json['followingCount'],
      postsCount: json['postsCount'],
      joinedDate: json['joinedDate'],
      verifiedStatus: json['verifiedStatus'],
      languages: List<String>.from(json['languages']),
      education: json['education'] ?? '',
      work: json['work'] ?? '',
      relationshipStatus: json['relationshipStatus'] ?? '',
      gender: json['gender'],
      pronouns: json['pronouns'],
      interests: List<String>.from(json['interests']),
      coverPhoto: json['coverPhoto'],
      privacySettings: PrivacySettings.fromJson(json['privacySettings']),
      lastActive: json['lastActive'] ?? '',
      statusMessage: json['statusMessage'] ?? '',
      contactInfo: ContactInfo.fromJson(json['contactInfo']),
      customFields: (json['customFields'] as List)
          .map((field) => CustomField.fromJson(field))
          .toList(),
    );
  }
}

class PrivacySettings {
  final bool showEmail;
  final bool showBirthDate;

  PrivacySettings({
    required this.showEmail,
    required this.showBirthDate,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) {
    return PrivacySettings(
      showEmail: json['showEmail'],
      showBirthDate: json['showBirthDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'showEmail': showEmail,
      'showBirthDate': showBirthDate,
    };
  }
}

class ContactInfo {
  final String phone;
  final String secondaryEmail;

  ContactInfo({
    required this.phone,
    required this.secondaryEmail,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      phone: json['phone'] ?? '+1234567890',
      secondaryEmail: json['secondaryEmail'] ?? 'hello@example.com',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'secondaryEmail': secondaryEmail,
    };
  }
}

class CustomField {
  final String fieldName;
  final String fieldValue;

  CustomField({
    required this.fieldName,
    required this.fieldValue,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) {
    return CustomField(
      fieldName: json['fieldName'],
      fieldValue: json['fieldValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fieldName': fieldName,
      'fieldValue': fieldValue,
    };
  }
}
