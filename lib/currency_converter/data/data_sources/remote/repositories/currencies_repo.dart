import 'package:currency_converter/currency_converter/domain/request/currencies_request.dart';
import 'package:currency_converter/currency_converter/domain/request/historical_request.dart';
import 'package:currency_converter/currency_converter/domain/response/currencies_response.dart';

import '../../../../domain/request/latest_exchange_rates_request.dart';

abstract class CurrenciesRepository {
  Future<List<CurrencyResponse>> getCurrencies(final CurrenciesRequest currenciesRequest);

  Future<num> getCurrenciesConverterValue(
      final LatestExchangeRateRequest latestExchangeRateRequest);

  Future<num> getHistoricalResponse(final HistoricalRequest historicalRequest);
}
