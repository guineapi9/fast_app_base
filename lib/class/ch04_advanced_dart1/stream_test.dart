import 'dart:async';

import 'package:fast_app_base/common/cli_common.dart';

void main() {
  /// Stream 기본 개념
  /// Future - 1번의 데이터를 가져옴
  /// Stream - 여러번의 데이터를 받을 수 있음(ex : 스트리밍)

  /// Stream 생성과 수행
  /// 1. async*

  //countStream 함수는 하단에 있음

  // countStream(4).listen((event) {
  //   print(event);
  // });

  /// 2. streamController

  // 스트림 컨트롤러를 선언
  // final controller = StreamController<int>();
  // final stream = controller.stream;
  //
  // stream.listen((event) {
  //   print(event);
  // });

  // void addDataToTheSink(StreamController<int> controller) async {
  //   for (int i = 1; i <= 4; i++) {
  //     print('before add sink');
  //     controller.sink.add(i);
  //     print('after add sink');
  //     await sleepAsync(1.seconds);
  //   }
  // }
  //함수 실행
  // addDataToTheSink(controller);

  /// Stream 데이터 변환
  // countStream(4).map((e) => '$e초가 지났습니다.').listen((event) {
  //   print(event);
  // });

  /// 위젯에서 Stream Data 표현하기

  /// Stream 데이터 관찰2 - BroadcastStream

  // final broadCastStream = countStream(4).asBroadcastStream();
  // broadCastStream.listen((event) {
  //   print(event);
  // });
  //
  // Future.delayed(2.seconds, () {
  //   broadCastStream.listen((event) {
  //     print('방송 2초 후: $event');
  //   });
  // });

  /// 2개의 위젯에서 하나의 BroadcastStream Data 표현하기

  /// Stream Error Handling
//   countStream(5).handleError((e) {
//     print(e);
//   }).listen((event) {
//     print(event);
//   }, cancelOnError: false);
//
// } //main 함수의 끝

  Iterable<int> countIterable(int max) sync* {
    yield* [];
  }


  /// 에러 발생 있는 버전
  // Stream<int> countStream(int max) async* {
  //   for (int i = 1; i <= max; i++) {
  //     if (i == 2) {
  //       yield* Stream.error(Exception("에러 발생"));
  //     } else {
  //       //print('before yield');
  //       yield i;
  //       //print('after yield');
  //     }
  //     await sleepAsync(1.seconds);
  //   }
  // }

  // void addDataToTheSink(StreamController<int> controller) async {
  //   for (int i = 1; i <= 4; i++) {
  //     controller.sink.add(i);
  //     await sleepAsync(1.seconds);
  //   }
  // }
  // }

  /// 에러 발생 없는 버전
  Stream<int> countStream(int max) async* {
    for (int i = 1; i <= max; i++) {
      //print('before yield');
      yield i;
      //print('after yield');
      await sleepAsync(1.seconds);
    }
  }
}