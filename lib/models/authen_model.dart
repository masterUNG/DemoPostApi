import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthenModel {
  final String message;
  final String status;
  final String token;
  AuthenModel({
    required this.message,
    required this.status,
    required this.token,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'token': token,
    };
  }

  factory AuthenModel.fromMap(Map<String, dynamic> map) {
    return AuthenModel(
      message: (map['message'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      token: (map['token'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenModel.fromJson(String source) => AuthenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
