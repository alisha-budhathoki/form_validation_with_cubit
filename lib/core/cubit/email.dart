import 'package:formz/formz.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

enum EmailValidationError { invalid }

class EmailState extends FormzInput<String, EmailValidationError>
    with ValidationMixin {
  const EmailState.pure() : super.pure('');
  const EmailState.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError validator(String value) {
    return this.isValidEmailAddress(value)
        ? null
        : EmailValidationError.invalid;
  }
}
