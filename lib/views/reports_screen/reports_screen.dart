import 'dart:io';

import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/reports/report_screen_controller.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: bodyData(context),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Reports",
          style: CommonTextStyle.font24weight500WhiteRoboto,
        ).marginOnly(left: 20),
      ),
    );
  }

  bodyData(BuildContext context) {
    return GetBuilder(
        init: ReportScreenController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              color: AppColors.blackColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------------Report title-----------------
                  Text(
                    AppStrings.reportTitle,
                    style: CommonTextStyle.font14weight500F8FAPublic,
                  ),
                  CommonTextField(
                    bordercolor: AppColors.colorE2E3E6,
                    disableBorderColor: AppColors.colorE2E3E6,
                    controller: _.reportTitle,
                    hintText: "Title Here",
                    hintTextColor: AppColors.hintTextColor,
                  ).marginOnly(top: 5),
                  //-----------------------------Subject----------------------
                  Text(
                    AppStrings.subject,
                    style: CommonTextStyle.font14weight500F8FAPublic,
                  ).marginOnly(top: 10),
                  GestureDetector(
                    onTap: () {
                      if (_.isShown.value == true) {
                        _.isShown.value = false;
                        _.update();
                      } else {
                        _.isShown.value = true;
                        _.update();
                      }
                    },
                    child: Container(
                      height: 44,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.colorE2E3E6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Subject Here",
                            style: CommonTextStyle.font14weight300White60,
                          ).marginOnly(left: 10),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.whiteTextColor,
                          ).marginOnly(right: 10),
                        ],
                      ),
                    ).marginOnly(top: 5),
                  ),
                  _.isShown.value == true
                      ? Container(
                          height: 100,
                          width: Get.width,
                        )
                      : SizedBox(),

                  // CommonTextField(
                  //   bordercolor: AppColors.colorE2E3E6,
                  //   disableBorderColor: AppColors.colorE2E3E6,
                  //   controller: _.reportTitle,
                  //   hintText: "Title Here",
                  //   hintTextColor: AppColors.hintTextColor,
                  // ).marginOnly(top: 5),

                  //--------------------------Description--------------------
                  Text(
                    AppStrings.description,
                    style: CommonTextStyle.font14weight500F8FAPublic,
                  ).marginOnly(top: 10),
                  CommonTextField(
                    maxLine: 8,
                    bordercolor: AppColors.colorE2E3E6,
                    disableBorderColor: AppColors.colorE2E3E6,
                    controller: _.reportTitle,
                    hintText: "Description Here",
                    hintTextColor: AppColors.hintTextColor,
                  ).marginOnly(top: 5),
                  //-----------------------Upload Media button----------------
                  CommonButton(
                    isIconShow: true,
                    text: AppStrings.uploadMedia,
                    textStyle: CommonTextStyle.font12weight400White,
                    onPressed: () async {
                      // await _.pickMedia();
                    },
                    fillColor: AppColors.pinBackground4040,
                    height: 40,
                    width: Get.width,
                  ).marginOnly(top: 15),
                  //-----------------------------Submit report button---------------
                  CommonButton(
                    text: AppStrings.submitReport,
                    textStyle: CommonTextStyle.font12weight400White,
                    onPressed: () {},
                    fillColor: AppColors.allButtonsColor,
                    height: 40,
                    width: Get.width,
                  ).marginOnly(top: 15),
                  //-----------------------Date and time and title section------------------

                  Container(
                    width: Get.width,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.alertCardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppStrings.dateAndTime,
                          style: CommonTextStyle.font15weight500white,
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Text(AppStrings.title,
                            style: CommonTextStyle.font15weight500white),
                      ],
                    ),
                  ).marginOnly(top: 30),
                  Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.alertCardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppStrings.dateAndTime,
                              style: CommonTextStyle.font15weight500white,
                            ),
                            Text("15 Aug '22",
                                style: CommonTextStyle.font15weight500white),
                          ],
                        ).marginOnly(left: 10),
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                          AppStrings.reportTitleHere,
                          style: CommonTextStyle.font15weight500white,
                        ),
                      ],
                    ),
                  ).marginOnly(top: 5),
                  Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.alertCardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppStrings.dateAndTime,
                              style: CommonTextStyle.font15weight500white,
                            ),
                            Text("15 Aug '22",
                                style: CommonTextStyle.font15weight500white),
                          ],
                        ).marginOnly(left: 10),
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                          AppStrings.reportTitleHere,
                          style: CommonTextStyle.font15weight500white,
                        ),
                      ],
                    ),
                  ).marginOnly(top: 5),
                  Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.alertCardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppStrings.dateAndTime,
                              style: CommonTextStyle.font15weight500white,
                            ),
                            Text("15 Aug '22",
                                style: CommonTextStyle.font15weight500white),
                          ],
                        ).marginOnly(left: 10),
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                          AppStrings.reportTitleHere,
                          style: CommonTextStyle.font15weight500white,
                        ),
                      ],
                    ),
                  ).marginOnly(top: 5),

                  Expanded(
                    child: Obx(() {
                      return ListView(
                        children: [
                          if (_.selectedImages.isNotEmpty)
                            _buildImageContainer(_.selectedImages),
                          if (_.selectedVideos.isNotEmpty)
                            _buildVideoContainer(_.selectedVideos),
                        ],
                      );
                    }),
                  ),
                ],
              ).marginSymmetric(horizontal: 40),
            ),
          );
        });
  }

  Widget _buildImageContainer(List<File> images) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: images.map((File image) {
        return Image.file(image);
      }).toList(),
    );
  }

  Widget _buildVideoContainer(List<File> videos) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(
            VideoPlayerController.file(videos[index]),
          ),
        );
      },
    );
  }
}
