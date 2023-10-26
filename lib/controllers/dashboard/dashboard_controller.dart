import 'dart:collection';
import 'package:Pam_App/utils/libraries/app_libraries.dart';


class DashboardScreenController extends GetxController with KeysVariables,InitializeLocalStorage {
  ListQueue<int> navigationQueue = ListQueue();
  int currentIndex = 0;
  late Map<Permission, PermissionStatus> statuses;

  @override
  void onInit() {
    requestPermissions();

    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() async{
    // TODO: implement onReady

    super.onReady();
  }

  //-----------------All permissions request---------------
  void requestPermissions() async {
    statuses = await [
      Permission.location,
      Permission.camera,
      Permission.storage,
    ].request();

    statuses.forEach((permission, status) {
      if (status.isDenied) {
        openSettings();
      }
    });
    // Process the permission statuses
    // ...
  }

  //------------------------Open Application permission setting screen--------------------
  void openSettings() async {
    await openAppSettings().then((value) => onSettingsScreenClosed());
  }

//-------------------When user close the app setting page------------
  void onSettingsScreenClosed() {
    // This function will be called when the user comes back from the settings screen
    // Implement your desired logic here
  }

//-----------------------Change bottom nav bar index----------------------
  void changeTabIndex(int index) {
    currentIndex = index;

    if (index == currentIndex) {
      navigationQueue.clear();
      // navigationQueue.removeWhere((element) => element == index);
      navigationQueue.addLast(index);
      currentIndex = index;
      update();
    }
    update();
  }
}
