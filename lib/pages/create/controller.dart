
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_data_base/models/note.dart';

class CreateController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Note? oldNote;

  @override
  void onInit() {
    super.onInit();
    oldNote = Get.arguments as Note?;
    if (oldNote != null) {
      titleController.text = oldNote!.title;
      contentController.text = oldNote!.content;
    }
  }

  void onSubmit() {
    if (titleController.text.trim().isNotEmpty &&
        contentController.text.trim().isNotEmpty) {
      Get.back(
          result: Note(
              title: titleController.text,
              content: contentController.text,
              id: oldNote?.id));
    }
  }
}