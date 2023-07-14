// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:prueba_tecnica/common/domain/contracts/common_contracts.dart';

// import '../../../core/error/exceptions.dart';

// class UploadPhoto {
//   final CommonContrats commonContrats;

//   UploadPhoto(this.commonContrats);
//   Future<Either<GenericException, bool>> call(
//       ParamUploadPhoto paramUploadPhoto) {
//     return commonContrats.uploadPhoto(
//         file: paramUploadPhoto.file,
//         id: paramUploadPhoto.id,
//         name: paramUploadPhoto.name);
//   }
// }

// class ParamUploadPhoto extends Equatable {
//   final String id;
//   final String name;
//   final String file;

//   ParamUploadPhoto({required this.id, required this.file, required this.name});
//   @override
//   List<Object> get props => [id, name, file];
// }
