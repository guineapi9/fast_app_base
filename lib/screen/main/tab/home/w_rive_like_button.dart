import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLikeButton extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;

  const RiveLikeButton(this.isLike, {required this.onTapLike, super.key});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late StateMachineController controller;

  //초기화를 바로 하지 못하고 onInit일 때 초기화 하므로 late 사용.
  late SMIBool smiPressed;
  late SMIBool smiHover;

  //Like버튼이 사용중일 때 빌드가 일어남.
  //(setState가 호출될 때 빌드가 일어남.
  //처음에는 false, setState가 호출되면 isLike가 true로 바뀌고, this.isLike가 true로 바뀌고, 이것으로 인해 다시 빌드를 함.
  //이 변화를 캐치해내는 것이 didUpdateWidget
  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    if (oldWidget.isLike != widget.isLike) {
      smiPressed.value = widget.isLike;
      smiHover.value = widget.isLike;
    }

    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  /*
    if(oldWidget.isLike != widget.isLike){
      if(widget.isLike){
        smiPressed.value = true;
        smiHover.value = true;
      } else{
        smiPressed.value = false;
        smiHover.value = false;
      }
    }*/

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        widget.onTapLike(!widget.isLike);
        //좋아요가 눌러져 있으면 끄도록 반대의 값을 준다.
      },
      child: RiveAnimation.asset(
        "$baseRivePath/light_like.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art) {
          controller =
          StateMachineController.fromArtboard(art, 'State Machine 1')!;
          //Null이 될 확률이 없으므로 ! 처리
          controller.isActive = true;
          art.addController(controller);
          smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
          smiHover = controller.findInput<bool>('Hover') as SMIBool;
        },
      ),
    );
  }
}