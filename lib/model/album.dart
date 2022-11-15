class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(dynamic json) {
    final int userId = json['userId'];
    final int id = json['id'];
    final String title = json['title'];
    return Album(
      userId: userId,
      id: id,
      title: title,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
