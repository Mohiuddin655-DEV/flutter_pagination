class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(dynamic json) {
    final int postId = json['postId'];
    final int id = json['id'];
    final String name = json['name'];
    final String email = json['email'];
    final String body = json['body'];
    return Comment(
      postId: postId,
      id: id,
      name: name,
      email: email,
      body: body,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['body'] = body;
    return map;
  }
}
