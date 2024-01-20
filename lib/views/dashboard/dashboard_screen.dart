import 'dart:io';
import 'package:Pam_App/utils/libraries/app_libraries.dart';




class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardScreenController(),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (_.navigationQueue.isEmpty) {
              return showWillPopMessage(context);
            }
            _.navigationQueue.removeLast();
            int position =
                _.navigationQueue.isEmpty ? 0 : _.navigationQueue.last;
            _.currentIndex = position;
            _.update();
            return false;
          },
          child: Scaffold(
            body: getBody(_),
            bottomNavigationBar: bottomNavbar(_),
          ),
        );
      },
    );
  }

  showWillPopMessage(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.color292c,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: const Text(
            'Exit App?',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 0.4,
              fontFamily: 'Roboto',
            ),
          ),
          content: SizedBox(
            height: 100.0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure you want to exit App?',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 0.4,
                      fontFamily: 'Roboto'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      onPressed: () async {
                        Get.back();
                      },
                      minWidth: Get.width / 3.5,
                      height: 48,
                      child: const Text(
                        "Cancel",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: AppColors.allButtonsColor, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(
                          color: AppColors.allButtonsColor,
                        ),
                      ),
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          exit(0);
                        } else {
                          exit(0);
                        }
                      },
                      minWidth: Get.width / 3.4,
                      height: 40,
                      color: AppColors.allButtonsColor,
                      child: const Text(
                        "Exit",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: AppColors.whiteTextColor, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bottomNavbar(DashboardScreenController _) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.alert),
            size: 18.0,
          ),
          label: 'Alerts',
          backgroundColor: AppColors.bottomColor1b19,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.survey),
            size: 18.0,
          ),
          label: 'Survey',
          backgroundColor: AppColors.bottomColor1b19,
        ),
        BottomNavigationBarItem(
          icon:  ImageIcon(
            AssetImage(AppAssets.reports),
            size: 18.0,
          ),
          label: 'Reports',
          backgroundColor:AppColors.bottomColor1b19,
        ),
        BottomNavigationBarItem(
          icon:  ImageIcon(
            AssetImage(AppAssets.profile),
            size: 18.0,
          ),
          label: 'Profile',
          backgroundColor:AppColors.bottomColor1b19,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
          backgroundColor: AppColors.bottomColor1b19,
        ),
      ],
      currentIndex: _.currentIndex,
      selectedItemColor: AppColors.selectedBottomColor24A4,
      selectedFontSize: 12.0,
      backgroundColor: AppColors.bottomColor1b19,
      unselectedItemColor: const Color(0xffD3D3D3),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _.changeTabIndex,
    );
  }

  Widget getBody(DashboardScreenController _) {
    List<Widget> pages = [
      const HomeScreen(),
      const SurveyScreen(),
      const ReportsScreen(),
       ProfileScreen(),
    ];
    return IndexedStack(
      index: _.currentIndex,
      children: pages,
    );
  }
}
