import 'package:json_annotation/json_annotation.dart';

part 'post_class.g.dart';

@JsonSerializable()
class PostClass {
  @JsonKey(name: 'userid')
	int? userId;

  @JsonKey(name: 'id')
	int? id;

  @JsonKey(name: 'title')
	String? title;

  @JsonKey(name: 'body')
	String? body;

	PostClass({this.userId, this.id, this.title, this.body});

	factory PostClass.fromJson(Map<String, dynamic> json) {
		return _$PostClassFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PostClassToJson(this);
}
