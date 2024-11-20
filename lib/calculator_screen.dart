import 'package:flutter/material.dart';
import 'calculator_button.dart';
class CalculatorScreen extends StatefulWidget {
  static const String routeName = "Calculator";
  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}
class CalculatorScreenState extends State<CalculatorScreen>{
  String resultText="";
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
        backgroundColor: Colors.blue,
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
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,)),
                  Text(resultText,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          resultText='';
                          savedNumber='';
                          savedOperator='';
                        });
                      }, child: Text("ClR")),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(title: "7",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"8",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"9",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"X",btnClick:onOperatorClicked ,),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(title:"4",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"5",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"6",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"+",btnClick:onOperatorClicked ,),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(title:"1",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"2",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"3",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"-",btnClick:onOperatorClicked ,),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(title:"/",btnClick:onOperatorClicked ,),
                      CalculatorButton(title:"0",btnClick:onDigitClicked ,),
                      CalculatorButton(title:".",btnClick:onDigitClicked ,),
                      CalculatorButton(title:"=",btnClick:onEqualClicked ,),
                    ],
                  ),
                ],
              ),
            ),
          )
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
  String savedNumber='';
  String savedOperator='';
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

