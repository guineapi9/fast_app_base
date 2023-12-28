import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

abstract mixin class StockPercentageDataProvider {

  int get currentPrice;
  int get yesterdayClosePrice;
  // 위 두개의 데이터가 미리 있다고 가정하기 위해 abstract를 사용.

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);

  String get todayPercentageString => _isPlus ? '+$todayPercentage%' : '$todayPercentage%';

  bool get _isPlus => currentPrice > yesterdayClosePrice;

  bool get _isSame => currentPrice == yesterdayClosePrice;

  Color getTodayPercentageColor(BuildContext context) {
    if (_isSame) {
      return context.appColors.dimmedText;
    } else if (_isPlus) {
      return context.appColors.plus;
    } else {
      return context.appColors.minus;
    }
  }
}