import 'package:Pam_App/utils/libraries/app_libraries.dart';

class FillSurveyFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FillSurveyFormController());
  }
}
