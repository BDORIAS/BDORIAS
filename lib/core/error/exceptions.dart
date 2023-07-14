import 'package:equatable/equatable.dart';

import '../constants/app_string.dart';

class GenericException extends Equatable implements Exception {
  final String message;

  const GenericException({required this.message});

  @override
  List<Object?> get props => [message];
}

class DataRegistradoException extends GenericException {
  const DataRegistradoException([message])
      : super(
            message:
                message != '' ? message : AppStrings.dataRegistradaException);
}

class NoInternetConnectionException extends GenericException {
  const NoInternetConnectionException([message])
      : super(message: AppStrings.noNetworkConnectionException);
}

class BadRequestException extends GenericException {
  const BadRequestException([message])
      : super(message: AppStrings.badRequestException);
}

class UnauthorizedException extends GenericException {
  const UnauthorizedException([message])
      : super(
            message:
                message != '' ? message : AppStrings.unauthorizedException);
}

class NotFoundException extends GenericException {
  const NotFoundException([message]) : super(message: message);
}

class InternalServerErrorException extends GenericException {
  const InternalServerErrorException([message])
      : super(message: AppStrings.internalServerErrorException);
}

class CacheException extends GenericException {
  const CacheException([message]) : super(message: AppStrings.cacheException);
}
