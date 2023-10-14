import 'package:currency_converter/currency_converter/domain/response/currencies_response.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/enums/currency_select_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CurrencyEvent", () {
    group("GetAllCurrencies", () {
      test(
          "test Get All Currencies ",
          () => () {
                expect(GetAllCurrencies(), GetAllCurrencies());
              });
    });
    group("SelectCurrencyEvent", () {
      CurrencySelect select = CurrencySelect.from;
      CurrencyResponse response = CurrencyResponse(
          id: 2,
          symbol: "\$",
          name: " US Dollar",
          symbolNative: "\$",
          decimalDigits: 2.0,
          rounding: 0.0,
          code: "USD",
          namePlural: "US dollars");

      SelectCurrencyEvent selectCurrencyEvent() {
        return SelectCurrencyEvent(
          select,
          response,
        );
      }

      test("Support value Equality", () {
        expect(selectCurrencyEvent(), equals(selectCurrencyEvent()));
      });
    });
    group("GetLatestAndCovertBetweenTwoCurrencies", () {
      test(
          "test Get All Currencies ",
          () => () {
                expect(GetLatestAndCovertBetweenTwoCurrencies(),
                    GetLatestAndCovertBetweenTwoCurrencies());
              });
    });
    group("GetHistoricalPriceForSevenDaysAgo", () {
      test(
          "test Get All Currencies ",
          () => () {
                expect(GetHistoricalPriceForSevenDaysAgo(),
                    GetHistoricalPriceForSevenDaysAgo());
              });
    });
  });
}
