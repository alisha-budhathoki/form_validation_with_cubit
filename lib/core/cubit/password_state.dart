import 'package:textfield_validation_bloc/core/cubit/formz_local.dart';

import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

enum PasswordValidationError { invalid }

class PasswordState
    extends FormzInput<String, PasswordValidationError, PasswordValidationError>
    with ValidationMixin {
  const PasswordState.pure() : super.pure('');
  const PasswordState.dirty([String value]) : super.dirty(value);

  @override
  PasswordValidationError validatorFirstCase(String value) {
    return this.isPasswordValiid(value)
        ? null
        : PasswordValidationError.invalid;
  }

  @override
  PasswordValidationError validatorSecondCase(String value) {
    throw UnimplementedError();
  }
}
