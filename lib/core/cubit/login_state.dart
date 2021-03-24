part of 'login_cubit.dart';

class LoginState {
  final EmailState email;
  final PasswordState password;
  final AgeState age;
  final FormzStatus status;

//assigning initial states
  const LoginState({
    this.email = const EmailState.pure(),
    this.password = const PasswordState.pure(),
    this.age = const AgeState.pure(),
    this.status = FormzStatus.pure,
  });

//assigning new states everytime
  LoginState copyWith({
    EmailState email,
    PasswordState password,
    AgeState age,
    FormzStatus status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      age: age ?? this.age,
      status: status ?? this.status,
    );
  }
}
