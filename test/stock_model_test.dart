import 'package:flutter_test/flutter_test.dart';
import 'package:my_stocks/common/entities/stock.dart';
import 'service/StockFormModelMock.dart';
import 'service/StockServiceMock.dart';

void main() {

  StockServiceMock service;

  setUpAll((){
    service = StockServiceMock();
  });

  tearDownAll((){
    service = null;
  });

  test("Test fetchStock service with sucess", () async {
    var current;
    var currentError;

    await service.fetchStocks((List<Stock> stocks, error) {
      current = stocks.length;
      currentError = error;
    });

    expect(current, 1);
    expect(currentError, null);
  });

   test("Test add stocks with sucess", () async {

    var model = StockFormModelMock();
    List<Stock> expected;
    var stock = Stock();
    stock.code = "PETR4";
    stock.company = "Petrobras";

    await model.add(stock, (stocks, error){
      expected = stocks;
    });

    expect(expected.length, 1);
    expect(expected.first.code, "PETR4");
  });
}