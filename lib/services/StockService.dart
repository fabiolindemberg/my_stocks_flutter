import 'dart:convert';
import 'package:my_stocks/common/entities/stock.dart';
import 'BaseService.dart';


abstract class StockService {
  void fetchStocks(Function complition);
}

class StockServiceImpl extends BaseService implements StockService {
  @override
  void fetchStocks(Function complition) {
        request(super.baseUrl).then( (response) {
      var jsonMap = jsonDecode(response.body.toString());
      List<Stock> stocks = List<Stock>();

      jsonMap.forEach( (mapStock) {
        stocks.add(Stock.fromJson(mapStock));
      });

      complition(stocks, null);
    }).catchError( (error) {
      complition(null, error);
    });
  }
  
}