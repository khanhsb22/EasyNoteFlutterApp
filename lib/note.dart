class Note {
  String date = "";
  String title = "";
  String content = "";
  bool isFav = false;

  Note(this.date, this.title, this.content, this.isFav);

  Note.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String,
        title = json['title'] as String,
        content = json['content'] as String,
        isFav = json['isFav'] as bool;

  Map<String, dynamic> toJson() => {
        'date': date,
        'title': title,
        'content': content,
        'isFav': isFav,
      };
}
