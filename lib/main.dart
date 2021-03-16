import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/text_login_cubit.dart';
import 'package:textfield_validation_bloc/pages/home_text_field.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TextLoginCubit>(
      create: (context) => TextLoginCubit(),
      child: MaterialApp(
        home: HomeTextField(),
      ),
    );
  }
}



