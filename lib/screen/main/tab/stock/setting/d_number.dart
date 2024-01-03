import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/collection/sort_functions.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

import '../../home/w_text_watching_bear.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({super.key, super.animation = NavAni.Fade});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends State<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final numberFocus = FocusNode(); //Focus가 바뀔때마다 이벤트가 변경된다.
  final passwordFocus = FocusNode();
  final textBearController = TextWatchingBearController();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    numberController.addListener(() {
      setState(() {
        look = numberController.text.length.toDouble() * 1.5;
      });
    });

    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        handsUp = passwordFocus.hasFocus;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                "숫자를 입력해 주세요.".text.make(),
                SizedBox(
                  width: 230,
                  height: 230,
                  child: TextWatchingBear(
                    check: check,
                    handsup: handsUp,
                    look: look,
                    controller: textBearController,
                  ),
                ),
                TextField(
                  focusNode: numberFocus,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  focusNode: passwordFocus,
                  obscureText: true, //비밀번호 효과
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                ),
                height20,
                RoundButton(
                    width: 30,
                    height: 30,
                    bgColor: Colors.green,
                    text: "완료",
                    onTap: () async {
                      final text = numberController.text;
                      try {
                        int number = int.parse(text); //text -> int로 변환
                        textBearController.runSuccessAnimation();
                        await sleepAsync(1000.ms);
                        widget.hide(number); //number를 넘기고 hide
                      } catch (e) {
                        textBearController.runFailAnimation();
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
