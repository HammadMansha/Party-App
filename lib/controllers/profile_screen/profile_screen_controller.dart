import 'package:Pam_App/utils/libraries/app_libraries.dart';
import '../../models/chart_models.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProfileScreenController extends GetxController
    with KeysVariables, InitializeLocalStorage {
  PickedFile? imageFile;
  int sharedValue = 12;
  int surveyValue = 94;
  int reportsValue = 17;
  int total = 200;
  int sum = 0;
  String email = '';
  List<ChartData> chartData = <ChartData>[];
  TextEditingController userNameController =
      TextEditingController(text: "Muhammad Ali");
  RxBool isEditing = false.obs;
  RxString username = "".obs;

  @override
  void onInit() {
    username.value = userNameController.text;
    email = storage.read("email");
    findPercentage(sharedValue, surveyValue, reportsValue, total);
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    super.onClose();
  }

  void openDialogWithTextField() {
    Get.defaultDialog(
      radius: 2,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      backgroundColor: AppColors.alertCardColor,
      title: "Enter new username",
      titleStyle: CommonTextStyle.font14weight400White,
      content: CommonTextField(
        controller: userNameController,
        hintTextColor: AppColors.hintTextColor,
        hintText: "Enter name",
      ).marginSymmetric(horizontal: 5),
      confirm: CommonButton(
          height: 35,
          width: Get.width / 4,
          text: "Submit",
          textStyle: CommonTextStyle.font12weight400White,
          onPressed: () {
            updateUserName(userNameController);
            Get.back();
          },
          fillColor: AppColors.allButtonsColor),
      cancel: CommonButton(
          height: 35,
          width: Get.width / 4,
          text: "Cancel",
          textStyle: CommonTextStyle.font12weight400White,
          onPressed: () {
            Get.back();
          },
          fillColor: AppColors.registerButtonsColor),
    );
  }
  //-------------------------Pick image from library----------------

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    imageFile = pickedImage;
    update();
  }

  //----------------------Add values in chart------------------------

  void findPercentage(int a, int b, int c, int total) {
    sum = a + b + c;
    double sharedPer = (a / 50) * 100;
    double surveyPer = (b / 100) * 100;
    double reportsPer = (c / 50) * 100;
    double remaining = sum - total.toDouble();
    if (kDebugMode) {
      print("percentages $sharedPer $surveyPer $reportsPer");
    }

    chartData.add(
      ChartData('Category 1', sharedPer, AppColors.allButtonsColor),
    );
    chartData.add(
      ChartData('Category 2', surveyPer, AppColors.allButtonsColor),
    );
    chartData.add(
      ChartData('Category 3', reportsPer, AppColors.allButtonsColor),
    );
    chartData.add(
      ChartData(
        'Category 4',
        remaining,
        const Color(0xff56544A),
      ),
    );
  }

  //-------------------update username--------------------------
  void updateUserName(TextEditingController newName) {
    username.value = newName.text;
    update();
  }
}
