import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? photo;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      if (userId != null) 'userId': userId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (photo != null) 'photo': photo,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        name = json['name'],
        email = json['email'],
        password = json['password'],
        photo = json['photo'];

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  @override
  String toString() {
    return "Email: $email\n Senha: $password";
  }
}
