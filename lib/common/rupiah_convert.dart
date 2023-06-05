import 'package:intl/intl.dart';

String formatRupiah(double number) {
  final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
  return formatCurrency.format(number);
}
