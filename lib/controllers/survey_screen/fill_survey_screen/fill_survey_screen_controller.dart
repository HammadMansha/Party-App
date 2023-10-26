import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillSurveyFormController extends GetxController {
  List<String> questions = [
    "Can you please tell me your age?",
    "Gender",
    "What do you think in which direction is Pakistan currently heading?",
    "If there were parliamentary elections in Pakistan this week, which party would you vote for?",
    "Which political party’s candidate did you vote for in the last elections in 2018?",
    "Which political party’s candidate did you vote for in the last elections in 2018?"
  ];
  bool isShowDropdown=false;
  int clickIndex=0;
  int previousIndex=0;
  ScrollController scrollController = ScrollController();

  List<String> answers=["Less then 18 years","18 -24 Years","25 -29 Years","30 -34 Years","35 -39 Years","40 -44 Years"];
String? selectedValue;


}
