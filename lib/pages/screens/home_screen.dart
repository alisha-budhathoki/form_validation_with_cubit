import 'package:flutter/material.dart';
import 'package:textfield_validation_bloc/widgets/custom_dialog.dart';
import 'package:textfield_validation_bloc/widgets/filter_adances_widget.dart';
import 'package:textfield_validation_bloc/widgets/filter_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return CustomDialog(
                        title: "Feedback",
                        content: FilterAdvancedWidget(),
                        firstActionValue: "okay",
                        secondActionValue: "cancel");
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: Colors.teal,
              ),
              child: Text('open dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/checkbox_screen',
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: Colors.teal,
              ),
              child: Text('open checkbox screen'),
            ),
          ],
        ),
      ),
    );
  }
}
