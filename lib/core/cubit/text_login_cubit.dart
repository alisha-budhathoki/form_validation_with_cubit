import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';
import 'package:textfield_validation_bloc/core/models/enums.dart';

part 'text_login_state.dart';

class TextLoginCubit extends Cubit<TextLoginState> with ValidationMixin {
  TextLoginCubit() : super(TextInitial());

  Future<void> checkError(String email) async {
    print('inside print error checking');
    if (this.isFieldEmpty(email)) {
      print('Empty email here');
      emit (TextEmpty());
    }
    if(!this.validateEmailAddress(email)){
      print('Invalid email here');
      emit(TextInvalid());
    }
    else{
      emit(TextValid());
    }
  }
}
