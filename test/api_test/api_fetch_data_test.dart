import 'package:currency_converter/currency_converter/domain/request/currencies_request.dart';
import 'package:currency_converter/currency_converter/domain/request/historical_request.dart';
import 'package:currency_converter/currency_converter/domain/request/latest_exchange_rates_request.dart';
import 'package:currency_converter/currency_converter/shared/constant/app_urls.dart';
import 'package:currency_converter/currency_converter/shared/constant/app_value.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dio = Dio();

  void configureDio() {
    dio.options.baseUrl = AppValue.baseUrl;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
  }

  setUp(() {
    configureDio();
  });
  group("Correct Fetch Of Api", () {
    test("getCurrencies", () async {
      var res = await dio.get(ApiUrls.getCurrencies(),
          queryParameters: CurrenciesRequest(apiKey: AppValue.apiKey).toJson());
      expect(res.statusCode, equals(200));
    });

    test("getHistorical", () async {
      var res = await dio.get(ApiUrls.getHistorical(),
          queryParameters: HistoricalRequest(
                  apiKey: AppValue.apiKey,
                  currencies: "EUR",
                  baseCurrency: "USD",
                  date: "2023-10-10")
              .toJson());
      expect(res.statusCode, equals(200));
    });

    test("getLatest", () async {
      var res = await dio.get(ApiUrls.getLatest(),
          queryParameters: LatestExchangeRateRequest(
            apiKey: AppValue.apiKey,
            currencies: "EUR",
            baseCurrency: "USD",
          ).toJson());
      expect(res.statusCode, equals(200));
    });
  });

  group("All Currencies Data", () {
    test("getCurrencies", () async {
      var res = await dio.get(ApiUrls.getCurrencies(),
          queryParameters: CurrenciesRequest(apiKey: AppValue.apiKey).toJson());
      expect(
        res.data['data']['EUR'],
        equals(
          {
            "symbol": "€",
            "name": "Euro",
            "symbol_native": "€",
            "decimal_digits": 2,
            "rounding": 0,
            "code": "EUR",
            "name_plural": "Euros"
          },
        ),
      );
    });
  });
}
