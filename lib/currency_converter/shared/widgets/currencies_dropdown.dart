import 'package:country_flags/country_flags.dart';
import 'package:currency_converter/currency_converter/presentation/di/di.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/enums/currency_select_type.dart';
import 'package:currency_converter/currency_converter/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/response/currencies_response.dart';
import '../constant/app_assets.dart';
import 'horizontal_spacing.dart';

class CurrenciesDropdown extends StatelessWidget {
  const CurrenciesDropdown({Key? key, required this.select, required this.homeBloc}) : super(key: key);
  final CurrencySelect select;
  final CurrencyBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: DropdownButton(
        value: select == CurrencySelect.from
            ? homeBloc.fromCurrency
            : homeBloc.toCurrency,
        icon: const Icon(Icons.keyboard_arrow_down),
        borderRadius: BorderRadius.circular(30),
        underline: Container(),
        isExpanded: true,
        items: homeBloc.currenciesResponse!.map((CurrencyResponse items) {
          return DropdownMenuItem(
            value: items,
            child: Row(
              children: [
                items.code!.substring(0, 2) == "EU"
                    ? Image.asset(
                        AppAssets.euroIcon,
                        height: 3.h,
                        fit: BoxFit.cover,
                      )
                    : CountryFlag.fromCountryCode(
                        items.code!.substring(0, 2),
                        height: 3.h,
                        width: 10.w,
                        borderRadius: 8,
                      ),
                const HorizontalSpacing(2),
                TextWidget(text: items.name!),
                const Spacer(),
                TextWidget(text: items.symbolNative!)
              ],
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          homeBloc.add(SelectCurrencyEvent(select, newValue!));
        },
      ),
    );
  }
}
