import 'dart:convert';

import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/services/BaseService.dart';

abstract class StockFormModel {
  add(Stock stock, Function completion) async {} 
}

class StocFormkModelImpl extends BaseService implements StockFormModel{

  @override
  add(Stock stock, Function completion) async {
      String endpoint = "/tabs/stocks";
      String body = jsonEncode(stock.toJson());
      print("Body: $body");
      post(body, super.fromUrl(endpoint)).then( (response) {

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