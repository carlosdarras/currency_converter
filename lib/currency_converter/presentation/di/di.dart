import 'package:currency_converter/currency_converter/data/data_sources/local/spflite_manager.dart';
import 'package:currency_converter/currency_converter/data/data_sources/remote/repositories/currencies_repo.dart';
import 'package:currency_converter/currency_converter/domain/repositories/currencies_repo_implement.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/core/network/dio_helper.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => SqfLite());
  getIt.registerLazySingleton(() => DioHelper());
  _setupRepositories();
  setupBlocs();
}

void setupBlocs() {
  getIt.registerFactory<CurrencyBloc>(
      () => CurrencyBloc(getIt.get<CurrenciesRepository>())
        ..add(GetAllCurrencies())
        ..add(GetHistoricalPriceForSevenDaysAgo()));
}

void _setupRepositories() {
  getIt.registerSingleton<CurrenciesRepository>(
      CurrenciesRepoImplement(getIt.get<DioHelper>(), getIt.get<SqfLite>()));
}
