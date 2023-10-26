import 'dart:async';
import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:http/http.dart' as http;
import '../../../../views/auth/user_registration/registration/registration_screen.dart';
import '../../../../widgets/common_snackbar/common_snackbar.dart';

class EnterWorkCodeController extends GetxController
    with InitializeLocalStorage, KeysVariables {
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController pinCode = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    GlobalVariables.role = storage.read("role");
    if (kDebugMode) {
      print(GlobalVariables.role);
    }
    // TODO: implement onInit
    super.onInit();
  }

  //----------------------verify otp API call--------------------

  Future<void> verifyOtp() async {
    try {
      isLoading.value = true;
      var url = Uri.parse(
          '${ApiData.baseUrl}${ApiData.verifyInviteOtp}?code=${pinCode.text}');
      var response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print("status code------------------${response.statusCode}");
      if (response.statusCode == 200) {
        CustomSnackBar.showSnackBar(
            title: AppStrings.successTitle,
            message: AppStrings.codeVerified,
            backgroundColor: AppColors.allButtonsColor);
        Get.offAll(RegistrationScreen());
        isLoading.value = false;
        update();
      } else if (response.statusCode == 404) {
        CustomSnackBar.showSnackBar(
            title: AppStrings.warningTitle,
            message: AppStrings.invitationCodeNotFound,
            backgroundColor: AppColors.allButtonsColor,
            isWarning: true);
        isLoading.value = false;
        update();
      } else {
        CustomSnackBar.showSnackBar(
            title: AppStrings.warningTitle,
            message: AppStrings.somethingWentWrong,
            backgroundColor: AppColors.allButtonsColor,
            isWarning: true);
        isLoading.value = false;
        update();
      }
    } catch (e) {
      print("catch error $e");
      CustomSnackBar.showSnackBar(
          title: AppStrings.warningTitle,
          message: AppStrings.somethingWentWrong,
          backgroundColor: AppColors.allButtonsColor,
          isWarning: true);
      isLoading.value = false;
      update();
    }
  }
}
