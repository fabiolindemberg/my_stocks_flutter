import 'package:flutter/material.dart';

class StockDetailView extends StatefulWidget{
  final String title;
  StockDetailView({Key key, this.title}) : super(key: key);
 
  @override
  State<StatefulWidget> createState() => _StockDetailView();
}


class _StockDetailView extends State<StockDetailView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe"),
        leading: Padding(
          padding: EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back
            ),
          ),),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
              Icons.save
            ),  
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _showDialog(),
        )),
    );
  }

  // user defined function
  Widget _showDialog() {
    // flutter defined function
    return AlertDialog(
          title: new Text("Sorry!"),
          content: new Text("This content is not avilable!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
  }
}