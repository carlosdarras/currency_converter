import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/home_bloc.dart';
import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';
import 'package:flutter/material.dart';

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
          textColor: Colors.black,
        ),
        const VerticalSpacing(1),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: currencyBloc.amountController,
          decoration: InputDecoration(
              hintText: "write here ...",
              filled: true,
              fillColor: Colors.grey[200],
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
