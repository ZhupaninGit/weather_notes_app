class Location {
  final String description;
  final String placeId;
  final double? latitude;
  final double? longitude;

  Location(
      {required this.description,
      required this.placeId,
      this.latitude,
      this.longitude});

  factory Location.fromAutoComplete(Map<String, dynamic> json) {
    return Location(
      description: json["description"],
      placeId: json["place_id"],
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      description: json["description"],
      placeId: json["place_id"],
      latitude: json["latitude"],
      longitude: json["longitude"]
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'description': description,
      'place_id': placeId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  Location copyWith({
    String? description,
    String? placeId,
    double? latitude,
    double? longitude,
  }) {
    return Location(
      description: description ?? this.description,
      placeId: placeId ?? this.placeId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
