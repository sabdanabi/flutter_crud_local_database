class Note {
  int? id;
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
    this.id
  });

  Note.fromMap({required map})
      : id = map['id'],
        title = map['title'] ?? "",
        content = map['content'] ?? "";

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}