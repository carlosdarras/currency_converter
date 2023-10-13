import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/home_bloc.dart';
import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';

class ShowResultOfCovertBuilder extends StatelessWidget {
  const ShowResultOfCovertBuilder({Key? key, required this.currencyBloc})
      : super(key: key);
  final CurrencyBloc currencyBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text:
              "${currencyBloc.fromCurrency.code} to ${currencyBloc.toCurrency.code} :",
          fontWeight: FontWeight.normal,
        ),
        const VerticalSpacing(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: currencyBloc.covertValue.toStringAsFixed(2),
              fontWeight: FontWeight.normal,
              fontSize: 20.sp,
            ),
            const HorizontalSpacing(3),
            TextWidget(
              text: "${currencyBloc.toCurrency.code}",
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ],
        ),
      ],
    );
  }
}
