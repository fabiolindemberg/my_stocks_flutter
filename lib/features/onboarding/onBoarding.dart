import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_stocks/features/stockList/StockView.dart';

import 'onBoardingItem.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      key: Key("onboarding"),
      children: <Widget>[
      this.pageItem(OnBoardingItem("images/itau.jpeg", "Itau", "Follow the count of large companies", null)),
      this.pageItem(OnBoardingItem("images/petrobras.jpeg", "Petrobras", "With investment indication", null)),
      this.pageItem(OnBoardingItem("images/cielo.jpeg", "Cielo", "Information is money!", Button("Get Started Now!!", () {
        Navigator.of(context).push(MaterialPageRoute(builder: (contex) => StockView(title: "Ativos",)));
      }))),

    ],);
  }

  Stack pageItem(OnBoardingItem item) {
    return Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(item.image)
            )
          ),
        ),
        Container(color: Color(0x000000).withOpacity(0.6),),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(item.primaryText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
                  ),
                Text(item.secondaryText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                  ),
                ),
                item.button == null ? Container() : button(item.button),
              ],
            ),
          ),
        )
    ],
  );
  }

  Container button(Button button) {
    return Container(
                child: RaisedButton(
                  onPressed: button.onClick,
                  child: Text(button.label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14),),
                ),
              );
  }
}
