import '../../domain/entities/form.dart';

class FormModel extends FormUser {
  FormModel(
      {String? name,
      String? lastName,
      String? birthDate,
      required List<String?> address,})
      : super(
            name: name,
            lastName: lastName,
            birthDate: birthDate,
            address: address,);

  factory FormModel.fromJson(Map<String, dynamic> json) {
    final address = json["address"] != null ? json["address"] : [];
    return FormModel(
      name: json["name"] ?? '',
      lastName: json["lastName"] ?? '',
      birthDate: json["birthDate"] ?? '',
      address: List<String?>.from(address),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'birthDate': birthDate,
      'address': address,
    };
  }

  @override
  String toString() {
    return '{"name":"$name", "lastName":"$lastName", "birthDate": $birthDate, "address": $address,}';
  }
}
