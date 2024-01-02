import 'vo_bank.dart';

class BankAccount {
  final int userId; //추가
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
      this.userId,
      this.bank,
      this.balance, {
        this.accountTypeName,
      });

  //ChatGPT의 의견에 따라 추가
  @override
  String toString() {
    return 'UserId: ${userId}, BankAccount: ${bank.name}, Balance: $balance, Type: $accountTypeName';
  }
}