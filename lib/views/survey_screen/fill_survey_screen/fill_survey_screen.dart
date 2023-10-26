import 'package:Pam_App/utils/libraries/app_libraries.dart';

class FillSurveyScreen extends StatelessWidget {
  const FillSurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Survey",
          style: CommonTextStyle.font24weight500WhiteRoboto,
        ).marginOnly(left: 20),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: SafeArea(
        child: bodyData(context),
      ),
      backgroundColor: AppColors.blackColor,
    );
  }

  bodyData(BuildContext context) {
    return GetBuilder(
        init: FillSurveyFormController(),
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: Get.height,
              width: Get.width,
              color: AppColors.blackColor,
              child: Scrollbar(
                controller: _.scrollController,
                thumbVisibility: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Political Affiliations",
                      style: CommonTextStyle.font16weight700F8FAPublic,
                    ).marginSymmetric(vertical: 18),
                    Expanded(
                      child: ListView.separated(
                        itemCount: _.questions.length,
                        controller: _.scrollController,

                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _.questions[index],
                                style: CommonTextStyle.font16weight300White,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_.previousIndex == 0 &&
                                      _.clickIndex == 0 &&
                                      index == 0) {
                                    _.previousIndex = 0;
                                    _.clickIndex = 0;
                                    _.update();
                                  } else {
                                    _.previousIndex = _.clickIndex;
                                    _.clickIndex = index;
                                    _.update();
                                  }

                                  if (_.isShowDropdown) {
                                    if (_.clickIndex == index &&
                                        _.previousIndex == _.clickIndex) {
                                      _.isShowDropdown = false;
                                      _.update();
                                    } else {
                                      _.isShowDropdown = true;
                                      _.update();
                                    }
                                  } else {
                                    _.isShowDropdown = true;
                                    _.update();
                                  }
                                },
                                child: Container(
                                  height: 48,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors
                                            .allTextFieldBordersColor),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Select",
                                        style: CommonTextStyle
                                            .font14weight300White60,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: AppColors
                                            .allTextFieldBordersColor,
                                      ),
                                    ],
                                  ).marginOnly(left: 12, right: 21),
                                ).marginOnly(top: 12),
                              ),
                              _.clickIndex == index &&
                                      _.isShowDropdown == true
                                  ? showOptionContainer(context, _)
                                  : const SizedBox(),
                            ],
                          );
                        },
                      ),
                    ),
                    CommonButton(
                            width: Get.width,
                            text: AppStrings.submit,
                            textStyle: CommonTextStyle.font16weight500White,
                            onPressed: () {
                              Get.back();
                            },
                            fillColor: AppColors.allButtonsColor)
                        .marginOnly(bottom: 16, top: 10, left: 16, right: 16),
                  ],
                ).marginSymmetric(horizontal: 34),
              ),
            ),
          );
        });
  }
}

Widget showOptionContainer(BuildContext context, FillSurveyFormController _) {
  return Container(
    height: Get.height / 2.5,
    width: Get.width,
    color: AppColors.color3030,
    child: Column(
      children: [
        Text(
          "Select Age",
          style: CommonTextStyle.font15weight500white,
        ).marginOnly(top: 8),
        Expanded(
          child: SizedBox(
            width: Get.width / 1.2,
            child: Scrollbar(
              controller: _.scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: _.scrollController,
                itemCount: _.answers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        _.answers[index],
                        style: CommonTextStyle.font15weight500white,
                      ),
                      const Spacer(),
                      Wrap(
                        children: [
                          Radio(
                            activeColor: Colors.white,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: _.answers[index],
                            groupValue: _.selectedValue,
                            onChanged: (value) {
                              _.selectedValue = value.toString();
                              _.update();
                              if (kDebugMode) {
                                print(
                                    "value of selected radio ${_.selectedValue}");
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ).marginOnly(left: 30, right: 20, bottom: 10),
        ),
        CommonButton(
                height: 40,
                width: Get.width,
                text: AppStrings.save,
                textStyle: CommonTextStyle.font16weight500White,
                onPressed: () {
                  _.isShowDropdown = false;
                  _.update();
                },
                fillColor: AppColors.allButtonsColor)
            .marginOnly(bottom: 16, right: 50, left: 50),
      ],
    ),
  );
}
