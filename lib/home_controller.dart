import 'package:get/get.dart';

import 'generate.dart';
import 'note.dart';

class HomeController extends GetxController {
  var index = 0.obs;
  var reload = false.obs;
  List<Note> notes = Generate().getNoteList().obs;

  updateIndexForRecentTab(RxInt indexValue) {
    index = indexValue;
  }

  updateIndexForFavTab(RxInt indexValue) {
    index = indexValue;
  }
}