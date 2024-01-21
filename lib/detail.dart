import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class Detail extends StatefulWidget {
  String jsonNote;

  Detail(this.jsonNote, {super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Detail page'),
            Text(widget.jsonNote)
          ],
        ),
      ),
    );
  }
}
