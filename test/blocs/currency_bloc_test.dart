import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter/currency_converter/data/data_sources/remote/repositories/currencies_repo.dart';
import 'package:currency_converter/currency_converter/domain/domain_barrel.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/core/network/dio_helper.dart';
import 'package:currency_converter/currency_converter/shared/enums/currency_select_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class MockCurrenciesRepository extends MockBloc<CurrencyBloc, CurrencyState>
    implements CurrenciesRepository {}

final GetIt getIt = GetIt.instance;

void main() {
  late CurrencyBloc currencyBloc;

  setUp(() async {
    print('is in set up ?? ');
    if (!getIt.isRegistered<DioHelper>()) {
      getIt.registerLazySingleton(() => DioHelper());
    }
    if (!getIt.isRegistered<CurrencyBloc>()) {
      getIt.registerLazySingleton(
          () => CurrencyBloc(MockCurrenciesRepository()));
    }
    if (!getIt.isRegistered<Sqflite>()) {
      getIt.registerLazySingleton(() => Sqflite());
    }
    currencyBloc = getIt.get<CurrencyBloc>();
  });

  group("Currency bloc Work ", () {
    test("has correct initial", () {
      expect(currencyBloc, equals(getIt.get<CurrencyBloc>()));
    });

    test("has correct init state", () {
      expect(currencyBloc.state, HomeInitial());
    });

    blocTest(
      "GetAllCurrencies",
      build: () => currencyBloc,
      expect: () => [],
    );

    blocTest(
      "SelectCurrencyEvent",
      build: () => currencyBloc,
      act: (bloc) => bloc.add(
        SelectCurrencyEvent(
          CurrencySelect.from,
          CurrencyResponse(
            symbol: "€",
            name: "Euro",
            symbolNative: "€",
            decimalDigits: 2,
            rounding: 0,
            code: "EUR",
            namePlural: "Euros",
          ),
        ),
      ),
      expect: () => [
        HomeStartSelectCurrencyState(),
        HomeSelectCurrencySuccessState(),
      ],
    );

    tearDown(() {
      currencyBloc.close();
    });
  });
}
