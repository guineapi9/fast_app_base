import 'package:fast_app_base/class/ch04_advanced_dart1/functional_programming/fxDart.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';

import '../../screen/main/tab/home/vo/vo_bank_account.dart';
import '../../screen/main/tab/home/vo/vo_user.dart';

  ///getUser, getAccounts(1,2번에서 사용)
// User getUser(int id) {
//   return switch (id) {
//     1 => User(id, "Jason"),
//     2 => User(id, "Dart"),
//     3 => User(id, "Baby"),
//     4 => User(id, "Love"),
//     5 => User(id, "Popcorn"),
//     _ => throw Exception("404 not Found")
//   };
// }
//
// List<BankAccount> getAccounts() {
//   return bankAccounts;
// }

  /// 1. 절차적 프로그래밍 - 명령형 프로그래밍
  /// Accounts => Users => User.name 출력

// main() {
//   final accounts = getAccounts();
//   final list = <String>[];
//   for (final account in accounts) {
//     final user = getUser(account.userId);
//     list.add(user.name);
//   }
//
//   print(list);
// }

  /// 2. 함수형 프로그래밍 - 선언형 프로그래밍(Sync 함수)

// main() {
//   final nameList = getAccounts()
//       .map((account) => account.userId)
//       .map((userId) => getUser(userId))
//       .map((user) => user.name)
//       .toList();
//
//   print(nameList);
// }


  ///getUser, getAccounts(3,4번에서 사용)
Future<List<BankAccount>> getAccounts() async {
  await sleepAsync(1000.ms);
  return bankAccounts;
}

Future<User> getUser(int id) async {
  await sleepAsync(300.ms);
  print(id);
  return switch (id) {
    1 => User(id, "Jason"),
    2 => User(id, "Dart"),
    3 => User(id, "Baby"),
    4 => User(id, "Love"),
    5 => User(id, "Popcorn"),
    _ => throw Exception("404 not Found")
  };
}

  /// 3. 함수형 프로그래밍 - 선언형 프로그래밍(Sync 함수)
// main() async {
//
//   print('start');
//   final nameList = await (await getAccounts()).toStream()
//       .map((account) => account.userId)
//       .asyncMap((userId) => getUser(userId))
//       .map((user) => user.name)
//       .toList(); //1초 뒤 return
//   print(nameList);
//   print('end');
// }

  ///FxDart 사용

main() async {

    /// from Marple CTO 유인동 FxJs
  print('start');
  await fxDart([
    await getAccounts(),
    mapAccountToUserId,
    asyncMapIdToUser,
    mapUserToName,
    printNames
  ]);
  print('end');
}

  printNames(names) => runAll((names) => print(names.toList()), names);

  mapUserToName(users) => map((User user) => user.name, users);

  asyncMapIdToUser(List<int> userIds) => futureMap(getUser, userIds);

  mapAccountToUserId(accounts) => map((BankAccount account) => account.userId, accounts);
