import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

part 'password_cubit_state.dart';

class PasswordCubitCubit extends Cubit<PasswordCubitState>
    with ValidationMixin {
  PasswordCubitCubit() : super(PasswordCubitInitial());
  Future<void> checkPasswordError(String password) async {
    print('inside print error checking');
    if (this.isFieldEmpty(password)) {
      print('Empty Password here');
      emit(PasswordTextEmpty());
    } else if (!this.isPasswordValiid(password)) {
      print(
          'Invalid password here' + this.isPasswordValiid(password).toString());
      emit(PasswordTextInvalid());
    } else {
      emit(PasswordTextValid());
    }
  }
}
