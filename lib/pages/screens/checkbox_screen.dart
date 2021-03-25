import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/cubit/checkbox_cubit.dart';

class CheckboxScreen extends StatelessWidget {
  const CheckboxScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckboxCubit, CheckboxState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.checkboxes.length ?? 0,
            itemBuilder: (context, index) => CheckboxListTile(
              value: state.checkboxes[index].isChecked ? true : false,
              title: Text(state.checkboxes[index].label),
              onChanged: (val) {
                context.read<CheckboxCubit>().toggleCheckbox(index);
              },
            ),
          );
        },
      ),
    );
  }
}
