import 'dart:convert';

import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/services/BaseService.dart';

abstract class StockModel {
  fetchStocks(Function completion) async {} 
}

class StockModelImpl extends BaseService implements StockModel{

  @override
  fetchStocks(Function completion) async {
      request(super.baseUrl).then( (response) {

      print("Response body: ${response.body.toString()}");
      
      var jsonMap = jsonDecode(response.body.toString());
      
      List<Stock> stocks = List<Stock>();

      jsonMap.forEach( (mapStock) {
        stocks.add(Stock.fromJson(mapStock));
      });

      completion(stocks, null);
    }).catchError( (error) {
      
      print("Error: $error");
      completion(null, error);
    });
  }
}