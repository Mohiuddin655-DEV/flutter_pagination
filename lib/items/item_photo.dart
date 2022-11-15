import 'package:flutter/material.dart';
import 'package:flutter_pagination/model/photo.dart';

class ItemPhoto extends StatelessWidget {
  final Photo data;

  const ItemPhoto(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      borderOnForeground: true,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(data.url),
        ),
        title: Text(data.title),
        subtitle: Text(data.title),
      ),
    );
  }
}
