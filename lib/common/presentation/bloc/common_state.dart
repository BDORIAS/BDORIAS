part of 'common_bloc.dart';

enum UploadImage { idle, loading, uploadImageSuccess, error }

enum GetDataUserState { idle, loading, getDataSuccess, error }

class CommonState extends Equatable {
  final UploadImage uploadImage;
  final GetDataUserState getDataUser;

  final User? user;

  final String errorMessage;
  const CommonState({
    this.user,
    this.uploadImage = UploadImage.idle,
    this.getDataUser = GetDataUserState.idle,
    this.errorMessage = "",
  });
  CommonState copyWith({
    UploadImage? uploadImage,
    GetDataUserState? getDataUser,
    User? user,
    String? errorMessage,
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      CommonState(
        uploadImage: uploadImage ?? this.uploadImage,
        getDataUser: getDataUser ?? this.getDataUser,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
  @override
  List<Object?> get props => [
        uploadImage,
        getDataUser,
        user,
        errorMessage,
      ];
}
