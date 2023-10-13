import 'package:bloc/bloc.dart';
import 'package:currency_converter/currency_converter/data/data_sources/remote/repositories/currencies_repo.dart';
import 'package:currency_converter/currency_converter/domain/request/currencies_request.dart';
import 'package:currency_converter/currency_converter/domain/request/historical_request.dart';
import 'package:currency_converter/currency_converter/domain/request/latest_exchange_rates_request.dart';
import 'package:currency_converter/currency_converter/domain/respons/currencies_respons.dart';
import 'package:currency_converter/currency_converter/domain/respons/historical_response.dart';
import 'package:currency_converter/currency_converter/shared/constant/app_value.dart';
import 'package:currency_converter/currency_converter/shared/enums/currency_selecter_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../shared/enums/currencies_enum.dart';

part 'home_event.dart';

part 'home_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc(
    this.currenciesRepository,
  ) : super(HomeInitial()) {
    on<GetAllCurrencies>(_onGetAllCurrencies);
    on<SelectCurrencyEvent>(_onSelectCurrencyEvent);
    on<GetHistoricalPriceForSevenDaysAgo>(_onGetHistoricalPriceForSevenDaysAgo);
    on<GetLatestAndCovertBetweenTwoCurrencies>(
        _onGetLatestAndCovertBetweenTwoCurrencies);
  }

  CurrenciesRepository currenciesRepository;

  List<CurrencyResponse>? currenciesResponse = [];
  List<HistoricalResponse>? historicalResponse = [];

  late CurrencyResponse fromCurrency;
  late CurrencyResponse toCurrency;

  double covertValue = 0;
  TextEditingController amountController = TextEditingController();

  void _onGetAllCurrencies(GetAllCurrencies event, Emitter emit) async {
    try {
      emit(HomeGetAllCurrenciesInfoLoadingState());
      await currenciesRepository
          .getCurrencies(
              CurrenciesRequest(apiKey: AppValue.apiKey, currencies: ''))
          .then((value) {
        currenciesResponse = value;
        setFromAndToCurrencies();
      });
      emit(HomeGetAllCurrenciesInfoSuccessState());
    } catch (e) {
      emit(HomeGetAllCurrenciesInfoFailState());
    }
  }

  void _onSelectCurrencyEvent(
    SelectCurrencyEvent event,
    Emitter emit,
  ) async {
    if (event.select == CurrencySelect.from) {
      fromCurrency = event.currencyData;
    } else {
      toCurrency = event.currencyData;
    }
    emit(HomeSelectCurrencySuccessState());
  }

  void _onGetLatestAndCovertBetweenTwoCurrencies(
    GetLatestAndCovertBetweenTwoCurrencies event,
    Emitter emit,
  ) async {
    try {
      emit(HomeGetLatestLoadingState());
      await currenciesRepository
          .getCurrenciesConverterValue(
        LatestExchangeRateRequest(
          apiKey: AppValue.apiKey,
          baseCurrency: fromCurrency.code,
          currencies: toCurrency.code,
        ),
      )
          .then((value) {
        covertValue = double.parse(amountController.text) * value;
      });
      emit(HomeGetLatestSuccessState());
    } catch (e) {
      emit(HomeGetLatestFailState());
    }
  }

  void _onGetHistoricalPriceForSevenDaysAgo(
    GetHistoricalPriceForSevenDaysAgo event,
    Emitter emit,
  ) async {
    try {
      emit(HomeGetHistoricalLoadingState());
      DateTime currentDate = DateTime.now();
      for (int i = 7; i > 0; i--) {
        DateTime sevenDaysAgo = currentDate.subtract(Duration(days: i));
        String date = DateFormat('yyyy-MM-dd').format(
            DateTime(sevenDaysAgo.year, sevenDaysAgo.month, sevenDaysAgo.day));
        await currenciesRepository
            .getHistoricalResponse(
          HistoricalRequest(
            apiKey: AppValue.apiKey,
            baseCurrency: Currencies.EUR.name,
            currencies: Currencies.USD.name,
            date: date,
          ),
        )
            .then((value) {
          historicalResponse!.add(
            HistoricalResponse(
                date: DateTime(
                    sevenDaysAgo.year, sevenDaysAgo.month, sevenDaysAgo.day),
                price: value),
          );
        });
      }
      print('the hisotrical is ${historicalResponse}');
      historicalResponse = historicalResponse!.reversed.toList();
      emit(HomeGetHistoricalSuccessState());
    } catch (e) {
      emit(HomeGetHistoricalFailState());
    }
  }

  void setFromAndToCurrencies() {
    fromCurrency = currenciesResponse![0];
    toCurrency = currenciesResponse![1];
  }
}
