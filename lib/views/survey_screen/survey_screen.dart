import 'package:Pam_App/utils/libraries/app_libraries.dart';


class SurveyScreen extends StatelessWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Surveys",
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
    return GetBuilder(
      init: SurveyScreenController(),
      builder: (_) {
        return SizedBox(
          height: Get.height / 1.25,
          width: Get.width,
          child: Scrollbar(
           controller: _.scrollController,
            thumbVisibility: true,
            child: ListView.separated(
              controller: _.scrollController,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: Get.height / 3.55,
                  //height: 202,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: AppColors.allTextFieldBordersColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _.surveyName[index],
                        style: CommonTextStyle.font20weight700F8FAPublic,
                      ).marginOnly(top: 16, bottom: 8),
                      Text(
                        _.surveyDescription[index],
                        style: CommonTextStyle.font16weight4008BA4Public,
                      ).marginOnly(bottom: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppColors.allTextFieldBordersColor,
                          ),
                          Text(
                            "${_.days[index]} days",
                            style: CommonTextStyle.font12weight400White,
                          ).marginOnly(left: 5, right: 12),
                          const Icon(
                            Icons.person,
                            size: 14,
                            color: AppColors.allTextFieldBordersColor,
                          ),
                          Text(
                            "${_.people[index]} People",
                            style: CommonTextStyle.font12weight400White,
                          ).marginOnly(left: 5),
                        ],
                      ),
                      const Spacer(),
                      CommonButton(
                              width: Get.width,
                              text: AppStrings.fillSurvey,
                              textStyle: CommonTextStyle.font16weight500White,
                              onPressed: () {
                                Get.toNamed(Routes.fillSurveyScreen);

                              },
                              fillColor: AppColors.allButtonsColor).marginOnly(bottom: 16),
                    ],
                  ).marginSymmetric(horizontal: 16),
                );
              },
            ).marginOnly(left: 27, right: 22, top: 30),
          ),
        );
      },
    );
  }
}
