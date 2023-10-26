import 'package:Pam_App/classes/abstract_classes/keys_variables_abstract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../classes/abstract_classes/localstorage_abstract.dart';

class SettingScreenController extends GetxController
    with KeysVariables, InitializeLocalStorage {
  bool isShow = false;
  String email = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    email = await storage.read("email");
    print("email of user----------$email");
    // TODO: implement onReady
    super.onReady();
  }
}
