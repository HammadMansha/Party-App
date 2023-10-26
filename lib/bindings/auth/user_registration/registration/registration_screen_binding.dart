import 'package:Pam_App/utils/libraries/app_libraries.dart';

class RegistrationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}
