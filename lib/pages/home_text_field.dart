import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_validation_bloc/core/cubit/text_login_cubit.dart';

class HomeTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (_) => TextLoginCubit(),
      child: Scaffold(
          body: Center(child: BlocBuilder<TextLoginCubit, TextLoginState>(
        builder: (context, state) {
          print('sjs' + state.toString());
          if (state is TextEmpty) {
            print('sdnss');
          }
          if (state is TextInvalid) {
            print('sdnssinvalid');
            return Text("jsbh43643");
          }
          if (state is TextValid) {
            print('sdnssinvalid');
            return Text('alisha');
          }
          return TextFormField(

          )
        },
      ))),
    );
  }
}
