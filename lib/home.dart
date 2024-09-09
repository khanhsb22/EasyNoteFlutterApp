
import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/home_controller.dart';
import 'package:untitled/notify.dart';
import 'generate.dart';
import 'hex_color.dart';
import 'note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final HomeController homeController = Get.find();

  Color favouriteColor = HexColor('F013AD');
  List<Note> notes = Generate().getNoteList();
  Color buttonColor = HexColor('2E3342');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => homeController.index == 0.obs ? Padding(
        padding: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 16),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30,
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Notify()));
                        },
                        icon: Image.asset('images/notification.png'),
                        iconSize: 40,
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('images/trash.png'),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: const Text(
                          'Recent added',
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        onTap: () async {
                          setState(() {
                            homeController.updateIndexForRecentTab(0.obs);
                          });
                        },
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(child: Text('Favourite', style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: favouriteColor),),
                        onTap: () async {
                          setState(() {
                            homeController.updateIndexForFavTab(1.obs);
                          });
                        },
                      ),
                      SizedBox(width: 25,),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('images/dots.png'),
                        iconSize: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(height: 50,),
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(parent: null),
                                  itemCount: notes.length,
                                  itemBuilder: (context, int index) {
                                    var noteItem = notes[index];
                                    return _noteItemRecent(noteItem, index);
                                  }
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 30,),
                  Expanded(flex: 3, child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/post_it.png', width: 150, height: 150,),
                        SizedBox(height: 17,),
                        Text('Try Out Some Ideas Through Notes :)', style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ))
                ],
              ),
            ),
            // SizedBox(height: 50,),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                          onPressed: () async {
                            final window =
                              await DesktopMultiWindow.createWindow(jsonEncode({
                                'args1': 'Add new note',
                                'args2': 100,
                                'args3': false,
                                'business': 'business_test',
                              }));
                            window
                              ..setFrame(const Offset(0, 0) & const Size(950, 700))
                              ..center()
                              ..setTitle('Add new note')
                              // ..resizable(false)
                              ..show();
                          },
                          child: Row(
                            children: [
                              Text("NEW NOTE",
                                  style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400)),
                              Image.asset('images/add.png', width: 40, height: 40,)
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.only(left: 22, top: 15, right: 22, bottom:15 ) //content padding inside button
                          )),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/idea.png'),
                      iconSize: 40,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ) : Padding(
        padding: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 16),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30,
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Notify()));
                        },
                        icon: Image.asset('images/notification.png'),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () async {
                            homeController.updateIndexForRecentTab(0.obs);
                            setState(() {
                              homeController.updateIndexForRecentTab(0.obs);
                            });
                          },
                          child: const Text(
                            'Recent added',
                            style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                          )),
                      SizedBox(width: 20,),
                      GestureDetector(
                          onTap: () async {
                            setState(() {
                              homeController.updateIndexForFavTab(1.obs);
                            });
                          },
                          child: Text(
                            'Favourite',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: favouriteColor),
                          )),
                      SizedBox(width: 25,),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('images/dots.png'),
                        iconSize: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(flex: 3, child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/note.png', width: 150, height: 150,),
                        SizedBox(height: 17,),
                        Text('Save Important Notes\nTo Favorites', style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )),
                  SizedBox(width: 30,),
                  Expanded(
                      flex: 7,
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(parent: null),
                                  itemCount: notes.length,
                                  itemBuilder: (context, int index) {
                                    var noteItem = notes[index];
                                    return _noteItemFav(noteItem, index);
                                  }
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/idea.png'),
                      iconSize: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: ElevatedButton(
                              onPressed: () async {
                                final window =
                                await DesktopMultiWindow.createWindow(jsonEncode({
                                  'args1': 'Add new note',
                                  'args2': 100,
                                  'args3': false,
                                  'business': 'business_test',
                                }));
                                window
                                  ..setFrame(const Offset(0, 0) & const Size(950, 700))
                                  ..center()
                                  ..setTitle('Add new note')
                                // ..resizable(false)
                                  ..show();
                              },
                              child: Row(
                                children: [
                                  Text("NEW NOTE",
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400)),
                                  Image.asset('images/add.png', width: 40, height: 40,)
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: buttonColor,
                                  shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.only(left: 22, top: 15, right: 22, bottom:15 ) //content padding inside button
                              )),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('images/trash.png'),
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ))
    );
  }

  Widget _noteItemRecent(Note item, int index) {
    Color blue2 = HexColor('536393');
    Color blue = HexColor('C0FAD7');
    Color brown = HexColor('9FA165');
    String jsonNote = jsonEncode(item);
    if (index % 2 == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10),
        child: GestureDetector(
          onTap: () async {
            final window =
                await DesktopMultiWindow.createWindow(jsonEncode({
                  'args1': 'Detail note',
                  'args2': 100,
                  'args3': false,
                  'business': 'business_test',
                  'jsonNote': jsonNote,
                })); // args[2] = 'Detail note'
            window
              ..setFrame(const Offset(0, 0) & const Size(950, 700))
              ..center()
              ..setTitle('Detail note')
              ..show();
          },
          child: Container(
            decoration: BoxDecoration(
                color: brown,
                borderRadius: const BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${item.date}', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),),
                      Text('${item.title}', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text('${item.content}',
                            style: TextStyle(fontSize: 13, color: Colors.white)),
                      ),
                      Expanded(
                          flex: 0,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    item.isFav = !item.isFav;
                                  });
                                },
                                icon: item.isFav
                                    ? Image.asset('images/favourite.png')
                                    : Image.asset('images/favourite_empty.png'),
                                iconSize: 40,
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10),
      child: GestureDetector(
        onTap: () async{
          final window =
          await DesktopMultiWindow.createWindow(jsonEncode({
            'args1': 'Detail note',
            'args2': 100,
            'args3': false,
            'business': 'business_test',
            'jsonNote': jsonNote,
          }));
          window
            ..setFrame(const Offset(0, 0) & const Size(950, 700))
            ..center()
            ..setTitle('Detail note')
            ..show();
        },
        child: Container(
          decoration: BoxDecoration(
              color: blue2,
              borderRadius: const BorderRadius.all(Radius.circular(5))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.date}', style: TextStyle(fontSize: 13, color: blue, fontWeight: FontWeight.w500),),
                    Text('${item.title}', style: TextStyle(fontSize: 13, color: blue, fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text('${item.content}',
                          style: TextStyle(fontSize: 13, color: Colors.white)),
                    ),
                    Expanded(
                        flex: 0,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  item.isFav = !item.isFav;
                                });
                              },
                              icon: item.isFav
                                  ? Image.asset('images/favourite.png')
                                  : Image.asset('images/favourite_empty.png'),
                              iconSize: 40,
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _noteItemFav(Note item, int index) {
    Color yellow = HexColor('FFE082');
    String jsonNote = jsonEncode(item);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10),
      child: GestureDetector(
        onTap: () async {
          final window =
          await DesktopMultiWindow.createWindow(jsonEncode({
            'args1': 'Detail note',
            'args2': 100,
            'args3': false,
            'business': 'business_test',
            'jsonNote': jsonNote,
          })); // args[2] = 'Detail note'
          window
            ..setFrame(const Offset(0, 0) & const Size(950, 700))
            ..center()
            ..setTitle('Detail note')
            ..show();
        },
        child: Container(
          decoration: BoxDecoration(
              color: yellow,
              borderRadius: const BorderRadius.all(Radius.circular(5))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.date}', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),),
                    Text('${item.title}', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text('${item.content}',
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
                    Expanded(
                        flex: 0,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  item.isFav = !item.isFav;
                                });
                              },
                              icon: item.isFav
                                  ? Image.asset('images/favourite.png')
                                  : Image.asset('images/favourite_empty.png'),
                              iconSize: 40,
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}















