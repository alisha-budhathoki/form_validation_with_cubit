import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

part 'text_login_state.dart';

class TextLoginCubit extends Cubit<TextLoginState> with ValidationMixin {
  TextLoginCubit() : super(EmailTextInitial());

  Future<void> checkEmailError(String email) async {
    print('inside print error checking');
    if (this.isFieldEmpty(email)) {
      print('Empty email here');
      emit(EmailTextEmpty());
    } else if (!this.validateEmailAddress(email)) {
      print('Invalid email here');
      emit(EmailTextInvalid());
    } else {
      emit(EmailTextValid());
    }
  }
 Future<void> checkPasswordError(String password) async {
    print('inside print error checking');
    if (this.isFieldEmpty(password)) {
      print('Empty Password here');
      emit(LoginPasswordEmpty());
    } else if (password.length <3) {
      print('Invalid password here');
      emit(LoginPasswordInvalid());
    } else {
      emit(LoginPassswordValid());
    }
  }
  signInInput(Map<String, String> map) async {
    String email = map['email'];
    String password = map['password'];

    if (this.isFieldEmpty(email) || this.isFieldEmpty(password)) {
      print('Empty email and password here');
      emit(ButtonEmpty());
    } else if (!this.validateEmailAddress(email) || password.length<3) {
      emit(ButtonValid());
      print("Invalid email and password");
    } else {
      print("Valid email and password");
      emit(ButtonInvalid());
    }
  } 
}
