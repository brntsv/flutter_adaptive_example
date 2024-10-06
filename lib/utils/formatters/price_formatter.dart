import 'package:intl/intl.dart';

/// Форматтер для цен
class PriceFormatter {
  PriceFormatter._();

  static const decimalDigits = 0;
  static const symbol = '\u20BD';

  static final _priceFormatter = NumberFormat.currency(
    locale: 'ru_RU',
    decimalDigits: decimalDigits,
    symbol: symbol,
  );

  /// Форматтер для цен. Приводит 1000000 к 1 000 000 ₽
  static String format<Type extends num?>(Type price) => _priceFormatter.format(price);
}
