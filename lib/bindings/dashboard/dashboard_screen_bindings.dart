import 'package:Pam_App/utils/libraries/app_libraries.dart';

class DashboardScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => SurveyScreenController());
    Get.lazyPut(() => SettingScreenController());
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => SettingScreenController());
  }
}
