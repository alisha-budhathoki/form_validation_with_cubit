library formz;

/// Enum representing the status of a form at any given point in time.
enum FormzStatus {
  /// The form has not been touched.
  pure,

  /// The form has been completely validated.
  valid,

  /// The form contains one or more invalid inputs.
  invalid,

  /// The form is in the process of being submitted.
  submissionInProgress,

  /// The form has been submitted successfully.
  submissionSuccess,

  /// The form submission failed.
  submissionFailure
}

const _validatedFormzStatuses = <FormzStatus>{
  FormzStatus.valid,
  FormzStatus.submissionInProgress,
  FormzStatus.submissionSuccess,
  FormzStatus.submissionFailure,
};

/// Useful extensions on [FormzStatus]
extension FormzStatusX on FormzStatus {
  /// Indicates whether the form is untouched.
  bool get isPure => this == FormzStatus.pure;

  /// Indicates whether the form is completely validated.
  bool get isValid => this == FormzStatus.valid;

  /// Indicates whether the form has been validated successfully.
  /// This means the [FormzStatus] is either:
  /// * `FormzStatus.valid`
  /// * `FormzStatus.submissionInProgress`
  /// * `FormzStatus.submissionSuccess`
  /// * `FormzStatus.submissionFailure`
  bool get isValidated => _validatedFormzStatuses.contains(this);

  /// Indicates whether the form contains one or more invalid inputs.
  bool get isInvalid => this == FormzStatus.invalid;

  /// Indicates whether the form is in the process of being submitted.
  bool get isSubmissionInProgress => this == FormzStatus.submissionInProgress;

  /// Indicates whether the form has been submitted successfully.
  bool get isSubmissionSuccess => this == FormzStatus.submissionSuccess;

  /// Indicates whether the form submission failed.
  bool get isSubmissionFailure => this == FormzStatus.submissionFailure;
}

/// Enum representing the status of a form input at any given point in time.
enum FormzInputStatus {
  /// The form input has not been touched.
  pure,

  /// The form input is valid.
  valid,

  /// The form input is not valid.
  invalid,
}

/// {@template form_input}
/// A [FormzInput] represents the value of a single form input field.
/// It contains information about the [FormzInputStatus], [value], as well
/// as validation status.
///
/// [FormzInput] should be extended to define custom [FormzInput] instances.
///
/// ```dart
/// enum FirstNameError { empty }
/// class FirstName extends FormzInput<String, FirstNameError> {
///   const FirstName.pure({String value = ''}) : super.pure(value);
///   const FirstName.dirty({String value = ''}) : super.dirty(value);
///
///   @override
///   FirstNameError validator(String value) {
///     return value?.isNotEmpty == true ? null : FirstNameError.empty;
///   }
/// }
/// ```
/// {@endtemplate}
abstract class FormzInput<T, E1, E2> {
  const FormzInput._(this.value, [this.pure = true]);

  /// Constructor which create a `pure` [FormzInput] with a given value.
  const FormzInput.pure(T value) : this._(value);

  /// Constructor which create a `dirty` [FormzInput] with a given value.
  const FormzInput.dirty(T value) : this._(value, false);

  /// The value of the given [FormzInput].
  /// For example, if you have a `FormzInput` for `FirstName`,
  /// the value could be 'Joe'.
  final T value;

  /// If the [FormzInput] is pure (has been touched/modified).
  /// Typically when the `FormzInput` is initially created,
  /// it is created using the `FormzInput.pure` constructor to
  /// signify that the user has not modified it.
  ///
  /// For subsequent changes (in response to user input), the
  /// `FormzInput.dirty` constructor should be used to signify that
  /// the `FormzInput` has been manipulated.
  final bool pure;

  /// The [FormzInputStatus] which can be one of the following:
  /// * [FormzInputStatus.pure]
  ///   - if the input has not been modified.
  /// * [FormzInputStatus.invalid]
  ///   - if the input has been modified and validation failed.
  /// * [FormzInputStatus.valid]
  ///   - if the input has been modified and validation succeeded.
  FormzInputStatus get status => pure
      ? FormzInputStatus.pure
      : validFirstCase
          ? FormzInputStatus.valid
          : FormzInputStatus.invalid;

  /// Returns a validation error if the [FormzInput] is invalid.
  /// Returns `null` if the [FormzInput] is valid.
  bool get validFirstCase => validatorFirstCase(value) == null;
  bool get validSecondCase => validatorSecondCase(value) == null;

  /// Whether the [FormzInput] value is not valid.
  /// A value is invalid when the overridden `validator`
  /// returns an error (non-null value).
  bool get invalid => status == FormzInputStatus.invalid;

  /// A function that must return a validation error if the provided
  /// [value] is invalid and `null` otherwise.
  E1 validatorFirstCase(T value);
  E2 validatorSecondCase(T value);

  @override
  int get hashCode => value.hashCode ^ pure.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is FormzInput<T, E1, E2> &&
        other.value == value &&
        other.pure == pure;
  }

  @override
  String toString() => '$runtimeType($value, $pure)';
}

/// Class which contains methods that help manipulate and manage
/// [FormzStatus] and [FormzInputStatus] instances.
class Formz {
  /// Returns a [FormzStatus] given a list of [FormzInput].
  static FormzStatus validate(List<FormzInput> inputs) {
    assert(inputs != null);
    return inputs.every((element) => element.pure)
        ? FormzStatus.pure
        : inputs.any((input) => input.validFirstCase == false)
            ? FormzStatus.invalid
            : FormzStatus.valid;
  }
}

mixin FormzMixin {
  FormzStatus get status => Formz.validate(inputs);

  /// Returns all [FormzInput] instances.
  ///
  /// Override this and give it all [FormzInput]s in your class that should be
  /// validated automatically.
  List<FormzInput> get inputs;
}
