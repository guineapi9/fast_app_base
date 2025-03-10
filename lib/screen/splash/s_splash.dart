import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with AfterLayoutMixin{

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    delay((){
      Nav.clearAllAndPush(const MainScreen());
    }, 1500.ms);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      "assets/image/splash/splash.png",
      width: 192,
      height: 192,
    ));
  }
}
