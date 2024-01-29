import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_data_base/pages/create/bindings.dart';
import 'package:local_data_base/pages/create/create.dart';
import 'package:local_data_base/pages/home/binding.dart';
import 'package:local_data_base/pages/home/home.dart';

import 'db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(
            name: "/",
            page: () => const HomePage(),
            binding: HomeBindings()),
        GetPage(
            name: "/create",
            page: () => const CreatePage(),
            binding: CreateBinding()),
      ],
    );
  }
}
