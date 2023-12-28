import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../vo_stock.dart';

class StockItem extends StatelessWidget {
  final Stock stock;
  const StockItem(this.stock,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(stock.stockImagePath, width: 50,),
          width20,
          stock.name.text.size(18).bold.make(),
          emptyExpanded,
          Column(
            children: [
              stock.todayPercentageString.text.size(20).color(stock.getTodayPercentageColor(context)).bold.make(),
              height5,
              stock.yesterdayClosePrice.toComma().text.size(14).color(context.appColors.dimmedText).make(),
            ],
          )
        ],
      ),
    );
  }
}
