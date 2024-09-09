import 'note.dart';
import 'notify_item.dart';

class Generate {
  List<Note> getNoteList() {
    List<Note> notes = <Note>[
      Note('21/7/2023', 'Some title 1', 'It was popularised in the 1960s with the release of '
          'Letraset sheets \n Lorem Ipsum passages, and more recently with desktop publishing', false),
      Note('21/7/2023', 'Some title 2', 'It was popularised in the 1960s with the release of '
          'Letraset sheets \n Lorem Ipsum passages, and more recently with desktop publishing', false),
      Note('21/7/2023', 'Some title 3', 'It was popularised in the 1960s with the release of '
          'Letraset sheets \n Lorem Ipsum passages, and more recently with desktop publishing', false),
      Note('21/7/2023', 'Some title 4', 'It was popularised in the 1960s with the release of '
          'Letraset sheets \n Lorem Ipsum passages, and more recently with desktop publishing', false),
    ];
    return notes;
  }

  List<NotifyItem> getNotifyList() {
    List<NotifyItem> notifyList = <NotifyItem>[
      NotifyItem('You added a note with title “Title 1”', '15 minutes ago'),
      NotifyItem('You added a note with title “Title 2”', '20 minutes ago'),
      NotifyItem('You deleted note “Title 2”', '22 minutes ago'),
      NotifyItem('You deleted note “Title 3”', '23 minutes ago'),
      NotifyItem('You deleted note “Title 4”', '24 minutes ago'),
      NotifyItem('You deleted note “Title 5”', '25 minutes ago'),
      NotifyItem('You edited a note with title “Title 2”', '26 minutes ago'),
      NotifyItem('You edited a note with title “Title 3”', '27 minutes ago'),
      NotifyItem('You edited a note with title “Title 5”', '28 minutes ago'),
      NotifyItem('You added a note with title “Title 5”', '29 minutes ago'),
      NotifyItem('You added a note with title “Title 6”', '30 minutes ago'),
      NotifyItem('You added a note with title “Title 7”', '31 minutes ago'),
      NotifyItem('You added a note with title “Title 8”', '32 minutes ago'),
      NotifyItem('You added a note with title “Title 9”', '33 minutes ago'),
      NotifyItem('You added a note with title “Title 10”', '34 minutes ago'),
    ];
    return notifyList;
  }
}