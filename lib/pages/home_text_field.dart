import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/cubit/login_cubit/email_cubit_cubit.dart';
import '../core/cubit/login_cubit/password_cubit_cubit.dart';
import '../core/cubit/login_cubit/submit_button_cubit.dart';

class HomeTextField extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<EmailCubitCubit, EmailCubitState>(
          builder: (context, stateEmail) {
            return TextFormField(
              onChanged: (text) {
                context
                    .read<EmailCubitCubit>()
                    .checkEmailError(this._emailController.text);
                context.read<SubmitButtonCubit>().signInInput({
                  "email": _emailController.text,
                  "password": _passwordController.text
                });
              },
              decoration: InputDecoration(
                  hintText: 'email',
                  labelText: "Email",
                  labelStyle: emailLabelStyle(stateEmail)),
              controller: this._emailController,
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<PasswordCubitCubit, PasswordCubitState>(
          builder: (context, statePassword) {
            return TextField(
              onChanged: (text) {
                context
                    .read<PasswordCubitCubit>()
                    .checkPasswordError(this._passwordController.text);
                context.read<SubmitButtonCubit>().signInInput({
                  "email": _emailController.text,
                  "password": _passwordController.text
                });
              },
              decoration: InputDecoration(
                  hintText: 'password',
                  labelText: "Password",
                  labelStyle: passwordLabelStyle(statePassword)),
              controller: this._passwordController,
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<SubmitButtonCubit, SubmitCubitState>(
          builder: (context, state) {
            return RaisedButton(
                color: getColorButton(state),
                onPressed: () {
                  context.read<SubmitButtonCubit>().signInInput({
                    "email": _emailController.text,
                    "password": _passwordController.text
                  });
                },
                child: Text(
                  'submit',
                  style: TextStyle(color: Colors.white),
                ));
          },
        )
      ],
    )));
  }

  TextStyle emailLabelStyle(EmailCubitState state) {
    if (state is EmailValueEmpty) {
      return TextStyle(color: Colors.grey);
    }
    if (state is EmailValueInvalid) {
      return TextStyle(color: Colors.red);
    }
    if (state is EmailValueValid) {
      return TextStyle(color: Colors.green);
    }
    return TextStyle(color: Colors.grey);
  }

  TextStyle passwordLabelStyle(PasswordCubitState state) {
    if (state is PasswordTextEmpty) {
      return TextStyle(color: Colors.grey);
    }
    if (state is PasswordTextInvalid) {
      return TextStyle(color: Colors.red);
    }
    if (state is PasswordTextValid) {
      return TextStyle(color: Colors.green);
    }

    return TextStyle(color: Colors.grey);
  }

  getColorButton(SubmitCubitState state) {
    print('janjsb' + state.toString());
    if (state is SignInButtonEmpty) {
      print("ajashja");
      return Colors.grey;
    } else if (state is SignInButtonInvalid) {
      print('ansjaj');
      return Colors.grey;
    } else if (state is SignInButtonValid) {
      print('assbhab23');
      return Colors.green;
    }
  }
}
