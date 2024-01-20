import 'note.dart';

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
}