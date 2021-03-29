import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/dropdown_cubit.dart';
import 'package:textfield_validation_bloc/core/model/data.dart';

class DropdownScreen extends StatelessWidget {
  DropdownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = context.bloc<DropdownCubit>().category;
    return Scaffold(
      body: BlocBuilder<DropdownCubit, DropdownState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 20.09,
                  ),
                  isExpanded: true,
                  value: (state is DropdownLoaded)
                      ? category.categoryId
                      : dropdownValue,
                  items: dropdownContents
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          child: Text(
                            item,
                          ),
                          value: item,
                        ),
                      )
                      .toList(),
                  onChanged: (String val) {
                    context.read<DropdownCubit>().setCategory(val);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
