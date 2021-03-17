part of 'email_cubit_cubit.dart';

@immutable
abstract class EmailCubitState {}

class EmailCubitInitial extends EmailCubitState {}

class EmailValueEmpty extends EmailCubitState {}

class EmailValueInvalid extends EmailCubitState {}

class EmailValueValid extends EmailCubitState {}