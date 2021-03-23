import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/pages/login_form.dart';

import 'core/cubit/login_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        lazy: true,
        create: (_) => LoginCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginForm(),
    );
  }
}
