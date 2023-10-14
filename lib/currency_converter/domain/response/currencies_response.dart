


class CurrencyResponse {
  int?id;
  String? symbol;
  String? name;
  String? symbolNative;
  num? decimalDigits;
  num? rounding;
  String? code;
  String? namePlural;

  CurrencyResponse({this.id,
    required this.symbol,
    required this.name,
    required this.symbolNative,
    required this.decimalDigits,
    required this.rounding,
    required this.code,
    required this.namePlural,
  });

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    print('the json We got it is ${json}');
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    symbolNative = json['symbol_native'];
    decimalDigits = json['decimal_digits'];
    rounding = json['rounding'];
    code = json['code'];
    namePlural = json['name_plural'];
  }
}
