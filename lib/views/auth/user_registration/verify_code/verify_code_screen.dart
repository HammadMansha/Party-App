import 'package:Pam_App/utils/libraries/app_libraries.dart';



// ignore: must_be_immutable
class VerifyOtpScreen extends StatelessWidget with KeysVariables {
  VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(onTap: ()=>Get.back(),child: const Icon(Icons.arrow_back)),
        title: const Text("Verification"),
        centerTitle: true,
      ),
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder(
        init: VerifyOtpController(),
        builder: (_) {
          return Container(
            color: AppColors.blackColor,
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      AppStrings.enterSixDigit,
                      style: CommonTextStyle.font24weight6004EA9,
                      textAlign: TextAlign.center,
                    ).marginOnly(top: Get.height / 3.5, left: 49, right: 49),
                  ),
                  Center(
                    child: Text(
                      AppStrings.enterSixDigitContent,
                      style: CommonTextStyle.font12weight400F4F4,
                      textAlign: TextAlign.center,
                    ).marginOnly(top: 20, left: 49, right: 29, bottom: 32),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Wrap(
                        spacing: 0.0,
                        runSpacing: 8.0,
                        children: [
                          PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: CommonTextStyle.font24weight400FAFA,
                            length: 6,
                            animationType: AnimationType.fade,
                            textStyle: CommonTextStyle.font24weight400FAFA,
                            // ignore: body_might_complete_normally_nullable
                            validator: (v) {
                              // if (v!.length < 3) {
                              //   return "I'm from validator";
                              // } else {
                              //   return null;
                              // }
                              if(_.pinCode.text.isEmpty){
                                return 'Enter pin';
                              }
                              else{
                                return null;
                              }
                            },
                            pinTheme: PinTheme(

                              selectedFillColor: AppColors.pinBackground4040,
                              selectedColor: AppColors.pinBackground4040,
                              borderWidth: 2,
                              disabledColor: AppColors.pinBackground4040,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(4),
                              fieldHeight: 44,
                              fieldWidth: 40,
                              inactiveColor: AppColors.pinBackground4040,
                              inactiveFillColor: AppColors.pinBackground4040,
                              activeColor: AppColors.pinBackground4040,
                              activeFillColor: AppColors.pinBackground4040,
                            ),
                            cursorColor: Colors.white,
                            animationDuration: const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: _.errorController,
                            controller: _.pinCode,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {},
                            onChanged: (value) {
                              _.isEmpty.value=false;
                              _.update();
                            },
                            beforeTextPaste: (text) {
                              return true;
                            },
                          ),
                        ]),
                  ).marginSymmetric(horizontal:45),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Resend Code in ",
                        style: CommonTextStyle.font14weight500FAFA,
                      ),
                      Obx(() {
                          return Text(
                            "${_.secondsRemaining}:00",
                            style: CommonTextStyle.font14weight5003783,
                          );
                        }
                      ),
                    ],
                  ),
                  Obx(
                    () => CommonButton(
                      width: Get.width,
                      text: AppStrings.submit,
                      textStyle: CommonTextStyle.font16weight600white,

                      fillColor: _.isEmpty.value == true
                          ? AppColors.disableButtonColor
                          : AppColors.allButtonsColor,
                      onPressed: () async {
                        if (_.isEmpty.value == false) {
                          Get.toNamed(Routes.registerSuccess);
                        }
                      },
                    ).marginOnly(left: 50, right: 50, top: Get.height / 4),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
