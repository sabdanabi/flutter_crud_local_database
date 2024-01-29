
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../detail_note/detail_page.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createNote();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> note = controller.notes[index];
                return ListTile(
                    title: Text(note["title"] as String),
                    subtitle: Text(note['content'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, ),
                    onTap: () {
                      Get.to(DetailPage(), arguments: {
                        'title': note["title"],
                        'subtitle': note['content'],
                      });
                    },
                    trailing: PopupMenuButton(
                      itemBuilder: ((context) => [
                        PopupMenuItem(
                          child: Text("Edit"),
                          onTap: () => controller.editNote(index),
                        ),
                        PopupMenuItem(
                          child: Text("Delete"),
                          onTap: () =>
                              controller.removeNote(note['id'] as int),
                        ),
                      ]),
                    ));
              });
        }
      }),
    );
  }
}