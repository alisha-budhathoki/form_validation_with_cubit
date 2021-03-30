import 'package:textfield_validation_bloc/core/cubit/formz_local.dart';
import 'package:textfield_validation_bloc/core/mixins/validation_mixins.dart';

enum AgeValidationLessError { invalidAgeLess }
enum AgeValidationMoreError { invalidAgeMore }

class AgeState
    extends FormzInput<String, AgeValidationLessError, AgeValidationMoreError>
    with ValidationMixin {
  const AgeState.pure() : super.pure('');
  const AgeState.dirty([String value = '']) : super.dirty(value);

  @override
  AgeValidationLessError validator(String value) {
    print(value.isNotEmpty);
    return this.isAgeLess(value) ? null : AgeValidationLessError.invalidAgeLess;
  }

  @override
  AgeValidationMoreError validatorSecond(String value) {
    print("Inside here");
    return this.isAgeGreater(value)
        ? null
        : AgeValidationMoreError.invalidAgeMore;
  }
}
