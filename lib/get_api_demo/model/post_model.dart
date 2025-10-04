import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostModel({this.postId, this.id, this.name, this.email, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() => {'postId': postId, 'id': id, 'name': name, 'email': email, 'body': body};

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
