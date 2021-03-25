import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/cubit/checkbox_cubit.dart';
import 'core/cubit/login_cubit.dart';
import 'pages/router/app_router.dart';
import 'pages/screens/login_form.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        lazy: true,
        create: (_) => LoginCubit(),
      ),
      BlocProvider(
        lazy: true,
        create: (_) => CheckboxCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginForm(),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
