import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? idUser;
  final String? name;
  final String? edad;
  final String? email;
  final String? password;
  final bool? isRegister;

  const User({
    this.idUser,
    this.name,
    this.edad,
    this.email,
    this.password,
    this.isRegister,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'edad': edad,
    };
  }

  @override
  List<Object?> get props => [
        idUser,
        name,
        email,
        edad,
        password,
        isRegister,
      ];
}