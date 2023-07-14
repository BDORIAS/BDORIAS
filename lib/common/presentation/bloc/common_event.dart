part of 'common_bloc.dart';

abstract class CommonEvent extends Equatable {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

class StartDataApp extends CommonEvent {}

class UserInitialEvent extends CommonEvent {
  final String idUser;

  UserInitialEvent({required this.idUser});
}
