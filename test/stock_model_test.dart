import 'package:flutter_test/flutter_test.dart';
import 'package:my_stocks/common/entities/stock.dart';
import 'service/StockServiceMock.dart';

void main() {

  StockServiceMock service;

  setUpAll((){
    service = StockServiceMock();
  });

  tearDownAll((){
    service = null;
  });

  test("Test fetchStock with sucess", () async {
    var current;
    var currentError;

    await service.fetchStocks((List<Stock> stocks, error) {
      current = stocks.length;
      currentError = error;
    });

    expect(current, 1);
    expect(currentError, null);
  });
}