import 'package:animations/animations.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/dummy_popular_stocks.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:flutter/material.dart';

class PopularSearchList extends StatefulWidget {
  const PopularSearchList({Key? key}) : super(key: key);

  @override
  State<PopularSearchList> createState() => _PopularSearchListState();
}

class _PopularSearchListState extends State<PopularSearchList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//1. Row
        Row(
          children: [
            '인기 검색'.text.bold.white.size(16).make(),
            emptyExpanded,
            '오늘 ${DateTime.now().formattedTime} 기준'.text.white.size(12).make(),
          ],
        ).pSymmetric(h: 20, v: 15),

        //2. Height
        height20,

        //3. PopularStocks
        ...popularStocks
            .mapIndexed(
              (e, index) => OpenContainer<bool>(
                openColor: context.backgroundColor,
                closedColor: context.backgroundColor,
                openBuilder: (BuildContext context, VoidCallback _) {
                  return StockDetail(stockName: e.name);
                },
                closedBuilder: (BuildContext context, VoidCallback action) {
                  return Row(
                    children: [
                      (index + 1).text.bold.white.size(16).make(),
                      width20,
                      e.name.text.bold.white.size(16).make(),
                      emptyExpanded,
                      e.todayPercentageString.text
                          .color(e.getTodayPercentageColor(context))
                          .size(16)
                          .make(),
                    ],
                  ).pSymmetric(h: 20, v: 20);
                },
              ),
            ).toList(),
      ],
    );
  }
}
