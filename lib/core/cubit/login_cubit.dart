import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'age_state.dart';
import 'email_state.dart';
import 'password_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void emailChanged(String value) {
    final email = EmailState.dirty(value);

    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password, state.age]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordState.dirty(value);

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password, state.age]),
      ),
    );
  }

  void ageChanged(String value) {
    final age = AgeState.dirty(value);

    emit(
      state.copyWith(
        age: age,
        status: Formz.validate([state.email, state.password, age]),
      ),
    );
  }
}
