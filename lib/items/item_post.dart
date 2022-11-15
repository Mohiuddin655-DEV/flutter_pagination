import 'package:flutter/material.dart';
import 'package:flutter_pagination/model/post.dart';

class ItemPost extends StatelessWidget {
  final Post data;

  const ItemPost(this.data, {Key? key}) : super(key: key);

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
        subtitle: Text(data.body),
      ),
    );
  }
}
