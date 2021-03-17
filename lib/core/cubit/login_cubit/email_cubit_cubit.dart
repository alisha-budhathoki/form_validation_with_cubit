import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

part 'email_cubit_state.dart';

class EmailCubitCubit extends Cubit<EmailCubitState> with ValidationMixin{
  EmailCubitCubit() : super(EmailCubitInitial());

Future<void> checkEmailError(String email) async {
    print('inside print error checking');
    if (this.isFieldEmpty(email)) {
      print('Empty email here');
      emit(EmailValueEmpty());
    } else if (!this.validateEmailAddress(email)) {
      print('Invalid email here');
      emit(EmailValueInvalid());
    } else {
      print('valid email ');
      emit(EmailValueValid());
    }
  }
}
