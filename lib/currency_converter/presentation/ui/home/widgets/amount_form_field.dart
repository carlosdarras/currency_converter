import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';

class AmountFormField extends StatelessWidget {
  const AmountFormField({Key? key, required this.currencyBloc}) : super(key: key);
  final CurrencyBloc currencyBloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Amount",
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: currencyBloc.amountController,
          decoration: InputDecoration(
              hintText: "write here ...",
              filled: true,
              fillColor: Theme.of(context).colorScheme.tertiary,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
        ),
      ],
    );
  }
}
