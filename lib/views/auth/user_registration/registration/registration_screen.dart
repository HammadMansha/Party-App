import 'dart:io';
import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:csc_picker/csc_picker.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget
    with KeysVariables, ValidateUserEmail {
  RegistrationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Registration",
          style: CommonTextStyle.font24weight500WhiteRoboto,
        ).marginOnly(left: 20),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: bodyData(context),
      ),
    );
  }

  Widget bodyData(context) {
    return GetBuilder(
        init: RegistrationController(),
        builder: (_) {
          return Obx(() {
            return Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                color: AppColors.blackColor,
              ),
              child: _.isLoading.value == true
                  ? const AppLoader()
                  : SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await _.pickImage();
                              },
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: AppColors.circle4a4a,
                                backgroundImage: _.imageFile != null
                                    ? FileImage(File(_.imageFile!.path))
                                    : null,
                                child: _.imageFile == null
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "Edit",
                                          style: CommonTextStyle
                                              .font14weight400White,
                                        ).marginOnly(bottom: 12),
                                      )
                                    : null,
                              ).marginOnly(bottom: 20, top: 23),
                            ),

                            //-------------------First and last name--------------
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextField(
                                    controller: _.firstName,
                                    textInputAction: TextInputAction
                                        .next, // Set the text input action to next
                                    hintText: "First Name",
                                    hintTextColor: AppColors.hintTextColor,
                                    validator: (value) {
                                      return isEmptyField(value.toString());
                                    },
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: CommonTextField(
                                    controller: _.lastName,
                                    textInputAction: TextInputAction
                                        .next, // Set the text input action to next
                                    hintText: "Last Name",
                                    hintTextColor: AppColors.hintTextColor,
                                    validator: (value) {
                                      return isEmptyField(value.toString());
                                    },
                                  ),
                                ),


                              ],
                            ),
                            CommonSpaces.spaceVertical10,

                            //-----------------Full name---------------
                            CommonTextField(
                              controller: _.fullName,
                              textInputAction: TextInputAction
                                  .next, // Set the text input action to next
                              hintText: "Full Name",
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                return isEmptyField(value.toString());
                              },
                            ),
                            CommonSpaces.spaceVertical10,
                            //-----------------Father name---------------
                            CommonTextField(
                              controller: _.fatherName,
                              textInputAction: TextInputAction
                                  .next, // Set the text input action to next
                              hintText: "Father Name",
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                return isEmptyField(value.toString());
                              },
                            ),
                            CommonSpaces.spaceVertical10,

                            //------------------CNIC-----------------

                            CommonTextField(
                              controller: _.cnic,
                              textInputAction: TextInputAction
                                  .next, // Set the text input action to next
                              hintText: "CNIC",
                              keyboardType: TextInputType.number,
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                return isCNICComplete(value.toString());
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(15),
                                FilteringTextInputFormatter.digitsOnly,
                                CNICFormatter(),
                              ],
                              onChanged: (value) {},
                            ),
                            CommonSpaces.spaceVertical10,

                            //---------------Country----------------
                            CSCPicker(
                              layout: Layout.horizontal,
                              flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                              dropdownDialogRadius: 0.0,
                              dropdownDecoration: BoxDecoration(
                                color: AppColors.blackColor,
                                border: Border.all(
                                    color: AppColors.allTextFieldBordersColor),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              disabledDropdownDecoration: BoxDecoration(
                                color: AppColors.blackColor,
                                border: Border.all(
                                    color: AppColors.allTextFieldBordersColor),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              selectedItemStyle:
                                  CommonTextStyle.font14weight400White,
                              onCountryChanged: (value) {
                                _.countryValue = value;
                                _.update();
                                print(
                                    "Hellooooooooooooo------${_.countryValue}");
                              },
                              onStateChanged: (value) {
                                _.stateValue = value;
                              },
                              onCityChanged: (value) {
                                _.cityValue = value;
                              },
                            ),
                            CommonSpaces.spaceVertical10,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CommonTextField(
                                    bordercolor: AppColors.allButtonsColor,
                                    textInputAction: TextInputAction
                                        .next, // Set the text input action to next
                                    controller: _.district,
                                    hintText: "District",
                                    hintTextColor: AppColors.hintTextColor,
                                    validator: (value) {
                                      return isEmptyField(value.toString());
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: CommonTextField(
                                    controller: _.division,
                                    textInputAction: TextInputAction
                                        .next, // Set the text input action to next
                                    hintText: "Division",
                                    hintTextColor: AppColors.hintTextColor,
                                    validator: (value) {
                                      return isEmptyField(value.toString());
                                    },
                                  ),
                                ),
                              ],
                            ),
                            CommonSpaces.spaceVertical10,

                            //----------------UC--------------------
                            CommonTextField(
                              controller: _.uc,
                              textInputAction: TextInputAction
                                  .next, // Set the text input action to next
                              hintText: "UC",
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                return isEmptyField(value.toString());
                              },
                            ),
                            CommonSpaces.spaceVertical10,

                            //---------------------Postal Address-----------
                            CommonTextField(
                              controller: _.postalAddress,
                              textInputAction: TextInputAction
                                  .next, // Set the text input action to next
                              hintText: "Postal Address",
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                return isEmptyField(value.toString());
                              },
                            ),
                            CommonSpaces.spaceVertical10,
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: CommonTextField(
                                    readOnly: true,
                                    controller: _.countryCode,
                                    textInputAction: TextInputAction
                                        .next, // Set the text input action to next
                                    hintText: "+92",
                                    keyboardType: TextInputType.number,
                                    hintTextColor: AppColors.whiteTextColor,
                                    validator: (value) {
                                      print(
                                          "validator value -----${GlobalVariables.isPhoneComplete}");

                                      if (GlobalVariables.isPhoneComplete ==
                                          false) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: CommonTextField(
                                    controller: _.phoneNumber,
                                    textInputAction: TextInputAction
                                        .next, // Set the text input action to next
                                    hintText: "Phone Number",
                                    keyboardType: TextInputType.number,
                                    hintTextColor: AppColors.hintTextColor,
                                    validator: (value) {
                                      return isPhoneComplete(value.toString());
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(
                                          10), // Limit the input length to the country code length
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      // if (value.isNotEmpty && value[0] == "0") {
                                      //   value = value.substring(1); // Remove the first character
                                      // }
                                      //
                                      //
                                      // print("value----------${value[0]}");

                                      _.phoneNumber.addListener(() {
                                        if (_.phoneNumber.text.isNotEmpty &&
                                            _.phoneNumber.text[0] == '0') {
                                          _.phoneNumber.text =
                                              _.phoneNumber.text.substring(1);
                                          _.phoneNumber.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: _.phoneNumber.text
                                                          .length));
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            CommonSpaces.spaceVertical10,
                            CommonTextField(
                              controller: _.email,
                              textInputAction: TextInputAction
                                  .next, // Set the text input action to next
                              hintText: "Email",
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'This field is required';
                                } else if (!isValidEmail(value.toString())) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            CommonSpaces.spaceVertical10,
                            CommonTextField(
                              isTextHidden: secureText,
                              togglePassword: true,
                              controller: _.password,
                              textInputAction: TextInputAction
                                  .done, // Set the text input action to next
                              hintText: "Password",
                              hintTextColor: AppColors.hintTextColor,
                              validator: (value) {
                                return isPasswordComplete(value.toString());
                              },
                              toggleIcon: secureText == true
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              toggleFunction: () {
                                secureText = !secureText;
                                _.update();
                              },
                            ),
                            CommonButton(
                              width: Get.width,
                              text: AppStrings.register,
                              textStyle: CommonTextStyle.font16weight600white,
                              fillColor: AppColors.allButtonsColor,
                              onPressed: () async {
                                print("value of country ${_.countryValue}");
                                print("value of state ${_.stateValue}");
                                print("value of city ${_.cityValue}");

                                if (formKey.currentState!.validate()) {
                                  // Form is valid, continue with further actions
                                  await _.registerNewUser();
                                }
                              },
                            ).marginOnly(top: 27, bottom: 33),
                          ],
                        ).marginOnly(left: 40, right: 40),
                      ),
                    ),
            );
          });
        });
  }
}
