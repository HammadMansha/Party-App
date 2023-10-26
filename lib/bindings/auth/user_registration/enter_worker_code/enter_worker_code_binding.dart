import 'package:Pam_App/utils/libraries/app_libraries.dart';

class EnterWorkerCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterWorkCodeController());
  }
}
