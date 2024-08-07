import 'package:json_annotation/json_annotation.dart';

part 'user_comments.g.dart';

@JsonSerializable()
class UserComments {

  @JsonKey(name: 'postId')
	int? postId;

  @JsonKey(name: 'id')
	int? id;

  @JsonKey(name: 'name')
	String? name;

  @JsonKey(name: 'email')
	String? email;

  @JsonKey(name: 'body')
	String? body;

	UserComments({this.postId, this.id, this.name, this.email, this.body});

	factory UserComments.fromJson(Map<String, dynamic> json) {
		return _$UserCommentsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserCommentsToJson(this);
}
