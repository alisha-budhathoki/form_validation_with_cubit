import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/text_login_cubit.dart';

class HomeTextField extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (_) => TextLoginCubit(),
      child: Scaffold(
          body: Center(child: BlocBuilder<TextLoginCubit, TextLoginState>(
        builder: (context, state) {
          print('sjs' + state.toString());
          if (state is EmailTextEmpty) {
            print('sdnssempty');
          }
          if (state is EmailTextInvalid) {
            print('sdnssinvalid');
            // return Text("jsbh43643");
          }
          if (state is EmailTextValid) {
            print('sdnssinvalid valid email');
            // return Text('alisha');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (text) {
                  BlocProvider.of<TextLoginCubit>(context)
                      .checkEmailError(this._emailController.text);
                },
                decoration: InputDecoration(
                    hintText: 'email',
                    labelText: "Email",
                    labelStyle: emailLabelStyle(state)),
                controller: this._emailController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (text) {
                  BlocProvider.of<TextLoginCubit>(context)
                      .checkPasswordError(this._passwordController.text);
                },
                decoration: InputDecoration(
                    hintText: 'password',
                    labelText: "Password",
                    labelStyle: passwordLabelStyle(state)),
                controller: this._passwordController,
              )
            ],
          );
        },
      ))),
    );
  }

  TextStyle emailLabelStyle(TextLoginState state) {
    if (state is EmailTextEmpty) {
      return TextStyle(color: Colors.red);
    }
    if (state is EmailTextInvalid) {
      return TextStyle(color: Colors.yellow);
    }
    if (state is EmailTextValid) {
      return TextStyle(color: Colors.black);
    }
    return TextStyle(color: Colors.green);
  }

  TextStyle passwordLabelStyle(TextLoginState state) {
    if (state is PasswordTextEmpty) {
      return TextStyle(color: Colors.red);
    }
    if (state is PasswordTextInvalid) {
      return TextStyle(color: Colors.yellow);
    }
    if (state is PasswordTextValid) {
      return TextStyle(color: Colors.black);
    }
    return TextStyle(color: Colors.green);
  }
}
