import 'package:my_stocks/common/ViewModelState.dart';
import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/features/stockForm/StockFormModel.dart';

class StockFormViewModel {

  Function didUpdateState;
  // StockFormModel model;
  StockFormModel model;

  StockFormViewModel({this.model});

  void add({String ticker, String company}) {

    didUpdateState(ViewModelState.processing);

    var stock = Stock();
    stock.code = ticker;
    stock.company = company;

    model.add(stock, _oncComplete);
  }

  void _oncComplete(List<Stock> stocks, error) {

    if (error == null) {
      didUpdateState(ViewModelState.loaded);
    } else {
      didUpdateState(ViewModelState.error);
    }
  }
}