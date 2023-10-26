import 'package:Pam_App/utils/libraries/app_libraries.dart';

class RegisterAsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterAsController());
  }
}
