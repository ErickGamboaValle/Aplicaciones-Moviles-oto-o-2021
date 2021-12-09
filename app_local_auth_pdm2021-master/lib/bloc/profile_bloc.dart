// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  var _localAuth = LocalAuthentication();
  ProfileBloc() : super(ProfileInitial()) {
    on<ChangeAccountImageEvent>(_onChangedImage);
    on<UserAccountAuthEvent>(_onAccountVerification);
  }
  void _onChangedImage(
    ChangeAccountImageEvent event,
    Emitter emit,
  ) async {
    try {
      File? img = await _pickImage();
      if (img != null) {
        emit(AccountNewImageState(image: img));
      } else {
        throw Exception();
      }
    } catch (e) {
      emit(ErrorState(errorMsg: "No se pudo cargar la imagen"));
    }
  }

  void _onAccountVerification(
    UserAccountAuthEvent event,
    Emitter emit,
  ) async {
    if (await _checkBiometrics()) {
      bool authenticated = await _authentication();
      emit(
        authenticated
            ? UserAuthSuccessState()
            : ErrorState(errorMsg: "No se pudo autenticar"),
      );
    } else {
      emit(
        ErrorState(errorMsg: "No se encontraron sensores"),
      );
    }
  }

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final XFile? chosenImage = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return chosenImage != null ? File(chosenImage.path) : null;
  }

  Future<bool> _checkBiometrics() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _authentication() async {
    try {
      return await _localAuth.authenticate(localizedReason: "Autenticar");
    } catch (e) {
      return false;
    }
  }
}
