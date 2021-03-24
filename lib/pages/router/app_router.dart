import 'package:flutter/material.dart';
import 'package:textfield_validation_bloc/pages/screens/home_screen.dart';
import 'package:textfield_validation_bloc/pages/screens/login_form.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    final GlobalKey<ScaffoldState> key = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoginForm(
              // title: "Home Screen",
              // color: Colors.blueAccent,
              ),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
    }
  }
}
