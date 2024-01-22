import 'package:flutter/material.dart';
import 'package:untitled/generate.dart';
import 'package:untitled/hex_color.dart';

import 'notify_item.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  Color blueTitle = HexColor('1F69AD');
  Color blueItem = HexColor('64A7E6');
  late List<NotifyItem> notifyList;

  @override
  void initState() {
    super.initState();
    notifyList = Generate().getNotifyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                    ),
                    Text(
                      'Notify',
                      style: TextStyle(
                          color: blueTitle,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/trash.png'),
                      iconSize: 40,
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: ScrollPhysics(parent: null),
                        itemCount: notifyList.length,
                        itemBuilder: (context, int index) {
                          var item = notifyList[index];
                          return _buildNotifyItemWidget(item, index);
                        }),
                  ],
                ),
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNotifyItemWidget(NotifyItem item, int index) {
    return Container(
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: blueItem,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 12, right: 15, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.notifyContent,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              ),
              Text(
                'Time: ${item.time}',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              )
            ],
          ),
        ));
  }
}
