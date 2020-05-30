import 'dart:convert';
import 'package:my_stocks/common/entities/stock.dart';
import 'package:my_stocks/features/stockList/StockModel.dart';

class StockServiceMock implements StockModel {
  @override
  Future fetchStocks(Function complition) async {
    
    var jsonMap = jsonDecode("[{\"code\":\"ABEV3\",\"company\":\"AMBEV S/A\",\"type\":\"ON\",\"count\":\"4.348.260.598\",\"participation\":\"3,588\",\"dividend\":\"TRUE\",\"evaluation\":\"FALSE\",\"price\":\"11,34\",\"reference\":\"9,2\"}]");
    List<Stock> stocks = List<Stock>();
    jsonMap.forEach( (mapStock) {
        stocks.add(Stock.fromJson(mapStock));
    });
    await Future.delayed(const Duration(seconds : 1), (){
      complition(stocks, null);
    }) ;

    return null;
  }
}
