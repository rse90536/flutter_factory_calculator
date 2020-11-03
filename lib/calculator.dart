abstract class Calculator {
  double startCalculate();

  factory Calculator(String operationSymbol, double result, String calcNum) {
    switch (operationSymbol) {
      case '+':
        return Addition(result, calcNum);
        break;
      case '-':
        return Subtraction(result, calcNum);

        break;
      case '*':
        return Multiplication(result, calcNum);

        break;
      case '/':
        return Division(result, calcNum);
        break;
      default:
        throw "error operationSymbol";
        break;
    }
  }



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
