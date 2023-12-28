import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';

import 'item/preference_item.dart';
import 'item/rx_preference_item.dart';
import 'item/rxn_preference_item.dart';

class Prefs {
  static final appTheme = PreferenceItem<CustomTheme>('appTheme', CustomTheme.dark);
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);

  //Prefenrence가 특정 page에 종속되지 않도록 rx를 설정
  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOn', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday');
  //RxDateTime은 없다. Rx<>안에 원하는 타입을 넣으면 새로 생성할 수 있으므로 Rx<DateTime>으로 선언
  //Rx는 null 선언이 안되므로 Rxn을 사용
  static final number = RxPreferenceItem<int, RxInt>('number', 0);
}
