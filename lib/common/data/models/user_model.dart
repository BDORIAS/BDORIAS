import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {String? idUser,
      String? name,
      String? email,
      String? password,
      bool? isRegister,
      String? urlAvatar})
      : super(
            idUser: idUser,
            name: name,
            email: email,
            password: password,
            isRegister: isRegister);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json["_id"],
      name: json["name"] ?? '',
      email: json["email"] ?? '',
      password: json["password"] ?? '',
      isRegister: json["isRegister"] == "false" ? false : true,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '_id': idUser,
      'name': name,
      'email': email,
      'password': password,
      'isRegister': isRegister,
    };
  }

  @override
  String toString() {
    return '{"name":"$name", "email":"$email","password":$password,"isRegister":"$isRegister"}';
  }
}
