import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpController extends GetxController {
  StreamController<ErrorAnimationType>? errorController;
  RxBool isEmpty = true.obs;
  var secondsRemaining = 60.obs;
  Timer? _timer;
  TextEditingController pinCode=TextEditingController();

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (secondsRemaining.value == 0) {
        timer.cancel();
        // Perform any action when the timer finishes
      } else {
        secondsRemaining.value--;
      }
    });
  }
}
