import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/feature/home/domain/usercases/get_user.dart';

import '../../../../core/usercases/usercases.dart';
import '../../domain/entities/form.dart';
import '../../domain/usercases/create_user_usercase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CreateUserUsecase createUserUsecase;
  final GetUserUseCase getUserUseCase;
  HomeBloc({required this.createUserUsecase, required this.getUserUseCase}) : super(HomeState()) {
    
      on<CreateUserEvent>(_createUser);
      on<HomeRequestStatusResset>(_resetHomeRequestStatus);
      on<GetUserEvent>(_getUser);
  }
  FutureOr<void> _createUser(
      CreateUserEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(createRequestStatus: CreateRequestStatus.loading));
    final result = await createUserUsecase(CreateUserParams(
        name: event.formUser.name!,
        lastName: event.formUser.lastName!,
        birthDate: event.formUser.birthDate!,
        address: event.formUser.address.whereType<String>().toList()));
        print("****************************************************************************");
    print("Resultado del contrato: $result");
    result.fold((l) {
      emit(state.copyWith(
          createRequestStatus: CreateRequestStatus.error,
          errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          createRequestStatus: CreateRequestStatus.loadSuccess,
          ));
    });
  }

  FutureOr<void> _getUser(
      GetUserEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getRequestStatus: GetRequestStatus.loading));
    final result = await getUserUseCase(NoParams());
        print("****************************************************************************");
    print("Resultado del bloc: $result");
    result.fold((l) {
      emit(state.copyWith(
          getRequestStatus: GetRequestStatus.error,
          errorMessage: l.message));
    }, (r) {
      // print("entra por la derecha del bloc: $r");
      emit(state.copyWith(
          getRequestStatus: GetRequestStatus.loadSuccess,
          formUserEntity: r,
          ));
    });
  }



  FutureOr<void> _resetHomeRequestStatus(
      HomeRequestStatusResset event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        createRequestStatus: CreateRequestStatus.idle,
        
      ),
    );
  }
}
