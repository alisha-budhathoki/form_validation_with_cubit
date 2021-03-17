part of 'password_cubit_cubit.dart';

@immutable
abstract class PasswordCubitState {}

class PasswordCubitInitial extends PasswordCubitState {}
class PasswordTextInitial extends PasswordCubitState {}

class PasswordTextEmpty extends PasswordCubitState {}

class PasswordTextInvalid extends PasswordCubitState {}

class PasswordTextValid extends PasswordCubitState {}
