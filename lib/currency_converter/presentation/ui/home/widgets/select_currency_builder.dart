import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/enums/currency_select_type.dart';
import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';

class SelectCurrencyBuilder extends StatelessWidget {
  const SelectCurrencyBuilder(
      {Key? key, required this.currencySelect, required this.currencyBloc})
      : super(key: key);
  final CurrencySelect currencySelect;
  final CurrencyBloc currencyBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: currencySelect == CurrencySelect.from ? "From" : "TO",
          fontWeight: FontWeight.bold,
          textColor: Colors.black,
        ),
        const VerticalSpacing(1),
        CurrenciesDropdown(
          select: currencySelect,
          homeBloc: currencyBloc,
        ),
      ],
    );
  }
}
