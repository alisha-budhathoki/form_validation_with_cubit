import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';
import 'package:textfield_validation_bloc/core/cubit/formz_local.dart';

enum EmailValidationError { invalid }

class EmailState
    extends FormzInput<String, EmailValidationError, EmailValidationError>
    with ValidationMixin {
  const EmailState.pure() : super.pure('');
  const EmailState.dirty([String value]) : super.dirty(value);

  @override
  EmailValidationError validator(String value) {
    return this.isValidEmailAddress(value)
        ? null
        : EmailValidationError.invalid;
  }

  @override
  EmailValidationError validatorSecond(String value) {
    // TODO: implement validatorSecond
    throw UnimplementedError();
  }
}
