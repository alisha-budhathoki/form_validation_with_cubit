import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

part 'subit_button_cubit_state.dart';

class SubmitButtonCubit extends Cubit<SubmitCubitState> with ValidationMixin {
  SubmitButtonCubit() : super(SignInCubitInitial());

  signInInput(Map<String, String> map) async {
    String email = map['email'];
    String password = map['password'];

    if (this.isFieldEmpty(email) || this.isFieldEmpty(password)) {
      print('Empty email and password here');
      emit(SignInButtonEmpty());
    } else if (!this.validateEmailAddress(email) || !this.isPasswordValiid(password)) {
      emit(SignInButtonInvalid());
      print("Invalid email and password");
    } else {
      print("Valid email and password");
      emit(SignInButtonValid());
    }
  }
}
