abstract class Calculator {
  double startCalculate();

  factory Calculator(String operationSymbol, double result, String calcNum) {
    switch (operationSymbol) {
      case '+':
        return Addition(result, calcNum);
        // result += double.tryParse(calcNum) ?? 0;
        break;
      case '-':
        return Subtraction(result, calcNum);

        // result -= double.tryParse(calcNum) ?? 0;
        break;
      case '*':
        return Multiplication(result, calcNum);

        // result *= double.tryParse(calcNum) ?? 0;
        break;
      case '/':
        return Division(result, calcNum);
        // result /= double.tryParse(calcNum) ?? 0;
        break;
      default:
        throw "error operationSymbol";
        break;
    }
  }

//  String initNum;
// String calcNum = '';
// String operationSymbol = '';
// double result;
// bool shouldCalculate = false;

// factory Calculator(String buttonText){
//   switch(buttonText){
//
//   }
// }

}

class Addition implements Calculator {
  double result;
  String calcNum;

  Addition(this.result, this.calcNum);

  @override
  double startCalculate() {
    result += double.tryParse(calcNum) ?? 0;
    return result;
  }
}

class Subtraction implements Calculator {
  double result;
  String calcNum;

  Subtraction(this.result, this.calcNum);

  @override
  double startCalculate() {
    result -= double.tryParse(calcNum) ?? 0;
    return result;
  }
}

class Multiplication implements Calculator {
  double result;
  String calcNum;

  Multiplication(this.result, this.calcNum);

  @override
  double startCalculate() {
    result *= double.tryParse(calcNum) ?? 0;
    return result;
  }
}

class Division implements Calculator {
  double result;
  String calcNum;

  Division(this.result, this.calcNum);

  @override
  double startCalculate() {
    result /= double.tryParse(calcNum) ?? 0;
    return result;
  }
}
