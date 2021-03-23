part of 'login_cubit.dart';

class LoginState {
  final EmailState email;
  final PasswordState password;
  final FormzStatus status;

  const LoginState({
    this.email = const EmailState.pure(),
    this.password = const PasswordState.pure(),
    this.status = FormzStatus.pure,
  });

  LoginState copyWith({
    EmailState email,
    PasswordState password,
    FormzStatus status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
