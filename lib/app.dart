import 'package:currency_converter/currency_converter/presentation/ui/home/home_view.dart';

import 'currency_converter/shared/widgets/tools.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppValue.appName,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const HomeView(),
        );
      }
    );
  }
}
