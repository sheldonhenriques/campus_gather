class Event {
  final String id;
  int institutionId;
  int organizationId;
  List<dynamic> organizationIds;
  int branchId;
  List<dynamic> branchIds;
  String organizationName;
  String organizationProfilePicture;
  List<dynamic> organizationNames;
  String name;
  String description;
  String location;
  DateTime startsOn;
  DateTime endsOn;
  String imagePath;
  String theme;
  List<dynamic> categoryIds;
  List<dynamic> categoryNames;
  List<dynamic> benefitNames;
  String visibility;
  String status;
  String latitude;
  String longitude;
  double recScore;

  Event({
    required this.id,
    required this.institutionId,
    required this.organizationId,
    required this.organizationIds,
    required this.branchId,
    required this.branchIds,
    required this.organizationName,
    required this.organizationProfilePicture,
    required this.organizationNames,
    required this.name,
    required this.description,
    required this.location,
    required this.startsOn,
    required this.endsOn,
    required this.imagePath,
    required this.theme,
    required this.categoryIds,
    required this.categoryNames,
    required this.benefitNames,
    required this.visibility,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.recScore,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? 0,
      institutionId: json['institutionId'] ?? 0,
      organizationId: json['organizationId'] ?? 0,
      organizationIds: (json['organizationIds'] as List<dynamic>?) ?? [],
      branchId: json['branchId'] ?? 0,
      branchIds: (json['branchIds'] as List<dynamic>?) ?? [],
      organizationName: json['organizationName'] ?? '',
      organizationProfilePicture: json['organizationProfilePicture'] ?? '',
      organizationNames: (json['organizationNames'] as List<dynamic>?) ?? [],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      startsOn: DateTime.parse(json['startsOn'] ?? ''),
      endsOn: DateTime.parse(json['endsOn'] ?? ''),
      imagePath: json['imagePath'] ?? '',
      theme: json['theme'] ?? '',
      categoryIds: (json['categoryIds'] as List<dynamic>?) ?? [],
      categoryNames: (json['categoryNames'] as List<dynamic>?) ?? [],
      benefitNames: (json['benefitNames'] as List<dynamic>?) ?? [],
      visibility: json['visibility'] ?? '',
      status: json['status'] ?? '',
      latitude: json['latitude'] ?? "",
      longitude: json['longitude'] ?? "",
      recScore: json['recScore'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institutionId': institutionId,
      'organizationId': organizationId,
      'organizationIds': organizationIds,
      'branchId': branchId,
      'branchIds': branchIds,
      'organizationName': organizationName,
      'organizationProfilePicture': organizationProfilePicture,
      'organizationNames': organizationNames,
      'name': name,
      'description': description,
      'location': location,
      'startsOn': startsOn.toIso8601String(),
      'endsOn': endsOn.toIso8601String(),
      'imagePath': imagePath,
      'theme': theme,
      'categoryIds': categoryIds,
      'categoryNames': categoryNames,
      'benefitNames': benefitNames,
      'visibility': visibility,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
      'recScore': recScore,
    };
  }
}
