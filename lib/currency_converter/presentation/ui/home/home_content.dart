import 'package:currency_converter/currency_converter/presentation/di/di.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/home_bloc.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/widgets/amount_form_field.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/widgets/historical_currency.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/widgets/welcome_message.dart';
import 'package:currency_converter/currency_converter/shared/enums/currency_selecter_type.dart';
import 'package:currency_converter/currency_converter/shared/widgets/vertical_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'widgets/converter_button.dart';
import 'widgets/select_currency_builder.dart';
import 'widgets/show_result_of_covert_builder.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late CurrencyBloc _currencyBloc;

  @override
  void initState() {
    _currencyBloc = getIt.get<CurrencyBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      bloc: _currencyBloc,
      builder: (context, state) {
        print('the state is $state');
        if (_currencyBloc.currenciesResponse!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
            children: [
              const WelcomeMessage(),
              const VerticalSpacing(2),
              SelectCurrencyBuilder(
                currencySelect: CurrencySelect.from,
                currencyBloc: _currencyBloc,
              ),
              const VerticalSpacing(2),
              SelectCurrencyBuilder(
                currencySelect: CurrencySelect.to,
                currencyBloc: _currencyBloc,
              ),
              const VerticalSpacing(2),
              AmountFormField(
                currencyBloc: _currencyBloc,
              ),
              const VerticalSpacing(2),
              ConverterButton(
                currencyBloc: _currencyBloc,
              ),
              const VerticalSpacing(2),
              ShowResultOfCovertBuilder(
                currencyBloc: _currencyBloc,
              ),
              const VerticalSpacing(3),
              state is HomeGetHistoricalLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : HistoricalCurrency(currencyBloc: _currencyBloc),
            ],
          );
        }
      },
    );
  }
}
