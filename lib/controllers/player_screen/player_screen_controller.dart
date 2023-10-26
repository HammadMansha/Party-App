import 'dart:math';

import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:http/http.dart' as http;

class PlayerScreenController extends GetxController
    with InitializeLocalStorage {
  String videoPath =
      "https://backend.lytics.systems/uploads/jobs/mediaJobs/2023/05/31/files-1685491779928-d682a2a6-11e3-4a4b-9823-175299f11a8e.mp4";
  late BetterPlayerController betterPlayerController;

  String source = '';
  String jobId = '';
  RxBool isLoading = false.obs;
  Map singleJobData = {};
  String token = '';
  @override
  void onInit() async {
    isLoading.value = true;
    // TODO: implement onInit
    if (Get.arguments != null) {
      jobId = Get.arguments["jobId"];
    }
    token = await storage.read("accessToken");

    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getSingleJob();
    print("value of video path -----------------$videoPath");

    betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        expandToFill: true,
        //aspectRatio:4/3,
        looping: false,
        autoDispose: true,
        autoPlay: true,
        //startAt: startAt,
        // eventListener: (BetterPlayerEvent e) => eveB(e),
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableAudioTracks: false,
          enablePip: false,
          enableOverflowMenu: false,
          enablePlayPause: false,
          // enableProgressText: d.isEmpty || d == {} ? true : false,
          // enableProgressBar: d.isEmpty || d == {} ? true : false,
          enableProgressText: true,
          enableProgressBar: true,
          enableFullscreen: true,
          forwardSkipTimeInMilliseconds: 10000,
          backwardSkipTimeInMilliseconds: 10000,
          progressBarPlayedColor: Colors.orange,
          progressBarBufferedColor: Color(0xff676767),
          progressBarBackgroundColor: Color(0xff676767),
        ),
        fit: BoxFit.cover,
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        videoPath,
      ),
    );

    super.onReady();
  }

  @override
  void onClose() {
    betterPlayerController.dispose();

    Get.delete<PlayerScreenController>();
    super.onClose();
  }

  //-----------------------------------Get single job API call----------------------------

  Future<void> getSingleJob() async {
    try {
      isLoading.value = true;
      update();
      final url = '${ApiData.baseUrl}${ApiData.alertJobs}/$jobId';
      var res = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          "Content-type": 'application/json',
        },
      );
      if (kDebugMode) {
        print(url);
      }
      var data = json.decode(res.body);
      if (res.statusCode == 200) {
        singleJobData.addAll(data);
        source = singleJobData["source"];

        if(source=="TV"){
          videoPath="${ApiData.tvVideoBaseUrl}${singleJobData["videoPath"]}";
        }
        else{
          videoPath="${ApiData.otherVideoBaseUrl}${singleJobData["videoPath"]}";
        }
        if (kDebugMode) {
          print("Single job result is----------$singleJobData");
        }
        isLoading.value = false;
        // alertJobsData= AlertJobsModel.fromJson(data);
        //  if (kDebugMode) {
        //    print("data add in model done");
        //  }
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error----------$e");
      }
      isLoading.value = false;
    }
  }

  // Future<void> playerConfig(String url, Map d) async {
  //   betterPlayerController = BetterPlayerController(
  //     BetterPlayerConfiguration(
  //       expandToFill: true,
  //       //aspectRatio:4/3,
  //       looping: false,
  //       autoDispose: true,
  //       autoPlay: true,
  //       //startAt: startAt,
  //       // eventListener: (BetterPlayerEvent e) => eveB(e),
  //       controlsConfiguration: const BetterPlayerControlsConfiguration(
  //         enableAudioTracks: false,
  //         enablePip: false,
  //         enableOverflowMenu: false,
  //         enablePlayPause: false,
  //         // enableProgressText: d.isEmpty || d == {} ? true : false,
  //         // enableProgressBar: d.isEmpty || d == {} ? true : false,
  //         enableProgressText: true,
  //         enableProgressBar: true,
  //         enableFullscreen: true,
  //         forwardSkipTimeInMilliseconds: 10000,
  //         backwardSkipTimeInMilliseconds: 10000,
  //         progressBarPlayedColor: Colors.orange,
  //         progressBarBufferedColor: Color(0xff676767),
  //         progressBarBackgroundColor: Color(0xff676767),
  //       ),
  //       fit: BoxFit.cover,
  //     ),
  //     betterPlayerDataSource: BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       videoPath,
  //     ),
  //   );
  //   betterPlayerController.videoPlayerController!.addListener(() {
  //     update();
  //   });
  //   update();
  // }

}
