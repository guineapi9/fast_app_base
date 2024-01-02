
import 'package:fast_app_base/common/dart/extension/collection_extension.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(1, bankShinhan, 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(2, bankShinhan, 30000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(3, bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(4, bankTtoss, 5000000);
final bankAccountKakao = BankAccount(5, bankKakao, 7000000, accountTypeName: "입출금통장");
final bankAccountKakao2 = BankAccount(6, bankKakao, 7000000, accountTypeName: "특별통장");

//Dog와 Cat을 포괄할 수 있는 추상 클래스
abstract class Animal {
  void eat();
}

class Dog extends Animal {
  void eat() {
    print('dog');
  }
}

class Cat extends Animal {
  void eat() {
    print('cat');
  }
}

class Cow extends Animal {
  void eat() {
    print('cow');
  }
}

main() {
  //class generic

  final result = doTheWork();
  final result2 = doTheWork2();

  //method or function generic

  final result3 = doTheWork3<Dog>(() => Dog());
  result3.eat();
}

// T는 일종의 변수처럼 어느 알파벳을 넣어도 가능하지만, 대부분 T로 사용
class Result<T> {
  final T data;

  Result(this.data);
}

class ResultString {
  final String data;

  ResultString(this.data);
}

class ResultDouble {
  final double data;

  ResultDouble(this.data);
}

Result doTheWork3<Result extends Animal>(Result Function() animalCreator) {
  return animalCreator();
}

Result<String> doTheWork() {
  ///...1
  ///...2
  ///
  /// ..4
  return Result("중요한 데이터");
}

ResultDouble doTheWork2() {
  ///...1
  ///...2
  ///
  /// ..4
  return ResultDouble(5234.44);
}


//List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
];

//Map
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
};

//Set
final bankSet = {bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao};