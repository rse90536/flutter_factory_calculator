import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator.dart';
import 'package:flutter_calculator/ui/widget/calculator_row.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String initNum = "0";

  String calcNum = '';
  String operationSymbol = '';
  double result;
  bool shouldCalculate = false;

  @override
  void initState() {
    super.initState();
  }

  void _calculate() {
    var calc;
    switch (operationSymbol) {
      case '+':
        calc = Calculator("+", result, calcNum);
        result = calc.startCalculate();
        break;
      case '-':
        calc = Calculator("-", result, calcNum);
        result = calc.startCalculate();

        break;
      case '*':
        calc = Calculator("*", result, calcNum);
        result = calc.startCalculate();

        break;
      case '/':
        calc = Calculator("/", result, calcNum);
        result = calc.startCalculate();

        break;
      default:
        break;
    }
    if (result.isNaN) result = 0;
    calcNum = result.toString();
    initNum = calcNum;
  }

  void pressButton(String buttonText) {
    setState(() {
      switch (buttonText) {
        case '+':
        case '-':
        case '*':
        case '/':
          if (shouldCalculate) {
            _calculate();
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = buttonText;

          break;
        case '=':
          _calculate();
          operationSymbol = '';
          shouldCalculate = false;
          break;
        case 'CE':
          calcNum = '';
          initNum = '0';
          operationSymbol = '';
          result = 0;
          shouldCalculate = false;
          break;
        default:
          calcNum += buttonText;
          initNum = calcNum;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '計算機 Demo',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          initNum,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  CalRow('+', '-', '*', '/', this),
                  CalRow('7', '8', '9', '0', this),
                  CalRow('4', '5', '6', 'CE', this),
                  CalRow('1', '2', '3', '=', this),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
