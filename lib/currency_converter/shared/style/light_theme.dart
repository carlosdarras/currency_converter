import '../widgets/tools.dart';

class LightTheme {
  final BuildContext context;

  LightTheme(this.context);

  LightTheme.of(this.context);

  Color get myGreyColor => const Color(0xFFF1F2F6);

  Color get myBlackColor => Colors.black;

  Color get myWhitColor => Colors.white;

  ThemeData get theme => ThemeData.light().copyWith(
        brightness: Brightness.light,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: myWhitColor,
              secondary: myBlackColor,
              tertiary: myGreyColor,
            ),
      );
}
