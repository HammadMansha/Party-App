import 'dart:io';
import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/chart_models.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget with KeysVariables {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: bodyData(context),
    );
  }

  bodyData(BuildContext context) {
    return GetBuilder(
        init: ProfileScreenController(),
        builder: (_) {
          return SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.profileScreen,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await _.pickImage();
                          },
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: AppColors.circle4a4a,
                            backgroundImage: _.imageFile != null
                                ? FileImage(File(_.imageFile!.path))
                                : null,
                            child: _.imageFile == null
                                ? Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Edit",
                                      style:
                                          CommonTextStyle.font14weight400White,
                                    ).marginOnly(bottom: 12),
                                  )
                                : null,
                          ).marginOnly(left: 25),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                              _.username.value,
                              style: CommonTextStyle.font22weight700BlackPublic,
                            )),
                            Text(
                              "Regional Manager",
                              style: CommonTextStyle.font14weight400BlackPublic,
                            ).marginOnly(left: 2),
                            Text(
                              _.email,
                              style: CommonTextStyle.font14weight400BlackPublic,
                            ).marginOnly(left: 2),
                          ],
                        ).marginOnly(top: 10),
                        GestureDetector(
                          onTap: () async {
                            _.openDialogWithTextField();
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 17,
                          ).marginOnly(right: 30, top: 20),
                        ),
                      ],
                    ).marginOnly(top: 10),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: Get.height / 4,
                      width: Get.width / 1.3,
                      decoration: BoxDecoration(
                        color: AppColors.alertCardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.color3A38),
                                  child: Image.asset(AppAssets.sharedIcon),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  _.sharedValue.toString(),
                                  style: CommonTextStyle.font16weight300White,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAssets.orangeDot),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "Shared",
                                      style:
                                          CommonTextStyle.font14weight400White,
                                      maxLines: 2,
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.color3A38),
                                  child: Image.asset(AppAssets.surveyIcon),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  _.surveyValue.toString(),
                                  style: CommonTextStyle.font16weight300White,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAssets.blueDot),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "Survey",
                                      style:
                                          CommonTextStyle.font14weight400White,
                                      maxLines: 2,
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.color3A38),
                                  child: Image.asset(AppAssets.reportsIcon),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  _.reportsValue.toString(),
                                  style: CommonTextStyle.font16weight300White,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAssets.greenDot),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "Reports",
                                      style:
                                          CommonTextStyle.font14weight400White,
                                      maxLines: 2,
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ).marginOnly(left: 15, right: 15),
                    ).marginOnly(top: 30),
                    const SizedBox(
                      height: 33,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 200, // Adjust the height as needed
                      child: SfCircularChart(
                        series: <CircularSeries>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: _.chartData,
                            xValueMapper: (ChartData data, _) => data.category,
                            yValueMapper: (ChartData data, _) =>
                                data.percentage,
                            pointColorMapper: (ChartData data, _) => data.color,
                            radius: '100%', // Adjust the radius as needed
                            innerRadius:
                                '70%', // Adjust the inner radius as needed
                          ), //                      ),
                        ],
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                            widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _.sum.toString(),
                                  style: CommonTextStyle.font42weight500White,
                                ),
                                Text('of 200 points',
                                    style:
                                        CommonTextStyle.font14weight400White),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
