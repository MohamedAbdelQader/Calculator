import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef onButtonClick= void Function(String);
class CalculatorButton extends StatelessWidget {
  String title;
  onButtonClick btnClick;
  CalculatorButton({required this.title,required this.btnClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              padding: EdgeInsets.all(25),
              backgroundColor: Colors.blue,
              shape: CircleBorder(),

            ),
              onPressed: (){
                    btnClick(title);
              },
              child: Text(title,style:TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)),
        ),

    );
  }
}


