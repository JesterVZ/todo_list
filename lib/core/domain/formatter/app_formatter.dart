import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatter {
  /// без суффикса RUB
  static final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'ru', customPattern: "#,##0.00");

  static String currentLocale(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }

  /// Преобразование в строку даты с учетом локали пользователя.
  /// Для RU результат в формате 26.09.2021
  /// Для EN результат в формате 09/26/2021
  static formatDate(DateTime date, BuildContext context) {
    return Localizations.of<MaterialLocalizations>(
            context, MaterialLocalizations)!
        .formatCompactDate(date);
  }

  /// Преобразование в строку даты и времени с учетом локали пользователя.
  /// Для RU результат в формате 26.09.2021 10:34
  /// Для EN результат в формате 09/26/2021 7:35 PM
  static formatDateTime(DateTime date, BuildContext context) {
    var dateStr = formatDate(date, context);
    var timeStr = TimeOfDay.fromDateTime(date).format(context);
    return '$dateStr $timeStr';
  }

  /// Преобразование в строку денежного значения в локали RU
  /// Результат в формате 1 250,45
  static String formatCurrency(dynamic price) {
    return _currencyFormatter.format(price);
  }

  /// Преобразование в число денежного значения
  /// Входная строка должна иметь формат в локали RU, например, '1 250,45'
  static num parseCurrency(String price) {
    return _currencyFormatter.parse(price);
  }
}
