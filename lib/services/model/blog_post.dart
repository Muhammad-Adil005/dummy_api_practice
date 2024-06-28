class BlogPost {
  final int id;
  final String title;
  final String author;
  final String datePublished;
  final String content;

  BlogPost({
    required this.id,
    required this.title,
    required this.author,
    required this.datePublished,
    required this.content,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      datePublished: json['date_published'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'date_published': datePublished,
      'content': content,
    };
  }
}
