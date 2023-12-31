import 'package:currency_converter/currency_converter/data/data_sources/local/spflite_manager.dart';
import 'package:currency_converter/currency_converter/data/data_sources/remote/repositories/currencies_repo.dart';
import 'package:currency_converter/currency_converter/domain/request/currencies_request.dart';
import 'package:currency_converter/currency_converter/domain/request/historical_request.dart';
import 'package:currency_converter/currency_converter/domain/request/latest_exchange_rates_request.dart';
import 'package:currency_converter/currency_converter/domain/response/currencies_response.dart';
import 'package:currency_converter/currency_converter/shared/constant/app_urls.dart';
import 'package:currency_converter/currency_converter/shared/core/network/dio_helper.dart';
import 'package:currency_converter/currency_converter/shared/enums/currencies_enum.dart';

class CurrenciesRepoImplement extends CurrenciesRepository {
  final DioHelper _dio;
  final SqfLite _sqfLite;

  CurrenciesRepoImplement(this._dio, this._sqfLite);

  @override
  Future<List<CurrencyResponse>> getCurrencies(CurrenciesRequest currenciesRequest) async {
    List<Map<String, dynamic>> dataFromDatabase =
        await _sqfLite.readData('SELECT * FROM currency');
    List<CurrencyResponse> res = [];
    try {
      if (dataFromDatabase.isEmpty) {
        await _dio
            .getData(url: ApiUrls.getCurrencies(), query: currenciesRequest.toJson())
            .then((value) {
          for (int i = 0; i < value.data['data'].length; i++) {
            res.add(CurrencyResponse.fromJson(
                value.data['data'][Currencies.values[i].name]));
            _sqfLite.insertData(
                'INSERT INTO currency(name,name_plural,code,symbol_native,symbol,decimal_digits,rounding) VALUES("${res[i].name}","${res[i].namePlural}","${res[i].code}","${res[i].symbolNative}","${res[i].symbol}",${res[i].decimalDigits},${res[i].rounding})');
          }
        });
      } else {
        for (var element in dataFromDatabase) {
          res.add(CurrencyResponse.fromJson(element));
        }
      }
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<num> getCurrenciesConverterValue(
      LatestExchangeRateRequest latestExchangeRateRequest) async {
    double res = 0;
    try {
      await _dio
          .getData(url: ApiUrls.getLatest(), query: latestExchangeRateRequest.toJson())
          .then((value) {
        res = value.data['data'][latestExchangeRateRequest.currencies];
      });

      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<num> getHistoricalResponse(HistoricalRequest historicalRequest) async {
    num res = 0;
    try {
      await _dio
          .getData(url: ApiUrls.getHistorical(), query: historicalRequest.toJson())
          .then(
        (value) {
          res = value.data['data'][historicalRequest.date][historicalRequest.currencies];
        },
      );
      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}
