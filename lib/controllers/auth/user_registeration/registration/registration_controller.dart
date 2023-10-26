import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:csc_picker/csc_picker.dart';

import 'package:http/http.dart' as http;

class RegistrationController extends GetxController
    with InitializeLocalStorage, KeysVariables {
  //------------------Text fields variables--------------------
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController postalAddress = TextEditingController();
  TextEditingController uc = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController division = TextEditingController();
  TextEditingController countryCode = TextEditingController(text: "+92");
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();

  PickedFile? imageFile;
  late TextSelection selection;

  //-------------------------------------country state city picker----------------
  var countryValue;
  var stateValue;
  var cityValue;
  GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();

  //----------------Show loader variables---------------
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    GlobalVariables.role = storage.read("role");
    print("roleee is ${GlobalVariables.role}");

    // TODO: implement onInit
    super.onInit();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    imageFile = pickedImage;
    update();
  }

  //--------------------------Register new user------------------

  Future<void> registerNewUser() async {
    if (imageFile == null) {
      CustomSnackBar.showSnackBar(
          title: AppStrings.warningTitle,
          message: AppStrings.profilePicIsNecessary,
          backgroundColor: AppColors.allButtonsColor,
          isWarning: true);
    } else {
      if (countryValue == null || stateValue == null || cityValue == null) {
        CustomSnackBar.showSnackBar(
            title: AppStrings.warningTitle,
            message: AppStrings.pleaseSelectCountry,
            isWarning: true);
      } else {
        try {
          isLoading.value = true;
          update();
          var url = Uri.parse('${ApiData.baseUrl}${ApiData.registerUser}');
          var request = http.MultipartRequest('POST', url);
          // Add the image file to the request
          var image = await http.MultipartFile.fromPath(
              'photoPath', imageFile!.path.toString());
          request.files.add(image);
          // Add other body parameters
          request.fields['role'] = GlobalVariables.role;
          request.fields['firstName'] = firstName.text;
          request.fields['lastName'] = lastName.text;
          request.fields['fullName'] = fullName.text;
          request.fields['state'] = stateValue.toString();
          request.fields['party'] = "PPP";
          request.fields['country'] = countryValue.toString();
          request.fields['fatherName'] = fatherName.text;
          request.fields['cnic'] = cnic.text;
          request.fields['email'] = email.text;
          request.fields['password'] = password.text;
          request.fields['phoneNumber'] = countryCode.text + phoneNumber.text;
          request.fields['postalAddress'] = postalAddress.text;
          request.fields['uc'] = uc.text;
          request.fields['city'] = cityValue.toString();
          request.fields['district'] = district.text;
          request.fields['division'] = division.text;

          // Send the request
          var response = await request.send();

          if (response.statusCode == 201 || response.statusCode == 200) {
            // API call was successful
            var responseData = await response.stream.toBytes();
            var responseString = String.fromCharCodes(responseData);
            // Process the response data
            if (kDebugMode) {
              print("Register API response $responseString");
            }
            CustomSnackBar.showSnackBar(
                message: AppStrings.successTitle,
                title: AppStrings.registeredSuccessfully,
                backgroundColor: AppColors.allButtonsColor,
                isWarning: false);

            Get.offAll(() => LoginScreen());
            isLoading.value = false;
            update();
          } else {
            // API call failed
            if (kDebugMode) {
              print('API call failed with status code: ${response.statusCode}');
            }
            if (response.statusCode == 500) {
              CustomSnackBar.showSnackBar(
                  title: AppStrings.warningTitle,
                  message: AppStrings.userAlreadyExist);
            }
            isLoading.value = false;
            update();
          }
        } catch (e) {
          print(e);
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
  }
}
