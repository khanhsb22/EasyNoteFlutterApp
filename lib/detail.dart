import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/note.dart';

import 'hex_color.dart';
import 'home_controller.dart';

class Detail extends StatefulWidget {
  String jsonNote;

  Detail(this.jsonNote, {super.key});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final HomeController homeController = Get.find();
  Color buttonColor = HexColor('2E3342');
  Color contentColor = HexColor('536393');
  Color blueColor = HexColor('C0FAD7');
  bool isCheckFav = false;

  late Map<String, dynamic> noteMap;
  late Note item;

  @override
  void initState() {
    super.initState();

    if (!isCheckFav) {
      noteMap = jsonDecode(widget.jsonNote) as Map<String, dynamic>;
      item = Note.fromJson(noteMap);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 16),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Detail of "${item.title}"',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              item.isFav = !item.isFav;
                              isCheckFav = true;
                            });
                          },
                          icon: item.isFav
                              ? Image.asset('images/favourite.png')
                              : Image.asset('images/favourite_empty.png'),
                          iconSize: 40,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('images/dots.png'),
                          iconSize: 40,
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(height: 20,),
            Expanded(
                flex: 5,
                child: Container(
                  color: contentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.date,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: blueColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: blueColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Text(item.content,
                                style: const TextStyle(fontSize: 13, color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(child: Container(color: Colors.white,), flex: 3,),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                        },
                        child: Row(
                          children: [
                            Text("SAVE",
                                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400)),
                            SizedBox(width: 15,),
                            Image.asset('images/check.png', width: 30, height: 30,)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: buttonColor,
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.only(left: 22, top: 15, right: 15, bottom:15 ) //content padding inside button
                        )
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        onPressed: () async {
                        },
                        child: Row(
                          children: [
                            Text("REMOVE NOTE",
                                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400)),
                            SizedBox(width: 15,),
                            Image.asset('images/delete.png', width: 30, height: 30,)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: buttonColor,
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.only(left: 22, top: 15, right: 15, bottom:15 ) //content padding inside button
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}


