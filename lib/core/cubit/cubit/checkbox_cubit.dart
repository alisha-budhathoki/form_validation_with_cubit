import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/model/checkbox.dart';
import 'package:textfield_validation_bloc/core/model/data.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit()
      : super(
          CheckboxState(gCheckboxes),
        );

  void reset() {
    // Retrieve the current checkboxes
    var checkboxes = this.state.checkboxes;

    // Uncheck all of them
    checkboxes.forEach(
      (checkbox) {
        checkbox.uncheck();
      },
    );

    // Emit the new state/configuration
    emit(
      CheckboxState(checkboxes),
    );
  }

  void toggleCheckbox(int index) {
    var checkboxes = this.state.checkboxes;

    if (checkboxes != null && checkboxes[index] != null) {
      // Toggle the checkbox by given index
      checkboxes[index].toggle();
    }
    // Emit the new state/configuration
    emit(
      CheckboxState(checkboxes),
    );
  }
}
