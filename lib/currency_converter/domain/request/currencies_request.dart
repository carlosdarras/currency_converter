import 'package:currency_converter/currency_converter/shared/constant/app_value.dart';

class CurrenciesRequest{
  String? apiKey;
  String? currencies;

  CurrenciesRequest({this.apiKey, this.currencies});

  Map<String ,dynamic> toJson(){
    Map<String, dynamic> data = {};

    data['apikey'] = apiKey ?? AppValue.apiKey;
    data['currencies'] = currencies ?? "";

    return data;
  }

}