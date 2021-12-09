part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeAccountImageEvent extends ProfileEvent {}

class UserAccountAuthEvent extends ProfileEvent {}

//class SaveAccountEvent extends ProfileEvent {}