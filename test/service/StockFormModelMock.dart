import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/features/stockForm/StockFormModel.dart';

class StockFormModelMock implements StockFormModel {
  @override
  add(Stock stock, Function completion) {
    completion([stock], null);
  }
  
}