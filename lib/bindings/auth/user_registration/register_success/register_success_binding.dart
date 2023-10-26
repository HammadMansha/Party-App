import 'package:Pam_App/utils/libraries/app_libraries.dart';

class RegisterSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterSuccessController());
  }
}
