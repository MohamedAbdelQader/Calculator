import 'package:flutter/material.dart';

typedef onButtonClick = void Function(String);

class CalculatorButton extends StatelessWidget {
  final String title;
  final onButtonClick btnClick;
  final Color? color;

  CalculatorButton({required this.title, required this.btnClick, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 90,
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey.shade600,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () {
            btnClick(title);
          },
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
