import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = Get.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
          child: Text(data['subtitle'])),
    );
  }
}
