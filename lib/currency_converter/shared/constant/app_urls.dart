
import 'app_value.dart';

abstract class ApiUrls{
  static String getCurrencies() => '${AppValue.baseUrl}${AppValue.CURRENCIES}';
  static String getLatest() => '${AppValue.baseUrl}${AppValue.LATEST}';
  static String getHistorical() => '${AppValue.baseUrl}${AppValue.HISTORICAL}';
}