

import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/services/StockService.dart';

import 'StockModel.dart';

class StockViewModel {

  Function didUpdateState;
  List<Stock> stocks;

  StockViewModel({this.didUpdateState}) {
    fetchStocks();
  }

  void fetchStocks() {
    StockModel(StockServiceImpl()).fetchStocks(_oncComplete);
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

enum ViewModelState {
  initial, loaded, processing, error
}