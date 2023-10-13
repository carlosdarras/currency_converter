import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/home_bloc.dart';
import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';

class ConverterButton extends StatelessWidget {
  const ConverterButton({Key? key, required this.currencyBloc})
      : super(key: key);
  final CurrencyBloc currencyBloc;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: () {
        currencyBloc.add(GetLatestAndCovertBetweenTwoCurrencies());
      },
      text: "Covert Currencies",
    );
  }
}
