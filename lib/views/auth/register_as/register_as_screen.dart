import 'package:Pam_App/utils/libraries/app_libraries.dart';

class RegisterAsScreen extends StatelessWidget with InitializeLocalStorage {
  RegisterAsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder(
      init: RegisterAsController(),
      builder: (_) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppColors.loginBackground,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            backgroundBlendMode: BlendMode.darken,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  backgroundImage: AssetImage(
                    AppAssets.logo,
                  ),
                ),
              ).marginOnly(top: Get.height / 2.5),
              const Spacer(),
              CommonButton(
                width: Get.width,
                text: AppStrings.registerAsWorker,
                textStyle: CommonTextStyle.font16weight600white,
                fillColor: AppColors.allButtonsColor,
                onPressed: () async {
                  storage.write("role", "Worker");
                  _.update();
                  Get.toNamed(Routes.enterWorkerCodeScreen);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              CommonButton(
                width: Get.width,
                text: AppStrings.registerAsSupporter,
                textStyle: CommonTextStyle.font16weight600white,
                fillColor: AppColors.supporterRegisterButtonsColor,
                onPressed: () async {
                  storage.write("role", "Supporter");
                  _.update();
                  Get.offAll(() => RegistrationScreen());

                  CustomSnackBar.showSnackBar(
                      title: AppStrings.alertTitle,
                      message: AppStrings.willBeAvailableSoon,
                      isWarning: true);
                },
              ).marginOnly(bottom: 80),
            ],
          ).marginOnly(left: 36, right: 28),
        );
      },
    );
  }
}
