import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../common/common.dart';
import '../../../../../common/util/local_json.dart';
import '../vo_simple_stock.dart';

class StockSearchData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> searchResult = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    () async {
      stocks.addAll(await LocalJson.getObjectList("json/stock_list.json"));
    }();
    super.onInit();
  }

  void search(String text) {
    if (isBlank(text)) {
      searchResult.clear();
      return;
    }
    searchResult.value = stocks.where((element) => element.name.contains(text)).toList();
  }

  void addSearchHistory(String stockName) {
    searchHistoryList.insert(0, stockName);
  }

  //강의보고 별도 추가
  void removeSearchHistory(String stockName) {
    searchHistoryList.remove(stockName);
  }
}
