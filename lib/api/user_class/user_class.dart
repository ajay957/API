import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user_class.g.dart';

@JsonSerializable()
class UserClass {

  @JsonKey(name: 'id')
	int? id;

  @JsonKey(name: 'name')
	String? name;

  @JsonKey(name: 'username')
	String? username;

  @JsonKey(name: 'email')
	String? email;
  @JsonKey(name: 'address')
	Address? address;

  @JsonKey(name: 'phone')
	String? phone;

  @JsonKey(name: 'website')
	String? website;

  @JsonKey(name: 'company')
	Company? company;

	UserClass({
		this.id, 
		this.name, 
		this.username, 
		this.email, 
		this.address, 
		this.phone, 
		this.website, 
		this.company, 
	});

	factory UserClass.fromJson(Map<String, dynamic> json) {
		return _$UserClassFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserClassToJson(this);
}
