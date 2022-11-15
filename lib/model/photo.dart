class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    final int albumId = json['albumId'];
    final int id = json['id'];
    final String title = json['title'];
    final String url = json['url'];
    final String thumbnailUrl = json['thumbnailUrl'];
    return Photo(
      albumId: albumId,
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }
}
