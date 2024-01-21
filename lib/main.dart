import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/add_new.dart';
import 'package:untitled/detail.dart';
import 'package:untitled/hex_color.dart';
import 'package:untitled/home.dart';
import 'package:window_size/window_size.dart';

import 'home_controller.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(() => HomeController());

  if (Platform.isWindows || Platform.isMacOS) {
    setWindowTitle("Easy Note App");
    setWindowMinSize(const Size(750, 800));
    setWindowMaxSize(Size.infinite);

    if (args.firstOrNull == 'multi_window') {
      final argument = args[2].isEmpty
          ? const {}
          : jsonDecode(args[2]) as Map<String, dynamic>;

      if (argument['args1'] == 'Add new note') {
        runApp(const MaterialApp(debugShowCheckedModeBanner: false,
            title: 'Add new note',
            home: AddNew())
        );
      }
      if (argument['args1'] == 'Detail note') {
        String jsonNote = argument['jsonNote'];
        runApp(MaterialApp(debugShowCheckedModeBanner: false,
            title: 'Detail note',
            home: Detail(jsonNote))
        );
      }
    } else {
      runApp(const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyApp",
        home: MyStateFulWidget(),
      ));
    }
  }

}

class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({Key? key}) : super(key: key);

  @override
  _MyStateFulWidgetState createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  @override
  void initState() {
    super.initState();
  }

  Color newNoteColor = HexColor('CC3399');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 16, right: 25, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/notification.png'),
                  iconSize: 40,
                ),
                const Text('EASY NOTE APP', style: TextStyle(fontSize: 20),),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/dots.png'),
                  iconSize: 40,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('images/post_it.png', width: 120, height: 120,),
                SizedBox(height: 20,),
                const Text('Add Note To Begin !', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),)
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("NEW NOTE",
                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400)),
                style: ElevatedButton.styleFrom(
                    primary: newNoteColor,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.only(left: 25, top: 20, right: 25, bottom:20 ) //content padding inside button
                    ))
          ],
        ),
      ),
    );
  }
}























