import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/features/stockDetail/StockDetailView.dart';
import 'package:my_stocks/features/stockForm/StockFormView.dart';
import 'package:my_stocks/features/stockList/StockModel.dart';
import 'StockViewModel.dart';

class StockView extends StatefulWidget {
  StockView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StockViewState createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  StockViewModel viewModel;
  ViewModelState state = ViewModelState.initial;

  _StockViewState() {
    viewModel = StockViewModel(model: StockModelImpl());
    viewModel.didUpdateState = didUpdateState;
  }

  didUpdateState(ViewModelState state) {
    this.state = state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      key: Key("stock_list"),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
      padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (context) => StockFormView(title: 'Ativo')));
          },
          child: Icon(
              Icons.plus_one
          ),
          )
          )
        ],
      ),
      body: Center(
        child: buidContent(),
      ),
    );
  }

  Widget buidContent() {
    switch (state) {
      case ViewModelState.error: 
        return Text("Não foi possível fazer a consulta!");
        break;
      case ViewModelState.initial:
        return CircularProgressIndicator();
        break;
      default: 
        return buildListView();
    }
  }

  Widget buildListView() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: viewModel.stocks == null ? 0 : viewModel.stocks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(viewModel.stocks[index]).build(context);
          },),
      );
  }
}

class ListItem extends StatelessWidget {

  final Stock stock;
  final MoneyMaskedTextController controller = new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  ListItem(this.stock) {
    controller.updateValue(stock.price);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
        contentPadding:EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Text(
            stock.code,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ),
        ),
        title: Text(
          stock.company,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white))
        subtitle: Text(
          stock.price.toString(), 
          style: TextStyle(color: Colors.white)
        ),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (context) => StockDetailView(title: 'Ativo')));
          },
          child: Icon(
              Icons.keyboard_arrow_right
          ),
         // )Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
      ),
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