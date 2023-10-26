import 'package:Pam_App/utils/libraries/app_libraries.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpController());
  }
}
