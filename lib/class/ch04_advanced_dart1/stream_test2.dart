import 'package:fast_app_base/common/cli_common.dart';

void main() async {
  /// List와 Iterable
    /// Iterable : 무언가를 순서대로 할 수 있다는 의미
  // final List list = ['blue', 'yellow', 'red'];
  //
  // list.forEach((element) {
  //   print(element);
  // });
  // for (final color in [1, 2, 3, 4, 5]) {
  //   print(color);
  // }

  /// sync*로 Iterable 만들기

  //Await For을 사용하면 Iterable 대신에 Stream을 사용할 수 있다
  await for (final message in countStream(3)) {
    print(message);
  }

  /// async*로 Stream 만들기

  /// yield*를 통해서 Iterable & Stream 연장시키기
}

//Sync : 확실하게 수행될 수 있는 로컬작업에서 사용
Iterable<String> countIterable(int max) sync* {
  for (int i = 1; i <= max; i++) {
    yield i.toString();
  }
  yield '새해복 많이 받으세요';
  yield* ['a', 'b', 'c'];
}

///Generator

//Async : 얼마나 걸릴지 모르는 Future함수를 사용할 때 사용
Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(1.seconds);
    yield i.toString();
  }
  yield '새해복 많이 받으세요';
  yield* countStream(to); //sync*처럼 Iterable을 넣는 것이 아니라 Stream을 넣어야 함.
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}