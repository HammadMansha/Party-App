import 'dart:async';
import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController with InitializeLocalStorage {
  TextEditingController searchbar = TextEditingController();
  String token = '';
  RxList alertJobs = [].obs;
  RxBool isLoading = false.obs;
  String date = '';
  String day = '';
  List sharedDataValue = [];
  late StreamSubscription sseSubscription;
  //AlertJobsModel ?alertJobsData;
  @override
  void onInit() async {
    token = await storage.read("accessToken");
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    await getAllAlertJobs().then((value) => getAlertStream());

    // TODO: implement onReady
    super.onReady();
  }

  //--------------------Get realtime alert stream--------------
  Future<void> getAlertStream() async {
    const url = '${ApiData.baseUrl}${ApiData.alertStream}';
    if (kDebugMode) {
      print("Stream API call----------------");
    }
    sseSubscription=SSEClient.subscribeToSSE(url: url, header: {
      "Cookie":
          'jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QiLCJpYXQiOjE2NDMyMTAyMzEsImV4cCI6MTY0MzgxNTAzMX0.U0aCAM2fKE1OVnGFbgAU_UVBvNwOMMquvPY8QaLD138; Path=/; Expires=Wed, 02 Feb 2022 15:17:11 GMT; HttpOnly; SameSite=Strict',
      "Accept": "text/event-stream",
      "Cache-Control": "no-cache",
    }).listen((event) {
      if (kDebugMode) {
        print('Id:   ${event.id!}');
        print('Event:  ${event.event!}');
        print('Data:  ${event.data!}');
      }
      // Parse the event data into a Map
      if (event.data != "") {
        Map<String, dynamic> eventDataMap = json.decode(event.data!);
        if (eventDataMap.containsKey("job")) {
          sharedDataValue.add(eventDataMap["job"]);
          if (kDebugMode) {
            print("shared data value-----------$sharedDataValue");
          }
          alertJobs.insert(0, sharedDataValue[0]);
        } else {
          if (kDebugMode) {
            print("shared data value else-----------$sharedDataValue");
          }
        }
      }
    });
  }

  //------------------Get all alert jobs--------------------
  Future<void> getAllAlertJobs() async {
    try {
      if (kDebugMode) {
        print("Alert API call----------------");
      }

      isLoading.value = true;
      update();
      const url = '${ApiData.baseUrl}${ApiData.alertJobs}';
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
        alertJobs.addAll(data["results"]);
        if (kDebugMode) {
          print("alert job result is----------$alertJobs");
        }
        isLoading.value = false;

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
}
