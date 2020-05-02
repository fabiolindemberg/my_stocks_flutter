import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:my_stocks/common/entities/stock.dart';
import 'StockViewModel.dart';

class StockView extends StatefulWidget {
  StockView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StockViewState createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  StockViewModel viewModel;

  _StockViewState() {
    viewModel = StockViewModel(didUpdateState: didUpdateState);
  }

  didUpdateState(ViewModelState state) {
    switch(state) {
      case ViewModelState.loaded: 
        setState(() {
          
        });
        break;
      default: break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemCount: viewModel.stocks == null ? 0 : viewModel.stocks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(viewModel.stocks[index]).build(context);
            },),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {

  Stock stock;
  var controller = new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  ListItem(this.stock) {
    controller.updateValue(stock.price);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      stock.code,
                      style: TextStyle(
                        fontSize: 22,   
                      ),
                    ),
                    Text(controller.text),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(stock.company),
                  ],
                ),
              ],
            ),
            buildImages(),              
                        
          ],
        ),
      ),
    );
  }

  Row buildImages() {
    return Row(
            children: <Widget>[
              stock.dividend ? Image(image: AssetImage("images/dividend.png")) : Image(image: AssetImage("")),
              stock.evaluation ? Image(image: AssetImage("images/market.png")) : Image(image: AssetImage("")),  
            ],
          );
  }

}
