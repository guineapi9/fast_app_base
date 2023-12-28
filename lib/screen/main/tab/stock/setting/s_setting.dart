import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/scaffold/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/data/preference/prefs.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final scrollController = ScrollController();


  /*
  bool isPushOn = false;
  // 설정 불러오기
  @override
  void initState() {
    isPushOn = Prefs.isPushOn.get()!;
    super.initState();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 150),
            children: [
              //switch
              Obx(
                () => SwitchMenu(
                  "푸쉬설정",
                  Prefs.isPushOnRx.get(),
                  onChanged: (isOn) {
                    Prefs.isPushOnRx.set(isOn); // 설정 저장하기
                    /* Rx를 사용함으로써 더이상 불필요.
                setState(() {
                isPushOn = isOn;
              })*/
                  },
                ),
              ),

              //slider
              Obx(
                () => Slider(
                  value: Prefs.sliderPosition.get(),
                  onChanged: (value) {
                    Prefs.sliderPosition.set(value);
                  },
                ),
              ),

              //date time
              Obx(
                () => BigButton(
                    "날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}",
                    onTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days));

                  if (date != null) {
                    Prefs.birthday.set(date); //null이 아니면 데이터 저장
                  }
                }),
              ),

              //number dialog
              Obx(
                    () => BigButton(
                    "저장된 숫자 ${Prefs.number.get()}",
                    onTap: () async {
                      final number = await NumberDialog().show();; //number를 받게 된다.
                      if(number!=null){
                        Prefs.number.set(number);
                      }
                    }),
              ),

              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),

              BigButton("오픈소스 화면(추가1)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),

              BigButton("오픈소스 화면(추가2)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),

              BigButton("오픈소스 화면(추가3)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가4)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가5)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가6)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가7)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가8)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가9)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가10)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면(추가11)", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
            ],
          ),

          //Appbar
          AnimatedAppBar("설정", controller: scrollController,)
        ],
      ),
    );
  }
}
