part of 'text_login_cubit.dart';

@immutable
abstract class TextLoginState {}

class EmailTextInitial extends TextLoginState {}

class EmailTextEmpty extends TextLoginState {}

class EmailTextInvalid extends TextLoginState {}

class EmailTextValid extends TextLoginState {}

class LoginPasswordInitial extends TextLoginState {}

class LoginPasswordEmpty extends TextLoginState {}

class LoginPasswordInvalid extends TextLoginState {}

class LoginPassswordValid extends TextLoginState {}

class ButtonEmpty extends TextLoginState {}

class ButtonValid extends TextLoginState {}

class ButtonInvalid extends TextLoginState {}
