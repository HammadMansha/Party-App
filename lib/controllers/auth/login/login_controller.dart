// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:Pam_App/utils/libraries/app_libraries.dart';

class LoginScreenController extends GetxController
    with KeysVariables, InitializeLocalStorage {
  RxBool isLoading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login() async {
    try {
      isLoading.value = true;
      update();
      var url = Uri.parse('${ApiData.baseUrl}${ApiData.loginUser}');
      if (kDebugMode) {
        print("Login request------------$url");
      }
      var res = await http.post(
        url,
        body: {
          'email': email.text,
          'password': password.text,
          'forced':'App',
        },
      );
      var data = json.decode(res.body);
      if (res.statusCode == 200) {
        await storage.write("isAppOpen", 'true');
        await storage.write("email", data["user"]["email"]);
        await storage.write("accessToken", data["tokens"]["access"]["token"]);

        print("------------------${data["tokens"]["access"]["token"]}");

        CustomSnackBar.showSnackBar(
            message: AppStrings.loginSuccess,
            title: AppStrings.successTitle,
            backgroundColor: AppColors.allButtonsColor,
            isWarning: false);
        Get.offAll(() => const DashboardScreen());
        isLoading.value = false;
        update();
      } else {
        storage.write("isAppOpen", false);

        isLoading.value = false;
        update();
        CustomSnackBar.showSnackBar(
            title: AppStrings.warningTitle,
            message: AppStrings.incorrectUsername,
            backgroundColor: AppColors.allButtonsColor,
            isWarning: true);
      }
    } on SocketException catch (e) {
      print("error in socket exception $e");

      CustomSnackBar.showSnackBar(
          title: AppStrings.unableToConnect,
          message: "",
          isWarning: true,
          backgroundColor: AppColors.allButtonsColor);
      isLoading.value = false;
      update();
    }
    catch (e) {
      if (kDebugMode) {
        print("error in catch");
        print("error $e");

      }
      isLoading.value = false;
      update();

      if(e.toString().contains("Connection failed")){
        CustomSnackBar.showSnackBar(
            title: "Warning",
            message:"No Network available",
            backgroundColor: AppColors.allButtonsColor,
            isWarning: true);

      }
      else {
        CustomSnackBar.showSnackBar(
            title: AppStrings.warningTitle,
            message: AppStrings.noNetworkAvail,
            backgroundColor: AppColors.allButtonsColor,
            isWarning: true);
      }

    }
  }
}
