
class Stock {
  String code;
  String company;
  bool dividend;
  bool evaluation;
  double price;
  double reference;

  static Stock fromJson(Map<String, dynamic> json) {
    Stock stock = Stock();
    stock.code = json['code'];
    stock.company = json['company'];
    stock.dividend = json['dividend'] == "TRUE";
    stock.evaluation = json['evaluation'] == "TRUE";
    stock.price = double.parse(json['price'].replaceAll(",", ".")); 
    stock.reference = json['reference'] != null ? double.parse(json['reference'].replaceAll(",", ".")) : 0.0; 
    return stock;
  }

  Map toJson() => {
    'code': code,
    'company': company,
    'dividend': "FALSE",
    'evaluation': "FALSE",
    'price': '0,0',
    'reference': '0,0',
    'count': 100
  };
}