import 'package:flutter/material.dart';
import 'package:my_stocks/common/ViewModelState.dart';
import 'package:my_stocks/features/stockForm/StockFormViewModel.dart';

import 'StockFormModel.dart';

class StockFormView extends StatefulWidget {
  
  StockFormView({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
 _StockFormView createState() => _StockFormView();
}

class _StockFormView extends State<StockFormView> {
  StockFormViewModel viewModel;
  ViewModelState state = ViewModelState.initial;

  final tickerController = TextEditingController();
  final companyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  _StockFormView() {
    viewModel = StockFormViewModel(model: StocFormkModelImpl());
    viewModel.didUpdateState = didUpdateState;
  }

  didUpdateState(ViewModelState state) {
    this.state = state;

    setState(() {});
  }

  @override
  void dispose() {

    tickerController.dispose();
    companyController.dispose();
    super.dispose();
  }

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
                if (_formKey.currentState.validate()) {

                  viewModel.add(
                    ticker: tickerController.text, 
                    company: companyController.text);

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
          child: buildContent(),
        )),
    );
  }

  Widget buildContent() {

    switch (state) {
      case ViewModelState.error: 
        return Text("Não foi possível enviar o formulário!");
        break;
      case ViewModelState.processing:
        return CircularProgressIndicator();
        break;
      case ViewModelState.loaded:
        Navigator.of(context).pop();
        return _form();
        break;
      default: 
        return _form();
    }
  }

  // Custom methods

  Widget _form() {

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
           _textField("Ticker", null, tickerController),
           _textField("Company", null, companyController),
        ]
     )
    );
  }

  Widget _textField(String placeholder, String textValidation, TextEditingController controller) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child:  TextFormField(
        controller: controller,
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