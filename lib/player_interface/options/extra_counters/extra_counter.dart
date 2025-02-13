import 'package:flutter_svg/flutter_svg.dart';

class ExtraCounter {
  final String symbol;
  final int count;

  ExtraCounter({
    required this.symbol,
    this.count = 0,
  });

  ExtraCounter copyWith({
    String? symbol,
    int? count,
  }) {
    return ExtraCounter(
      symbol: symbol ?? this.symbol,
      count: count ?? this.count,
    );
  }
}
