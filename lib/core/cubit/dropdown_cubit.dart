import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:textfield_validation_bloc/core/model/category.dart';

part 'dropdown_state.dart';

class DropdownCubit extends Cubit<DropdownState> {
  final Category category;

  DropdownCubit(
    this.category,
  ) : super(DropdownInitial());

  void setCategory(String selectedCategory) {
    category.categoryId = selectedCategory;
    emit(DropdownLoaded());
  }
}

class DataBase {
  getCategoriesD() {
    return [
      "All",
      "Deep Learning Course",
      "Python Data Science",
      "Artificial Intelligence",
      "Algorithms and Data Structure",
      "Foundation of Data Science"
    ];
  }
}
