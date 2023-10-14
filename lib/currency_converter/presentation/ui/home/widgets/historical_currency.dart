import 'package:currency_converter/currency_converter/presentation/ui/home/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';
import 'package:intl/intl.dart';

class HistoricalCurrency extends StatelessWidget {
  const HistoricalCurrency({Key? key, required this.currencyBloc})
      : super(key: key);
  final CurrencyBloc currencyBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFF1F2F6),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurRadius: 26, blurStyle: BlurStyle.outer)
          ]),
      child: Column(
        children: [
          Container(
            height: 10.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.black),
            child: Center(
              child: TextWidget(
                text: "1 Euro to US Dollar stats",
                textColor: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16.sp,
              ),
            ),
          ),
          const VerticalSpacing(2),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  TextWidget(
                    text: DateFormat('yyyy-MM-dd')
                        .format(currencyBloc.historicalResponse![index].date!),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                  const Spacer(),
                  TextWidget(
                    text: currencyBloc.historicalResponse![index].price!
                        .toStringAsFixed(4),
                    fontWeight: FontWeight.normal,
                    textColor: Colors.grey,
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => VerticalSpacing(2),
            itemCount: currencyBloc.historicalResponse!.length,
          )
        ],
      ),
    );
  }
}
