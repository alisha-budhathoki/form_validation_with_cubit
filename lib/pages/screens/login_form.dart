import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:textfield_validation_bloc/core/cubit/login_cubit.dart';
import 'package:textfield_validation_bloc/core/cubit/formz_local.dart';
import 'package:textfield_validation_bloc/ui/styles/palette.dart';
import 'package:textfield_validation_bloc/ui/widgets/custom_linear_progressbar.dart';
import 'package:textfield_validation_bloc/ui/widgets/segmented_progressbar.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final ageController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {},
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
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
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
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
                      ? Colors.black
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
                      ? Colors.black
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: true,
              controller: ageController,
              keyboardType: TextInputType.number,
              onChanged: (age) => context.read<LoginCubit>().ageChanged(age),
              decoration: InputDecoration(
                labelText: 'age',
                labelStyle: TextStyle(
                  color: state.age.pure
                      ? Colors.grey
                      : state.age.validFirstCase || state.age.validSecondCase
                          ? Colors.green
                          : Colors.black,
                ),
              ),
              validator: (val) {
                // print('aasna' + state.age.valid.toString());
                // print('asjjshj' + state.age.valid.toString());
                // if (state.age.valid)
                //   return 'valid first condition';
                // else if (state.age.validSecond)
                //   return 'valid second condition';
                // else
                //   return 'Invalid all conditions';
              },
            ),
            SizedBox(
              height: 5,
            ),
            if (state.age.validFirstCase)
              Text(
                'valid first condition',
                style: TextStyle(color: Colors.green),
              )
            else if (state.age.validSecondCase)
              Text(
                'valid second condition',
                style: TextStyle(color: Colors.green),
              )
            else if (state.age.pure)
              Text('')
            else
              Text(
                'Invalid all conditions',
                style: TextStyle(color: Colors.red),
              )
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure == true) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed signed in'),
            ),
          );
        }
        if (state.status.isSubmissionSuccess == true) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign in successful'),
            ),
          );
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      // buildWhen: (previous, current) => previous.status != current.status,
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
                        context.read<LoginCubit>().submitValues(
                              emailController.text.toString(),
                              passwordController.text.toString(),
                              ageController.text.toString(),
                            );
                      }
                    : null,
              );
      },
    );
  }
}
