part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState {}

class HomeInitial extends CurrencyState {}

class HomeGetAllCurrenciesInfoLoadingState extends CurrencyState {}
class HomeGetAllCurrenciesInfoSuccessState extends CurrencyState {}
class HomeGetAllCurrenciesInfoFailState extends CurrencyState {}

class HomeStartSelectCurrencyState extends CurrencyState {}

class HomeSelectCurrencySuccessState extends CurrencyState {}

class HomeGetLatestLoadingState extends CurrencyState {}
class HomeGetLatestSuccessState extends CurrencyState {}
class HomeGetLatestFailState extends CurrencyState {}

class HomeGetHistoricalLoadingState extends CurrencyState {}
class HomeGetHistoricalSuccessState extends CurrencyState {}
class HomeGetHistoricalFailState extends CurrencyState {}