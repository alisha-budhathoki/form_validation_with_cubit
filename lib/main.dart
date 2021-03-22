import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/cubit/login_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/email_cubit_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/password_cubit_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit/submit_button_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/text_login_cubit.dart';
import 'package:textfield_validation_bloc/pages/home_text_field.dart';
import 'package:textfield_validation_bloc/pages/login_form.dart';

void main() {
  List _providersArray = [
    EmailCubitCubit(),
    TextLoginCubit(),
    PasswordCubitCubit(),
    SubmitButtonCubit()
  ];
  List<BlocProvider> providers =
      []; // make sure you have the right type of the List<>, which the `providers` in `Multiproviders` accepts
  for (var provider in _providersArray) {
    //adding the provider name to the ChangeNotifier
    providers.add(BlocProvider(create: (_) => provider()));
  }
  runApp(MultiBlocProvider(
    // providers: providers,
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
