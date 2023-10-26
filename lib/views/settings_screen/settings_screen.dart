import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget
    with InitializeLocalStorage, KeysVariables {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: const Text(
          "Settings",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              letterSpacing: 0.7),
        ).marginOnly(left: 20.0, top: 10),
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      // bottomNavigationBar: GlobalBottomNav(),
      body: bodyData(context),
    );
  }

  void moveToAlertScreen(BuildContext context) {
    Get.offAll(const DashboardScreen());
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder(
        init: SettingScreenController(),
        builder: (_) {
          HomeScreenController controller=Get.find<HomeScreenController>();
          return Container(
              width: Get.width,
              height: Get.height,
              color: AppColors.blackColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.right,
                        color: Colors.black,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return ListView(shrinkWrap: true, children: [
                                // options(
                                //   text: 'Language',
                                //   subTitle:
                                //       'You can see which notifications to receive',
                                //   imagename: AppAssets.logout,
                                //   onTap: () {
                                //     Get.toNamed(Routes.languageScreen);
                                //   },
                                // ),

                                // options(
                                //   text: 'Select Preferences by Topic',
                                //   subTitle:
                                //       'You can add new Topics to your list',
                                //   imagename: 'assets/images/pref.png',
                                //   onTap: () {
                                //     Get.to(() => SelectKeyWords());
                                //   },
                                // ),

                                // options(
                                //   text: 'Select Preferences by Keywords',
                                //   subTitle:
                                //       'You can add new Keywords to your list',
                                //   imagename: 'assets/images/setting.png',
                                //   onTap: () {
                                //     Get.to(() => SelectKeyWords());
                                //   },
                                // ),

                                // options(
                                //   text: 'Select Subscription',
                                //   subTitle:
                                //       'You can add new Keywords to your list',
                                //   imagename: 'assets/images/setting.png',
                                //   onTap: () {
                                //     Get.to(() => SelectSubscriptionScreen());
                                //   },
                                // ),

                                // options(
                                //   text: 'Change Subscription',
                                //   subTitle:
                                //       // options(
                                //       //   text: 'Change Subscription',
                                //       //   subTitle:
                                //       'Request a change in your subscriptions and choose a new one',
                                //   imagename: 'assets/images/email_setting.png',
                                //   onTap: () {
                                //     Get.to(() => SelectSubscriptionScreen());
                                //   },
                                // ),
                                options(
                                  text: 'Logout',
                                  subTitle: "",
                                  imagename: AppAssets.logout,
                                  onTap: () {
                                    storage.remove("role");
                                    storage.remove("isAppOpen");
                                    storage.remove("accessToken");
                                    controller.sseSubscription.cancel();
                                    Get.offAll(()=>LoginScreen());
                                  },
                                ),
                              ]);
                            }),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_.isShow == true) {}
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppStrings.version,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontSize: 11.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ).marginOnly(bottom: 5.0),
                        // Icon(
                        //   Icons.info_outline_rounded,
                        //   color: Colors.white,
                        //   size: 15,
                        // ).marginOnly(bottom: 8, left: 3),
                      ],
                    ),
                  )
                ],
              ));
        });
  }

  Widget options(
      {String? text, String? subTitle, String? imagename, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: const Color(0xff48beeb),
      hoverColor: const Color(0xff48beeb),
      focusColor: const Color(0xff48beeb),
      child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.0,
                width: 60.0,
                child: Image.asset(
                  imagename!,
                  height: 24,
                  width: 24,
                ),
              ).marginOnly(left: 20.0),
              const SizedBox(
                width: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width / 1.4,
                    child: Text(
                      text!,
                      // textScaleFactor: 1.0,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  subTitle == ''
                      ? const SizedBox()
                      : const SizedBox(
                          height: 5.0,
                        ),
                  subTitle == ''
                      ? const SizedBox()
                      : SizedBox(
                          width: Get.width / 1.4,
                          child: LocaleText(
                            subTitle!,
                            // textScaleFactor: 1.0,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                ],
              )
            ],
          )),
    ).marginOnly(bottom: 30.0);
  }
}
