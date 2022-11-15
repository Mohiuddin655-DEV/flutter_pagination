import 'package:flutter/material.dart';
import 'package:flutter_pagination/model/album.dart';

class ItemAlbum extends StatelessWidget {
  final Album data;

  const ItemAlbum(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      borderOnForeground: true,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(data.id.toString()),
        ),
        title: Text(data.title),
      ),
    );
  }
}
