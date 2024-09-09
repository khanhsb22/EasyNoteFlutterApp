import 'package:flutter/material.dart';
import 'package:untitled/hex_color.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  Color yellowColor = HexColor('FFE082');
  Color buttonColor = HexColor('2E3342');
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Note.',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ],
                ),
            ),
            SizedBox(height: 20,),
            Expanded(child: Container(
              color: yellowColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Your Title...', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                  SizedBox(height: 10,),
                  Container(color: Colors.black, width: double.infinity, height: 1,),
                  SizedBox(height: 15,),
                  Text('Write Content For Your Note...', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                ],),
              ),
            ), flex: 5,),
            Expanded(child: Container(color: Colors.white,), flex: 3,),
            Expanded(child: Row(
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
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.only(left: 22, top: 15, right: 15, bottom:15 ) //content padding inside button
                    )
                ),
              ],
            ), flex: 1),
          ],
        ),
      ),
    );
  }
}
