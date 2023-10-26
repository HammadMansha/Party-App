import 'package:Pam_App/utils/libraries/app_libraries.dart';






class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => Get.offAll(() => LoginScreen()),
    );
    return Scaffold(
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context){
    return GetBuilder(init: RegisterSuccessController(),builder: (_){
      return Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: AppColors.blackColor,

          image: DecorationImage(
            image: AssetImage(AppAssets.registerSuccess),
            fit: BoxFit.fill,
          ),
        ),
      );

    });
  }
}
