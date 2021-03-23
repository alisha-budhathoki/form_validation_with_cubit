import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _EmailInput(),
                const SizedBox(height: 8.0),
                _PasswordInput(),
                const SizedBox(height: 8.0),
                _LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'email',
            labelStyle: TextStyle(
              color: state.email.pure
                  ? Colors.grey
                  : state.email.invalid
                      ? Colors.red
                      : Colors.green,
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            labelStyle: TextStyle(
              color: state.password.pure
                  ? Colors.grey
                  : state.password.invalid
                      ? Colors.red
                      : Colors.green,
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return RaisedButton(
          onPressed: () {},
          child: Text(
            'SUBMIT',
            style: TextStyle(
              color: state.status.isPure
                  ? Colors.black
                  : state.status.isInvalid
                      ? Colors.black
                      : Colors.white,
            ),
          ),
          color: state.status.isPure
              ? Colors.grey
              : state.status.isInvalid
                  ? Colors.grey
                  : Colors.green,
        );
      },
    );
  }
}
