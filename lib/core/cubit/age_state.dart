import 'package:formz/formz.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

enum AgeValidationError { invalid }

class AgeState extends FormzInput<String, AgeValidationError>
    with ValidationMixin {
  const AgeState.pure() : super.pure('');
  const AgeState.dirty([String value = '']) : super.dirty(value);

  @override
  AgeValidationError validator(String value) {
    print(value.isNotEmpty);
    // return this.isValidAge(value) ? null : AgeValidationError.invalid;
    return this.isAgeGreater(value)
        ? this.isAgeLess(value)
            ? null
            : AgeValidationError.invalid
        : AgeValidationError.invalid;
  }
}
