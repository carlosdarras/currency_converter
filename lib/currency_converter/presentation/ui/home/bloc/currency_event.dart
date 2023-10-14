part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllCurrencies extends CurrencyEvent {}

class SelectCurrencyEvent extends CurrencyEvent {
  final CurrencySelect select;
  final CurrencyResponse currencyData;

  SelectCurrencyEvent(this.select, this.currencyData);

  @override
  List<Object?> get props => [select, currencyData];
}

class GetLatestAndCovertBetweenTwoCurrencies extends CurrencyEvent {}

class GetHistoricalPriceForSevenDaysAgo extends CurrencyEvent {}
