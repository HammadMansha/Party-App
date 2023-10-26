import 'package:Pam_App/utils/libraries/app_libraries.dart';
// ignore: must_be_immutable
class LoginScreen extends StatelessWidget with KeysVariables, ValidateUserEmail {
  LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: bodyData(context),
    );
  }

  Widget bodyData(context) {
    return GetBuilder(
      init: LoginScreenController(),
      builder: (_) {
        return Obx(() {
          return WillPopScope(
            onWillPop: () async {
              if (Theme.of(context).platform == TargetPlatform.android ||
                  Theme.of(context).platform == TargetPlatform.fuchsia) {
                // Send the app to the background on Android
                SystemNavigator.pop();
              } else if (Theme.of(context).platform == TargetPlatform.iOS) {
                // Send the app to the background on iOS
                // Note: This method is deprecated in recent iOS versions
                const platform = MethodChannel('flutter/multi_window');
                await platform.invokeMethod('minimizeApp');
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Container(
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
                child:_.isLoading.value==true?const AppLoader(): Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40.0,
                          ),
                          Center(
                            child: GestureDetector(
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 55,
                                backgroundImage: AssetImage(
                                  AppAssets.logo,
                                ),
                              ),
                            ),
                          ).marginSymmetric(horizontal: 25, vertical: 31),
                          Center(
                            child: Text(
                              AppStrings.peoplesApp,
                              style: CommonTextStyle.font24weight700White,
                            ),
                          ).marginOnly(bottom: 40),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CommonTextField(

                                  disableBorderColor:
                                      AppColors.allTextFieldBordersColor,

                                  controller: _.email,
                                  hintTextColor: AppColors.hintTextColor,
                                  //hintText: 'Email',
                                  labelText: "Email",

                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'This filed is required';
                                    } else if (!isValidEmail(
                                        value.toString())) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r"\s\b|\b\s"))
                                  ],
                                  onChanged: (value) {
                                    value = value.replaceAll(' ', '');
                                  },
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CommonTextField(
                                  disableBorderColor:
                                      AppColors.allTextFieldBordersColor,
                                  controller: _.password,
                                  textInputAction: TextInputAction.done,
                                  //hintText: 'Password',
                                  labelText: "Password",
                                  hintTextColor: AppColors.hintTextColor,
                                  isTextHidden: secureText,
                                  togglePassword: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r"\s\b|\b\s"))
                                  ],
                                  toggleIcon: secureText == true
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye_outlined,
                                  toggleFunction: () {
                                    secureText = !secureText;
                                    _.update();
                                  },
                                  validator: (value) {
                                    return isPasswordEmpty(value!);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.to(() => const ForgotPassword());
                                    //Get.toNamed(Routes.forgotPasswordScreen);
                                  },
                                  child: Text("Forgot Password?",
                                      textScaleFactor: 1.0,
                                      style:
                                          CommonTextStyle.font14weight50028C6),
                                ),
                              ),
                            ],
                          ).marginOnly(top: 10, bottom: 40),
                          CommonButton(
                            width: Get.width,
                            text: AppStrings.login,
                            textStyle: CommonTextStyle.font16weight600white,
                            fillColor: AppColors.allButtonsColor,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                // Form is valid, continue with further actions
                                await _.login();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CommonButton(
                            width: Get.width,
                            text: AppStrings.register,
                            textStyle: CommonTextStyle.font16weight600white,
                            fillColor: AppColors.registerButtonsColor,
                            onPressed: () async {
                              Get.toNamed(Routes.registerAsScreen);
                            },
                          ),
                        ],
                      ).marginSymmetric(horizontal: 50),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
