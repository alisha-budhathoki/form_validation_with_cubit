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
  AgeValidationLessError validatorFirstCase(String value) {
    print(value.isNotEmpty);
    return this.isAgeLess(value) ? null : AgeValidationLessError.invalidAgeLess;
  }

  @override
  AgeValidationMoreError validatorSecondCase(String value) {
    return this.isAgeGreater(value)
        ? null
        : AgeValidationMoreError.invalidAgeMore;
  }
}
