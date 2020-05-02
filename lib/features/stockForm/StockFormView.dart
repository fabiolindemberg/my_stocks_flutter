import 'package:flutter/material.dart';

class StockFormView extends StatefulWidget {
  StockFormView({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
 _StockFormView createState() => _StockFormView();

}

class _StockFormView extends State<StockFormView> {
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }

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
          child: form(),
        )),
    );
  }

  Widget form() {

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
           _textField("Ticker", null),
           _textField("Company", null)
        ]
     )
    );
  }

Widget _textField(String placeholder, String textValidation) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child:  TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return textValidation != null ? textValidation : 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: placeholder
            ),
          ),
  );
}
}