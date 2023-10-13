import '../../shared/constant/app_value.dart';

class HistoricalRequest {
  String? apiKey, date, baseCurrency, currencies;

  HistoricalRequest({
    this.apiKey,
    this.baseCurrency,
    this.currencies,
    this.date,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['apikey'] = apiKey ?? AppValue.apiKey;
    data['date'] = date ?? DateTime.now().toString();
    data['base_currency'] = baseCurrency ?? "";
    data['currencies'] = currencies ?? "";

    return data;
  }
}
