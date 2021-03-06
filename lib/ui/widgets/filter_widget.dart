import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  List<String> items;
  FilterWidget(this.items);

  @override
  _FilterWidgetState createState() => _FilterWidgetState(items);
}

class _FilterWidgetState extends State<FilterWidget> {
  List<bool> _isChecked;
  List<String> items;
  _FilterWidgetState(this.items);

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(items.length, false);
    //It creates a list of the given length(first parameter) and fill initial value(second parameter) all list.
  }

//todo: content adjustment with the title of dialog
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), //<--here
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              items[index],
            ),
            value: _isChecked[index],
            onChanged: (val) {
              print('ajsjasa' + val.toString());
              setState(
                () {
                  _isChecked[index] = val;
                },
              );
            },
          );
        },
      ),
    );
  }
}
