import 'package:currency_converter/currency_converter/shared/widgets/tools.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: "Welcome To Currency Converter",
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      textColor: Colors.black,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
