/// Checkbox entity which stores the label and whether is selected or not.
class CheckBox {
  final String label;
  bool isChecked;

  CheckBox(this.label, {this.isChecked = false});

  void check() {
    this.isChecked = true;
  }

  void uncheck() {
    this.isChecked = false;
  }

  void toggle() {
    this.isChecked = !this.isChecked;
  }
}
