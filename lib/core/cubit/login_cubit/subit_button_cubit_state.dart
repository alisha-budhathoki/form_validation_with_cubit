part of 'submit_button_cubit.dart';

@immutable
abstract class SubmitCubitState {}

class SignInCubitInitial extends SubmitCubitState {}

class SignInButtonEmpty extends SubmitCubitState {}

class SignInButtonValid extends SubmitCubitState {}

class SignInButtonInvalid extends SubmitCubitState {}
