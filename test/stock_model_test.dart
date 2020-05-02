import 'package:flutter_test/flutter_test.dart';
import 'package:my_stocks/common/entities/stock.dart'; 
import 'service/StockServiceMock.dart';

void main() {
  test("Test fetchStock with sucess", () async {
    var service = StockServiceMock();
    var current;
    var currentError;

    await service.fetchStocks((List<Stock> stocks, error) {
      current = stocks.length;
      currentError = error;
    });

    expect(current, 1);
    expect(currentError, null);
  });

   test("Test fetchStock with error", () async {
    var service = StockServiceMockError();
    var current;
    var currentError;

    await service.fetchStocks((List<Stock> stocks, error) {
      current = stocks;
      currentError = error;
    });

    expect(current, null);
    expect(currentError != null, true);
  });
}