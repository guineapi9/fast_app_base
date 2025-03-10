import 'package:fast_app_base/class/ch04_advanced_dart1/object_oriented_programming/1_characteristic/animal.dart';

main() {
  /// 객체지향 프로그래밍(OOP)의 특징

  /// 1. 추상화 (Abstraction)
  ///  - Abstract Class (extends - only 1)
  ///   - Animal - age, eat()
  ///   - Dog, Cat
      /// 실제로 객체를 생성할 수 없음.
      /// final animal = Animal(0); -> 에러 반환.
  ///
  ///  - Abstract mixin Class (with - n*)
        ///여러개의 클래스를 가져올 수 있음.
  ///
  ///
  ///  - Abstract interface Class (implements - n*)
  ///
  ///

  // final bird = Bird(0);
  // bird.fly();
  // bird.run();

  /// 2. 상속 (Inheritance)
  ///  - Extends

  /// 3. 다형성 (Polymorphism)
  ///  - override
      /// 재정의
  ///  - implement

  final bird = Bird(0, "long 2 legs");
  final dog = Dog(0, "long");
  dog.addAge();
  CanRun runner1 = bird;
  runRace(<CanRun>[dog, bird]);

  /// 4. 캡슐화 (Encapsulation)
  ///  - private ( _ 언더스코어, 언더바)
  ///  - method
  ///  - get & set
}

void runRace(List<CanRun> list) {
  for (final runner in list) {
    runner.run("첫번째 경기");
    if (runner is Dog) {
      runner.addAge();
    }
    //print(runner);
  }
}
