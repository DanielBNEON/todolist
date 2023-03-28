import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final Function(bool) onCheck;
  const CustomCheckBox({Key? key, required this.onCheck}) : super(key: key);


  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return  Checkbox(
        checkColor: Colors.white,
        activeColor: Theme.of(context).colorScheme.primary,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
          widget.onCheck(isChecked);
        },
    );
  }
}
