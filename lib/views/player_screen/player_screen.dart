import 'package:Pam_App/utils/libraries/app_libraries.dart';

class PlayerScreen extends StatelessWidget with CommonFunctions {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: bodyData(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            // _.betterPlayerController.dispose();
            Get.back();
            // Get.off(() => Dashboard());
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
          ),
        ),
      ),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<PlayerScreenController>(
        init: PlayerScreenController(),
        builder: (_) {
          return Obx(() {
            return Container(
              height: Get.height,
              width: Get.width,
              color: AppColors.alertCardColor,
              child: _.isLoading.value == true
                  ? const AppLoader()
                  : Column(
                      children: [
                        SizedBox(
                          height: Get.height / 3.1,
                          width: Get.width,
                          child: _.source == "TV" || _.source == "Online"
                              ? BetterPlayer(
                                  controller: _.betterPlayerController,
                                )
                              : Image.network(
                                  "${ApiData.thumbnailBaseUrl}${_.singleJobData["thumbnailPath"]}",
                                  fit: BoxFit.contain,
                                ).marginOnly(top: 30),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.details,
                                    style: CommonTextStyle.font15weight700D9D9,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          width: Get.width,
                                          child: Text(
                                            _.singleJobData["programName"],
                                            style: CommonTextStyle
                                                .font18weight700white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: _.source == "TV"
                                                  ? AppColors
                                                      .alertVideoContainer
                                                  : AppColors
                                                      .selectedBottomColor24A4),
                                        ),
                                        height: 15,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            _.source,
                                            style: _.source == "TV"
                                                ? CommonTextStyle
                                                    .font8weight500FD8894
                                                : CommonTextStyle
                                                    .font8weight500242A,
                                          ),
                                        ),
                                      ).marginOnly(left: 10),
                                    ],
                                  ).marginOnly(top: 20),
                                  //---------------------Date and time row-----------
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 8,
                                        color: Colors.white,
                                      ).marginOnly(bottom: 2),
                                      Text("${_.singleJobData["broadcastDate"].toString().split("-").last.split("T").first}${ convertIntoMonthName(_.singleJobData["broadcastDate"].toString().split("-")[1])} ",
                                        style:
                                            CommonTextStyle.font9weight400White,
                                      ),
                                      Image.asset(AppAssets.dot),
                                      Text(" ${_.singleJobData["programTime"].toString()}",
                                          style: CommonTextStyle
                                              .font9weight400White),
                                      const Spacer(),
                                      //-------------Code for sharing icons----------------
                                      // SizedBox(
                                      //   height: 12,
                                      //   width: 12,
                                      //   child: Image.asset(
                                      //     AppAssets.twitter,
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 5,
                                      // ),
                                      // SizedBox(
                                      //   height: 12,
                                      //   width: 12,
                                      //   child: Image.asset(
                                      //     AppAssets.whatsapp,
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 5,
                                      // ),
                                      // SizedBox(
                                      //   height: 12,
                                      //   width: 12,
                                      //   child: Image.asset(
                                      //     AppAssets.youtube,
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 5,
                                      // ),
                                      // SizedBox(
                                      //   height: 12,
                                      //   width: 12,
                                      //   child: Image.asset(
                                      //     AppAssets.facebook,
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 31,
                                      // ),
                                      // Column(
                                      //   children: [
                                      //     SizedBox(
                                      //       height: 15,
                                      //       width: 16,
                                      //       child: Image.asset(
                                      //         AppAssets.share,
                                      //         fit: BoxFit.fill,
                                      //       ),
                                      //     ),
                                      //     const Text(
                                      //       "Share",
                                      //       style: TextStyle(
                                      //         fontWeight: FontWeight.w400,
                                      //         fontSize: 9,
                                      //         color: Color(0xff22b161),
                                      //       ),
                                      //     ),
                                      //
                                      //
                                      //   ],
                                      // ),
                                    ],
                                  ).marginOnly(top: 8, bottom: 25),
                                  //-------------------Transcription section--------------
                                  Text(
                                    _.singleJobData["shared"]["sharedData"]
                                        ["comments"],
                                    style:
                                        CommonTextStyle.font10weight400White70,
                                  ).marginOnly(right: 13, bottom: 10),
                                ],
                              ).marginOnly(left: 30, right: 13, top: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          });
        });
  }
}
