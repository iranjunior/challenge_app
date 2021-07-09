import 'dart:core';
import 'package:intl/intl.dart';

extension Concurrency on num {
  String formatToMoney() {
    final f = NumberFormat("###,###.00##", "pt_BR");
    return 'R\$ ${f.format(this)}';
  }
  String formatToPercentTax() {
    return '${this.toStringAsFixed(3)}%';
  }
  String formatToPercent() {
    return '${this.toStringAsFixed(2)}%';
  }
}
