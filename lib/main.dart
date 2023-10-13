import 'package:flutter/material.dart';

import 'app.dart';
import 'currency_converter/presentation/di/di.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const App());
}

