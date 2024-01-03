abstract class Animal {
  Animal(this._age);

  int _age; //바뀌지 않도록 캡슐화

  int get age => _age; //Getter를 통해서 값을 가져올 수 있다.

  //age의 값은 addAge를 통해서만 값이 바뀔 수 있음.
  // addAge를 사용하는 모든 곳 확인 Cmd + Shift + F7
  void addAge() {
    _age++;
  }

  void eat() {
    print('기본 eat');
  }
}

abstract mixin class CanFly {
  String wings = "wings";

  void fly() {
    print('훨훨');
  }
}

abstract mixin class CanFlyUpgrade implements CanFly {
  String wings = "wings";

  void fly() {
    print('훨훨');
  }
}

//interface는 extends에 with가 아닌 implements로 확장을 한다.
abstract interface class CanRun {
  String get legs;

  set legs(String value);

  int run(String raceName);
}

abstract interface class CanRunUpgrade extends CanRun {
  void run3();
}

class Dog extends Animal implements CanRun {
  Dog(super.age, this.legs);

  @override
  void eat() {
    print('촵촵');
  }

  @override
  String legs;

  @override
  int run(String name) {
    print('$name 후다다다닥');
    return 5;
  }
}

class Bird extends Animal with CanFly implements CanRunUpgrade {
  Bird(super.age, this.legs);

  @override
  void eat() {
    print('콕콕');
  }

  @override
  String legs;

  @override
  int run(String ranceName) {
    print('$ranceName 닥닥');
    return 2;
  }

  @override
  void run3() {
    // TODO: implement run3
  }
}
