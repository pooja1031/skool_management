
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationModel {
  final String email;
  final String password;
  final String name;

  RegistrationModel({
    this.email = '',
    this.password = '',
    this.name = '',
  });

  RegistrationModel copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return RegistrationModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}
