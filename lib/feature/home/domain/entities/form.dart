import 'package:equatable/equatable.dart';

class FormUser extends Equatable {
  final String? name;
  final String? lastName;
  final String? birthDate;
  final List<String?> address;

  FormUser({
    this.name,
    this.lastName,
    this.birthDate,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.lastName,
      'genero': this.birthDate,
      'ciudad': this.address,
    };
  }

  @override
  List<Object?> get props => [
        name,
        lastName,
        birthDate,
        address,
      ];
}