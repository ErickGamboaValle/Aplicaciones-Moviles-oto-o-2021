part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class AccountNewImageState extends ProfileState {
  final File image;

  AccountNewImageState({required this.image});
  @override
  List<Object> get props => [image];
}

class UserAuthSuccessState extends ProfileState {}

class ErrorState extends ProfileState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
  @override
  // TODO: implement props
  List<Object> get props => [errorMsg];
}
