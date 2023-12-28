import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({super.key, super.animation = NavAni.Fade});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends State<NumberDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                "숫자를 입력해 주세요.".text.make(),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                ),
                height20,
                RoundButton(
                    width: 30,
                    height: 30,
                    bgColor: Colors.green,
                    text: "완료",
                    onTap: () {
                      final text = controller.text;
                      int number = int.parse(text); //text -> int로 변환
                      widget.hide(number); //number를 넘기고 hide
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
