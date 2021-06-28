import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Calculator(),
    );
  }
}

//-**********--*-*main program end here-*-*-*-*-*-*-*-*-*-*-*-*-*

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
//******************-declaration of variables

  String equation = "0";
  String result = "0";
  String expression = '';
  double equationonSize = 38;
  double resultfontSize = 48;

// buttonPressed function

  buttonPressed(buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equationonSize = 38;
        resultfontSize = 48;
        equation = "0";
        result = "0";
      } else if (buttonText == '⌫') {
        equationonSize = 48;
        resultfontSize = 38;
        equation = equation.substring(0, equation.length - 1);

        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == '=') {
        equationonSize = 38;
        resultfontSize = 48;
        expression = equation;
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else
          equation = equation + buttonText;
      }
    });
  }

// *********************-buildButton Widget

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: TextButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
          )),
      color: buttonColor,
      padding: EdgeInsets.all(16),
    );
  }

  @override
  Widget build(BuildContext context) {
// **************-*-*-*-*stateless class*-*--*-*-*-*

    return Scaffold(
        appBar: AppBar(
          title: Text("Simple Calculator"),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: equationonSize),
              ),
            ), // Center Right,

            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: resultfontSize),
              ),
            ), //Center Right

            Expanded(child: Divider()),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("⌫", 1, Colors.redAccent),
                        buildButton("÷", 1, Colors.redAccent),
                      ] //1st table row children,
                          ), //1st row

                      TableRow(children: [
                        buildButton("9", 1, Colors.redAccent),
                        buildButton("8", 1, Colors.redAccent),
                        buildButton("7", 1, Colors.redAccent),
                      ] //2nd table row children,
                          ), //2nd row

                      TableRow(children: [
                        buildButton("4", 1, Colors.redAccent),
                        buildButton("5", 1, Colors.redAccent),
                        buildButton("6", 1, Colors.redAccent),
                      ] //3rd table row children,
                          ), //3rd row

                      TableRow(children: [
                        buildButton("3", 1, Colors.redAccent),
                        buildButton("2", 1, Colors.redAccent),
                        buildButton("1", 1, Colors.redAccent),
                      ] //4th table row children,
                          ), //4th row

                      TableRow(children: [
                        buildButton(".", 1, Colors.redAccent),
                        buildButton("0", 1, Colors.redAccent),
                        buildButton("00", 1, Colors.redAccent),
                      ] //5th table row children,
                          ), //5th row
                    ], //Main Table of 0.75 children,
                  ), //Main Table Of 0.75,
                ), // 0.75

                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            buildButton("*", 1, Colors.redAccent),
                          ], //childere table row
                        ), //1st Table Row 0.25

                        TableRow(
                          children: [
                            buildButton("-", 1, Colors.redAccent),
                          ], //childere table row
                        ), // 2nd Table Row 0.25

                        TableRow(
                          children: [
                            buildButton("+", 1, Colors.redAccent),
                          ], //childere table row
                        ), // 3rd Table Row 0.25

                        TableRow(
                          children: [
                            buildButton("=", 2, Colors.redAccent),
                          ], //childere table row
                        ), // 4th Table Row 0.25
                      ], //children of 0.25
                    ) // Table of 0.25 ,
                    ) // Container of 0.25
              ], //divider insider chilldern
            ), //divider insider Row
          ],
        ) // body column,

        );
  }
}
