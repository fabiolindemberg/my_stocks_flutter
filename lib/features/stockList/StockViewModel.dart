

import 'package:my_stocks/common/ViewModelState.dart';
import 'package:my_stocks/common/entities/stock.dart';

import 'StockModel.dart';

class StockViewModel {

  Function didUpdateState;
  List<Stock> stocks;
  StockModel model;

  StockViewModel({this.model}) {
    fetchStocks();
  }

  void fetchStocks() {
    model.fetchStocks(_oncComplete);
  }

  void _oncComplete(List<Stock> stocks, error) {

    if (error == null) {
      this.stocks = stocks;
      didUpdateState(ViewModelState.loaded);
    } else {
      didUpdateState(ViewModelState.error);
    }
  }
}