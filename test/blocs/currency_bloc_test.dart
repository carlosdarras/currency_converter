// import 'package:bloc_test/bloc_test.dart';
// import 'package:currency_converter/currency_converter/data/data_sources/remote/repositories/currencies_repo.dart';
// import 'package:currency_converter/currency_converter/presentation/di/di.dart';
// import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
// import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// class MockCurrenciesRepository extends MockBloc<CurrencyBloc, CurrencyState>
//     implements CurrenciesRepository {}

void main() {
  // late CurrencyBloc currencyBloc;
  // // late CurrenciesRepository mockCurrenciesRepository;
  // // late CurrenciesRepoImplement repoImplement;
  // //
  // // CurrencyBloc buildBloc() {
  // //   return CurrencyBloc(mockCurrenciesRepository);
  // // }
  //
  // setUp(() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   setup();
  //   currencyBloc = getIt.get<CurrencyBloc>();
  // });
  // group("CurrencyBloc", () {
  //   group("Currency bloc", () {
  //     test("has correct init state", () {
  //       expect(currencyBloc, equals(getIt.get<CurrencyBloc>()) );
  //     });
  //   });
  //
  //   group("GetAllCurrencies", () {
  //     blocTest<CurrencyBloc, CurrencyState>(
  //         "emit [HomeGetAllCurrenciesInfoSuccessState 1]",
  //         build: () => currencyBloc,
  //         expect: () => []);
  //
  //     blocTest<CurrencyBloc, CurrencyState>(
  //         "emit [HomeGetAllCurrenciesInfoSuccessState 2]",
  //         build: () => currencyBloc,
  //         act: (bloc) async {
  //           bloc.add(GetAllCurrencies());
  //         },
  //         expect: () {
  //           return [
  //             HomeGetAllCurrenciesInfoLoadingState(),
  //             HomeGetAllCurrenciesInfoSuccessState(),
  //           ];
  //         });
  //   });
  //   tearDown(() {
  //     currencyBloc.close();
  //   });
  // });
}
