// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RequestLoginModel extends Equatable {
  String email;
  String password;
  final String type = 'MEMBER';

  RequestLoginModel({
    required this.email,
    required this.password,
  });

  RequestLoginModel copyWith({
    String? email,
    String? password,
  }) {
    return RequestLoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'type': type,
    };
  }

  factory RequestLoginModel.fromMap(Map<String, dynamic> map) {
    return RequestLoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestLoginModel.fromJson(String source) =>
      RequestLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password, type];
}

class ResponseLoginModel extends Equatable {
  bool success;
  int status;
  String message;
  Map<String, dynamic> data;
  
  ResponseLoginModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object> get props => [success, status, message, data];

  ResponseLoginModel copyWith({
    bool? success,
    int? status,
    String? message,
    Map<String, dynamic>? data,
  }) {
    return ResponseLoginModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory ResponseLoginModel.fromMap(Map<String, dynamic> map) {
    return ResponseLoginModel(
      success: map['success'] as bool,
      status: map['status'] as int,
      message: map['message'] as String,
      data: Map<String, dynamic>.from((map['data'] as Map<String, dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseLoginModel.fromJson(String source) => ResponseLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
