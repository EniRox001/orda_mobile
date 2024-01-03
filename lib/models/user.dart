import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// User model.
@JsonSerializable()
class User {
  /// Creates a user.
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.verified,
    required this.phoneCode,
    required this.phone,
    required this.balance,
    required this.roleId,
    required this.shopId,
    required this.reviewId,
    required this.photoUrl,
    required this.locationId,
  });

  /// Creates a user from JSON.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates a user from JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// The user ID.
  final String id;

  /// The user email.
  final String email;

  /// The user first name.
  final String firstName;

  /// The user last name.
  final String lastName;

  /// The user username.
  final String username;

  /// The user verified.
  final bool verified;

  /// The user phone code.
  final String phoneCode;

  /// The user phone.
  final String phone;

  /// The user balance.
  final double balance;

  /// The user role ID.
  final String roleId;

  /// The user shop ID.
  final String shopId;

  /// The user review ID.
  final String reviewId;

  /// The user photo URL.
  final String photoUrl;

  /// The user location ID.
  final String locationId;
}
