class User {
  int userId;
  String username;
  String archivedUsername;
  String status;
  int lastLogin;
  String profilePictureUrl;
  String firstName;
  String lastName;
  String campusEmail;
  String preferredEmail;
  String cardId;
  String mobilePhone;
  String institutionProvidedFirstName;
  String institutionProvidedMiddleName;
  String institutionProvidedLastName;
  NameField middleName;
  NameField suffix;
  DateField dateOfBirth;
  StringField sex;
  StringField race;
  StringField ethnicity;
  StringField enrollmentStatus;
  StringField currentTermEnrolled;
  DateField anticipatedDateOfGraduation;
  StringField degreeSought;
  StringField major;
  List<CustomField> customFields;

  User({
    required this.userId,
    required this.username,
    required this.archivedUsername,
    required this.status,
    required this.lastLogin,
    required this.profilePictureUrl,
    required this.firstName,
    required this.lastName,
    required this.campusEmail,
    required this.preferredEmail,
    required this.cardId,
    required this.mobilePhone,
    required this.institutionProvidedFirstName,
    required this.institutionProvidedMiddleName,
    required this.institutionProvidedLastName,
    required this.middleName,
    required this.suffix,
    required this.dateOfBirth,
    required this.sex,
    required this.race,
    required this.ethnicity,
    required this.enrollmentStatus,
    required this.currentTermEnrolled,
    required this.anticipatedDateOfGraduation,
    required this.degreeSought,
    required this.major,
    required this.customFields,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? 0,
      username: json['username'] ?? '',
      archivedUsername: json['archivedUsername'] ?? '',
      status: json['status'] ?? '',
      lastLogin: json['lastLogin'] ?? 0,
      profilePictureUrl: json['profilePictureUrl'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      campusEmail: json['campusEmail'] ?? '',
      preferredEmail: json['preferredEmail'] ?? '',
      cardId: json['cardId'] ?? '',
      mobilePhone: json['mobilePhone'] ?? '',
      institutionProvidedFirstName: json['institutionProvidedFirstName'] ?? '',
      institutionProvidedMiddleName:
          json['institutionProvidedMiddleName'] ?? '',
      institutionProvidedLastName: json['institutionProvidedLastName'] ?? '',
      middleName: NameField.fromJson(json['middleName']),
      suffix: NameField.fromJson(json['suffix']),
      dateOfBirth: DateField.fromJson(json['dateOfBirth']),
      sex: StringField.fromJson(json['sex']),
      race: StringField.fromJson(json['race']),
      ethnicity: StringField.fromJson(json['ethnicity']),
      enrollmentStatus: StringField.fromJson(json['enrollmentStatus']),
      currentTermEnrolled: StringField.fromJson(json['currentTermEnrolled']),
      anticipatedDateOfGraduation:
          DateField.fromJson(json['anticipatedDateOfGraduation']),
      degreeSought: StringField.fromJson(json['degreeSought']),
      major: StringField.fromJson(json['major']),
      customFields: (json['customFields'] as List<dynamic>?)
              ?.map((e) => CustomField.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'archivedUsername': archivedUsername,
      'status': status,
      'lastLogin': lastLogin,
      'profilePictureUrl': profilePictureUrl,
      'firstName': firstName,
      'lastName': lastName,
      'campusEmail': campusEmail,
      'preferredEmail': preferredEmail,
      'cardId': cardId,
      'mobilePhone': mobilePhone,
      'institutionProvidedFirstName': institutionProvidedFirstName,
      'institutionProvidedMiddleName': institutionProvidedMiddleName,
      'institutionProvidedLastName': institutionProvidedLastName,
      'middleName': middleName.toJson(),
      'suffix': suffix.toJson(),
      'dateOfBirth': dateOfBirth.toJson(),
      'sex': sex.toJson(),
      'race': race.toJson(),
      'ethnicity': ethnicity.toJson(),
      'enrollmentStatus': enrollmentStatus.toJson(),
      'currentTermEnrolled': currentTermEnrolled.toJson(),
      'anticipatedDateOfGraduation': anticipatedDateOfGraduation.toJson(),
      'degreeSought': degreeSought.toJson(),
      'major': major.toJson(),
      'customFields': customFields.map((e) => e.toJson()).toList(),
    };
  }
}

class NameField {
  String value;
  String lastModified;

  NameField({
    required this.value,
    required this.lastModified,
  });

  factory NameField.fromJson(Map<String, dynamic> json) {
    return NameField(
      value: json['value'] ?? '',
      lastModified: json['lastModified'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'lastModified': lastModified,
    };
  }
}

class DateField {
  String value;
  String lastModified;

  DateField({
    required this.value,
    required this.lastModified,
  });

  factory DateField.fromJson(Map<String, dynamic> json) {
    return DateField(
      value: json['value'] ?? '',
      lastModified: json['lastModified'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'lastModified': lastModified,
    };
  }
}

class StringField {
  String value;
  String lastModified;

  StringField({
    required this.value,
    required this.lastModified,
  });

  factory StringField.fromJson(Map<String, dynamic> json) {
    return StringField(
      value: json['value'] ?? '',
      lastModified: json['lastModified'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'lastModified': lastModified,
    };
  }
}

class CustomField {
  String name;
  List<String> value;

  CustomField({
    required this.name,
    required this.value,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) {
    return CustomField(
      name: json['name'] ?? '',
      value: (json['value'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
    };
  }
}
