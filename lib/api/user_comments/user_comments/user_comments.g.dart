// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserComments _$UserCommentsFromJson(Map<String, dynamic> json) => UserComments(
      postId: (json['postId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$UserCommentsToJson(UserComments instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
