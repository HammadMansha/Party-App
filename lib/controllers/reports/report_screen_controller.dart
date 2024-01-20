import 'dart:io';

import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:file_picker/file_picker.dart';

class ReportScreenController extends GetxController {
  TextEditingController reportTitle = TextEditingController();

  RxList<File> _selectedImages = <File>[].obs;
  RxList<File> _selectedVideos = <File>[].obs;

  List<File> get selectedImages => _selectedImages;
  List<File> get selectedVideos => _selectedVideos;

  late File image;
  final picker = ImagePicker();
  late File video;

  RxBool isShown = false.obs;
}

enum MediaSelection {
  images,
  videos,
}
