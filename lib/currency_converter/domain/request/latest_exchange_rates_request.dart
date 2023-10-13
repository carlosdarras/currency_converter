import 'package:currency_converter/currency_converter/shared/constant/app_value.dart';

class LatestExchangeRateRequest {
  String? apiKey, baseCurrency, currencies;

  LatestExchangeRateRequest({
    this.apiKey,
    this.baseCurrency,
    this.currencies,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['apikey'] = apiKey ?? AppValue.apiKey;
    data['base_currency'] = baseCurrency ?? "";
    data['currencies'] = currencies ?? "";

    return data;
  }
}
