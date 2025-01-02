import 'package:flutter/material.dart';
import 'calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const CalculatorScreen({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = "";
  String savedNumber = '';
  String savedOperator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
          child: Text(
            'Calculator',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          // Toggle button to switch between light and dark themes
          IconButton(
            icon: Icon(
              widget.themeNotifier.value == ThemeMode.dark
                  ? Icons.wb_sunny
                  : Icons.nightlight_round,
              color: Colors.white,
            ),
            onPressed: () {
              // Toggle between light and dark theme
              widget.themeNotifier.value = widget.themeNotifier.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    savedNumber,
                    style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Want to remove the last character
                        resultText = resultText.substring(0, resultText.length - 1);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,

                    ),
                    child: Icon(Icons.backspace_outlined, size: 40, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CalculatorButton(title: "AC", btnClick: onACClicked, color: Colors.grey.shade900),
                      CalculatorButton(title: "7", btnClick: onDigitClicked),
                      CalculatorButton(title: "4", btnClick: onDigitClicked),
                      CalculatorButton(title: "1", btnClick: onDigitClicked),
                      CalculatorButton(title: "/", btnClick: onOperatorClicked, color: Colors.grey.shade900),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Spacer(flex: 1,),
                      CalculatorButton(title: "8", btnClick: onDigitClicked),
                      CalculatorButton(title: "5", btnClick: onDigitClicked),
                      CalculatorButton(title: "2", btnClick: onDigitClicked),
                      CalculatorButton(title: "0", btnClick: onDigitClicked),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Spacer(flex: 1,),

                      CalculatorButton(title: "9", btnClick: onDigitClicked),
                      CalculatorButton(title: "6", btnClick: onDigitClicked),
                      CalculatorButton(title: "3", btnClick: onDigitClicked),
                      CalculatorButton(title: ".", btnClick: onOperatorClicked),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CalculatorButton(title: "X", btnClick: onOperatorClicked, color: Colors.grey.shade900),
                    CalculatorButton(title: "+", btnClick: onOperatorClicked, color: Colors.grey.shade900),
                    CalculatorButton(title: "-", btnClick: onOperatorClicked, color: Colors.grey.shade900),
                    CalculatorButton(title: "=", btnClick: onEqualClicked, color: Theme.of(context).primaryColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onDigitClicked(String btnText){
    if(btnText=="."){
      if(resultText.contains(".")){
        return;
      }
    }
    setState(() {
      resultText+=btnText;

    });
  }
  onOperatorClicked(String btnText){
    if(savedNumber.isEmpty){
      savedNumber=resultText;
      savedOperator=btnText;
    }else{
      String newNumber=resultText;
      String calculation=Calculate(double.parse(savedNumber),savedOperator,
          double.parse(newNumber));
      savedNumber=calculation;
      savedOperator=btnText;
      setState(() {
        resultText='';

      });
    }
    setState(() {
      resultText='';

    });

  }
  onACClicked(String btnText){
    setState(() {
      resultText='';
      savedNumber='';
      savedOperator='';
    }

    );}
  Calculate(double lhs,String operator ,double rhs){
    late double result;
    if(operator=="+"){
      result=lhs+rhs;
    }
    else if(operator=="X"){
      result=lhs*rhs;
    }else if(operator=="/"){
      result=lhs/rhs;
    }else if(operator=="-"){
      result=lhs-rhs;
    }
    return result.toString();
  }
  onEqualClicked(String _){

    String newNumber=resultText;
    String calculation=Calculate(double.parse(savedNumber),savedOperator,
        double.parse(newNumber));
    setState(() {
      resultText=calculation;
      savedNumber='';
      savedOperator='';
    });


  }
}
