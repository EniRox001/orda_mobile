// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      verified: json['verified'] as bool,
      phoneCode: json['phoneCode'] as String,
      phone: json['phone'] as String,
      balance: (json['balance'] as num).toDouble(),
      roleId: json['roleId'] as String,
      shopId: json['shopId'] as String,
      reviewId: json['reviewId'] as String,
      photoUrl: json['photoUrl'] as String,
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'verified': instance.verified,
      'phoneCode': instance.phoneCode,
      'phone': instance.phone,
      'balance': instance.balance,
      'roleId': instance.roleId,
      'shopId': instance.shopId,
      'reviewId': instance.reviewId,
      'photoUrl': instance.photoUrl,
      'locationId': instance.locationId,
    };
