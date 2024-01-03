abstract class AbstractRectangular {
  double get height;

  double get width;
}

class Rectangular extends AbstractRectangular {
  @override
  double height;
  @override
  double width;

  Rectangular(this.width, this.height);
}

class Square extends AbstractRectangular {
  double side;

  Square(this.side);


    /// height와 width의 값을 지정. 이 override를 하지 않으면 에러 발생
  // 에러 내용 :
  // non-abstract class 'Square' is missing implementations for these members:
  //  - AbstractRectangular.height
  //  - AbstractRectangular.width
  @override
  double get height => side;

  @override
  double get width => side;

}

main() {

  final square = Square(10);
  print(square.side);

  //Human realMe = BansookJr();

  //realMe.playLol();

  // final AbstractRectangular rectangular = getRectangular();
  // print(rectangular.width);
  // print(rectangular.height);
  // //rectangular.height = 40;
  //
  // if(rectangular is Rectangular){
  //   rectangular.height = 50;
  // }else if(rectangular is Square){
  //   rectangular.side = 40;
  // }
  //
  // switch(rectangular){
  //   case Rectangular(): rectangular.height = 50;
  //   case Square(): rectangular.side = 40;
  // }
  //
  //
  // print(rectangular.width);
}

AbstractRectangular getRectangular() {
  return Square(10);
}

  /// 부모와 자녀의 상속

abstract class Human {}

class Bansook extends Human {
  void playPiano() {}

  void playLol() {}

  void coding() {}
}

class BansookJr extends Human {}

// main(){
//   Human realMe = BansookJr();
//
//   realMe.playLol();
//
// }