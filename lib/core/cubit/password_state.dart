import 'package:formz/formz.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

enum PasswordValidationError { invalid }

class PasswordState extends FormzInput<String, PasswordValidationError>
    with ValidationMixin {
  const PasswordState.pure() : super.pure('');
  const PasswordState.dirty([String value]) : super.dirty(value);

  @override
  PasswordValidationError validator(String value) {
    return this.isPasswordValiid(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
