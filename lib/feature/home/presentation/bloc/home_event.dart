part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends HomeEvent {
  final FormUser formUser;

  const CreateUserEvent(this.formUser,);

  @override
  List<Object> get props => [formUser];
}

class HomeRequestStatusResset extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetUserEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}