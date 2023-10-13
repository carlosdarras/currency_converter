import 'package:currency_converter/currency_converter/domain/request/currencies_request.dart';
import 'package:currency_converter/currency_converter/domain/request/historical_request.dart';
import 'package:currency_converter/currency_converter/domain/respons/currencies_respons.dart';

import '../../../../domain/request/latest_exchange_rates_request.dart';

abstract class CurrenciesRepository {
  Future<List<CurrencyResponse>> getCurrencies(final CurrenciesRequest param);

  Future<double> getCurrenciesConverterValue(
      final LatestExchangeRateRequest param);

  Future<double> getHistoricalResponse(final HistoricalRequest param);
}
