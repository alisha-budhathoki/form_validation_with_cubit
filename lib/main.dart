import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/email_cubit_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/password_cubit_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/submit_button_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/text_login_cubit.dart';
import 'package:textfield_validation_bloc/pages/home_text_field.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        lazy: true,
        create: (_) => EmailCubitCubit(),
      ),
      BlocProvider(
        lazy: true,
        create: (_) => TextLoginCubit(),
      ),
      BlocProvider(
        lazy: true,
        create: (_) => PasswordCubitCubit(),
      ),
      BlocProvider(
        lazy: true,
        create: (_) => SubmitButtonCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

AppProvider() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeTextField(),
    );
  }
}
