part of 'text_login_cubit.dart';

@immutable
abstract class TextLoginState {}

class TextInitial extends TextLoginState {}

class TextEmpty extends TextLoginState {}

class TextInvalid extends TextLoginState {}

class TextValid extends TextLoginState {}
