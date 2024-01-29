
import 'package:get/get.dart';
import 'package:local_data_base/db/db_helper.dart';
import 'package:local_data_base/models/note.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  Database? db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Map<String, Object?>> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    notes = await db!.query("Notes");
    await Future.delayed(Duration(milliseconds: 1000));
    isLoading.value = false;
  }

  void createNote() async {
    var newnote = await Get.toNamed("/create");
    newnote = newnote as Note?;
    if (newnote != null) {
      await db!.insert("Notes", newnote.toMap());
      getNotes();
    }
  }

  void removeNote(int id) async {
    //Dengan menggunakan tanda seru (!), Anda memberi tahu compiler bahwa Anda yakin objek tidak null
    //Dalam konteks ini, lebih baik menggunakan tanda tanya (?.). Operator ?. adalah cara yang lebih aman untuk memanggil metode atau mengakses properti pada objek yang mungkin null.
    await db!.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void editNote(int index) async {
    Note oldNote = Note.fromMap(map: notes[index]);
    var newNote = await Get.toNamed("/create", arguments: oldNote);
    newNote = newNote as Note?;
    if (newNote != null) {
      await db!.update("Notes", newNote.toMap(),
          where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }


}