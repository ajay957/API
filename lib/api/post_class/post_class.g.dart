// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostClass _$PostClassFromJson(Map<String, dynamic> json) => PostClass(
      userId: (json['userid'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$PostClassToJson(PostClass instance) => <String, dynamic>{
      'userid': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
