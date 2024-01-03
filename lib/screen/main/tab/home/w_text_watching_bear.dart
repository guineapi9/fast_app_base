import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TextWatchingBearController{
  late void Function() runSuccessAnimation;
  late void Function() runFailAnimation;
}

class TextWatchingBear extends StatefulWidget {
  final bool check;
  final bool handsup;
  final double look;
  final TextWatchingBearController controller;

  const TextWatchingBear({
    super.key,
    required this.check,
    required this.handsup,
    required this.look,
    required this.controller,
  });

  @override
  State<TextWatchingBear> createState() => _TextWatchingBearState();
}

class _TextWatchingBearState extends State<TextWatchingBear> {
  late StateMachineController controller;

  //초기화를 바로 하지 못하고 onInit일 때 초기화 하므로 late 사용.
  late SMIBool smiCheck;
  late SMIBool smiHandsup;
  late SMINumber smiLook;
  late SMITrigger smiSuccess;
  late SMITrigger smiFail;

  @override
  void initState() {
    widget.controller.runSuccessAnimation = (){
      smiSuccess.fire();
    };
    widget.controller.runFailAnimation = (){
      smiFail.fire();
    };
    // TODO: implement initState
    super.initState();
  }

  //Like버튼이 사용중일 때 빌드가 일어남.
  //(setState가 호출될 때 빌드가 일어남.
  //처음에는 false, setState가 호출되면 isLike가 true로 바뀌고, this.isLike가 true로 바뀌고, 이것으로 인해 다시 빌드를 함.
  //이 변화를 캐치해내는 것이 didUpdateWidget
  @override
  void didUpdateWidget(covariant TextWatchingBear oldWidget) {
    //값이 바뀔때마다 갱신이 된다.
    if (oldWidget.check != widget.check) {
      smiCheck.value = widget.check;
    }

    if (oldWidget.handsup != widget.handsup) {
      smiHandsup.value = widget.handsup;
    }

    if (oldWidget.look != widget.look) {
      smiLook.value = widget.look;
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
    return RiveAnimation.asset(
      "$baseRivePath/login_screen_character.riv",
      stateMachines: ['State Machine 1'],
      onInit: (Artboard art) {
        controller =
            StateMachineController.fromArtboard(art, 'State Machine 1')!;
        //Null이 될 확률이 없으므로 ! 처리
        controller.isActive = true;
        art.addController(controller);
        smiCheck = controller.findInput<bool>('Check') as SMIBool;
        smiHandsup = controller.findInput<bool>('hands_up') as SMIBool;
        smiLook = controller.findInput<double>('Look') as SMINumber;
        smiSuccess = controller.findInput<bool>('success') as SMITrigger;
        smiFail = controller.findInput<bool>('fail') as SMITrigger;
      },
    );
  }
}
