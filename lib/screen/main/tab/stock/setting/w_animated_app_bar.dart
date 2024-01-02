import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(
    this.title, {
    super.key,
    required this.scrollController,
    required this.animationController,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration get duration => 10.ms;
  double scrollPosition = 0;
  late Animation<double> animation =
      CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  //Stateful 위젯은 getter로 만들어서 객체 생성 이후에만 사용할 수 있다. 그러므로 late가 반드시 필요하다.

  //컨트롤러는 제어하는 역할이고, 값을 변경하는 것은 animation을 사용하면 된다.

  @override
  void initState() {
    widget.animationController.addListener(() {
      setState(() {
      }); //setState를 선언해줘야 Build함수가 AnimationTicker가 동작 할 때마다 수행이 되고, 하위의 Animation value도 값이 변화한다.
    });

    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;

  bool get isNotTriggered => !isTriggered;

  double getValue(double initial, double target) {
    if(scrollPosition < 0){ // scrollPosition이 0 이하이면 에러나서 별도 생성
      return initial;
    }
    else if (isTriggered) {
      return target;
    } else {
      double fraction = scrollPosition / 80;
      return initial + (target - initial) * fraction;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        bottom: false, //하단 SafeArea 삭제(내 추가)
        child: Stack(
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(
                  left: getValue(40, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                    fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
                child: widget.title.text.make(),
              ),
            ),
            Tap(
                onTap: () {
                  Nav.pop(context);
                },
                child: const Arrow(
                  direction: AxisDirection.left,
                ).p20()),
            Positioned( //Postioned.fill에서 position으로 변경
              left: animation.value * 100+200, //value가 0~1이므로 곱해서 증폭6
              child: TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                      begin: Colors.green,
                      end: isTriggered ? Colors.orange : Colors.green),
                  duration: 1000.ms,
                  builder: (context, value, child) => ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        value ?? Colors.green,
                        BlendMode.modulate,
                      ),
                      child: child),
                  child: Image.asset(
                    "$basePath/icon/map_point.png",
                    height: 60,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
