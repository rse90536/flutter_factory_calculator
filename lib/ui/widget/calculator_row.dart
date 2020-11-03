import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/ui/screen/home_view.dart';

class CalRow extends StatelessWidget {
  final String firstButton;
  final String secondButton;
  final String thirdButton;
  final String fourthButton;
  final HomeScreenState mHomeScreenState;

  const CalRow(
    this.firstButton,
    this.secondButton,
    this.thirdButton,
    this.fourthButton,
      this.mHomeScreenState,{
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _calButton(firstButton),
          _calButton(secondButton),
          _calButton(thirdButton),
          _calButton(fourthButton),
        ],
      ),
    );
  }

  Widget _calButton(String buttonText) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => {
            mHomeScreenState.pressButton(buttonText)
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          splashColor: Colors.grey,
          borderSide: BorderSide(
            color: Colors.black,
          ),
          highlightedBorderColor: Colors.black,
        ),
      ),
    );
  }


}
