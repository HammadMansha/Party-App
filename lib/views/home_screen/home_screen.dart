import 'package:Pam_App/utils/libraries/app_libraries.dart';

class HomeScreen extends StatelessWidget with CommonFunctions {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Alert",
          style: CommonTextStyle.font24weight500WhiteRoboto,
        ).marginOnly(left: 20),
      ),
      body: SafeArea(
        child: bodyData(context),
      ),
      backgroundColor: AppColors.blackColor,
    );
  }

  Widget bodyData(context) {
    // HomeScreenController controller = Get.find<HomeScreenController>();
    return GetBuilder(
        init: HomeScreenController(),
        builder: (controller) {
          return Obx(() {
            return controller.isLoading.value == true
                ? const AppLoader()
                : RefreshIndicator(
                    onRefresh: () => controller.getAllAlertJobs(),
                    child: SizedBox(
                      height: Get.height / 1.25,
                      width: Get.width,
                      child: ScrollConfiguration(
                        behavior: CustomScrollBehavior(),
                        child: ListView.separated(
                          itemCount: controller.alertJobs.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return CommonCard(
                              height: Get.height / 2.7,
                              imgUrl:
                                  "${ApiData.thumbnailBaseUrl}${controller.alertJobs[index]["thumbnailPath"]}",
                              title: controller.alertJobs[index]["programName"],
                              des: controller.alertJobs[index]["shared"]["sharedData"]["title"],
                              source: controller.alertJobs[index]["source"],
                              date:
                                  "${controller.alertJobs[index]["broadcastDate"].toString().split("-").last.split("T").first}${convertIntoMonthName(controller.alertJobs[index]["broadcastDate"].toString().split("-")[1])}",
                              time: controller.alertJobs[index]["programTime"],
                              onPressed: () {
                                Get.toNamed(Routes.playerScreen, arguments: {
                                  "jobId": controller.alertJobs[index]["id"],
                                });
                              },
                            );
                          },
                        ).marginOnly(left: 27, right: 22, top: 10),
                      ),
                    ),
                  );
          });
        });
  }
}
