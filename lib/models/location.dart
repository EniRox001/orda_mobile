import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

/// Location model.
@JsonSerializable()
class Location {
  /// Creates a location.
  const Location({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  /// Creates a location from JSON.
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// Creates a location from JSON.
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  /// The location ID.
  final String id;

  /// The location name.
  final String name;

  /// The location address.
  final String address;

  /// The location city.
  final String city;

  /// The location state.
  final String state;

  /// The location zip.
  final String zip;

  /// The location country.
  final String country;

  /// The location latitude.
  final double latitude;

  /// The location longitude.
  final double longitude;
}
