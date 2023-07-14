part of 'home_bloc.dart';

enum CreateRequestStatus { idle, loading, loadSuccess, cachedSuccess, error }
enum GetRequestStatus { idle, loading, loadSuccess, cachedSuccess, error }

class HomeState extends Equatable {
  final bool isLoginPasswordHide;
  final CreateRequestStatus createRequestStatus;
  final GetRequestStatus getRequestStatus;
  final FormUser? formUserEntity;
  final String errorMessage;
  const HomeState({
    this.isLoginPasswordHide = true,
    this.createRequestStatus = CreateRequestStatus.idle,
    this.getRequestStatus = GetRequestStatus.idle,
    this.errorMessage = '',
    this.formUserEntity,
  });

  HomeState copyWith({
    bool? isLoginPasswordHide,
    CreateRequestStatus? createRequestStatus,
    GetRequestStatus? getRequestStatus,
    String? errorMessage,
    FormUser? formUserEntity,
  }) {
    return HomeState(
      createRequestStatus: createRequestStatus ?? this.createRequestStatus,
      getRequestStatus: getRequestStatus ?? this.getRequestStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      formUserEntity: formUserEntity ?? this.formUserEntity,
    );
  }

  @override
  List<Object> get props => [
        isLoginPasswordHide,
        createRequestStatus,
        getRequestStatus,
        errorMessage,
      ];
}
