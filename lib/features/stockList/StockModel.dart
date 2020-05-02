import 'package:my_stocks/services/StockService.dart';

class StockModel {

  StockService service;

  StockModel(this.service);

  Future fetchStocks(Function complition) async {
    service.fetchStocks(complition);
  }
}