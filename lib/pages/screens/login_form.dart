import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit.dart';
import 'package:formz/formz.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final ageController = TextEditingController();

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _EmailInput(),
                  const SizedBox(height: 8.0),
                  _PasswordInput(),
                  const SizedBox(height: 8.0),
                  _AgeInput(),
                  const SizedBox(height: 8.0),
                  _LoginButton(),
                ],
              ),
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
          controller: emailController,
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
          controller: passwordController,
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

class _AgeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return TextField(
          controller: ageController,
          keyboardType: TextInputType.number,
          onChanged: (age) => context.read<LoginCubit>().ageChanged(age),
          decoration: InputDecoration(
            labelText: 'age',
            labelStyle: TextStyle(
              color: state.age.pure
                  ? Colors.grey
                  : state.age.invalid
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
        return state.status.isSubmissionInProgress
            ? CircularProgressIndicator()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: Colors.green,
                ),
                child: const Text('SUBMIT'),
                onPressed: state.status.isValidated
                    ? () {
                        state.status.isSubmissionFailure.toString() == "true"
                            ? {
                                print('abc' +
                                    "   " +
                                    state.status.isSubmissionFailure
                                        .toString()),
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed signed in'),
                                  ),
                                )
                              }
                            : {};
                        state.status.isSubmissionSuccess.toString() == "true"
                            ? {
                                print('xyz' +
                                    "   " +
                                    state.status.isSubmissionFailure
                                        .toString()),
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Sign in successful'),
                                  ),
                                )
                              }
                            : null;
                        context.read<LoginCubit>().submitValues(
                              emailController.text.toString(),
                              passwordController.text.toString(),
                              ageController.text.toString(),
                            );

                        // print(emailController.text.toString());
                        // Navigator.of(context).pushNamed(
                        //   '/home',
                        // );
                      }
                    : null,
              );
      },
    );
  }
}
