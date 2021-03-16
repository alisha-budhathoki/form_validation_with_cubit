part of 'text_login_cubit.dart';

@immutable
abstract class TextLoginState {}

class EmailTextInitial extends TextLoginState {}

class EmailTextEmpty extends TextLoginState {}

class EmailTextInvalid extends TextLoginState {}

class EmailTextValid extends TextLoginState {}

class PasswordTextInitial extends TextLoginState {}

class PasswordTextEmpty extends TextLoginState {}

class PasswordTextInvalid extends TextLoginState {}

class PasswordTextValid extends TextLoginState {}

