import 'package:Pam_App/utils/libraries/app_libraries.dart';

class PlayerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerScreenController());
  }
}
