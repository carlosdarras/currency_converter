part of 'home_bloc.dart';

@immutable
abstract class CurrencyEvent {}

class GetAllCurrencies extends CurrencyEvent {}

class SelectCurrencyEvent extends CurrencyEvent {
  final CurrencySelect select;
  final CurrencyResponse currencyData;

  SelectCurrencyEvent(this.select, this.currencyData);
}

class GetLatestAndCovertBetweenTwoCurrencies extends CurrencyEvent {}

class GetHistoricalPriceForSevenDaysAgo extends CurrencyEvent {}
