curry(Function f) => (a, {Iterable? args}) => (args?.length ?? 0) > 1 ? f(a, args) : (b) => f(a, b);

main() {
  //커리 F => 함수 자체를 쪼개주는 역할

  print(curryMultiply(2)(3)); //2,3을 동시에 넣지 않고 2 먼저 넣고 3 먼저 넣고 가능
  print(curryMultiply(3)(6));
}

final multiply = (int a, int b) => a * b;

final curryMultiply = curry(multiply);
