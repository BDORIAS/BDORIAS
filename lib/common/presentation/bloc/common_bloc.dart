import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/common/domain/usercases/get_user.dart';

import '../../../core/usercases/usercases.dart';
import '../../domain/entities/user.dart';
import '../../domain/usercases/get_data_user.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  final GetUser getUser;
  final GetDataUser getDataUser;
  
  CommonBloc(
      {required this.getUser,
      required this.getDataUser})
      : super(CommonState()) {
    on<StartDataApp>(_start);
    on<UserInitialEvent>(_startGetDatauser);
  }
  Future<void> _start(StartDataApp event, Emitter<CommonState> emit) async {
    final userOrFailure = await getUser(NoParams());
    userOrFailure.fold((l) => null, (user) {
      emit(state.copyWith(user: user));
    });
  }

  Future<void> _startGetDatauser(
      UserInitialEvent event, Emitter<CommonState> emit) async {
    emit(state.copyWith(getDataUser: GetDataUserState.loading));
    final userOrFailure = await getDataUser(event.idUser);

    userOrFailure.fold(
        (l) => print(l.message),
        (user) => emit(state.copyWith(
            user: user, getDataUser: GetDataUserState.getDataSuccess)));
  }
}
