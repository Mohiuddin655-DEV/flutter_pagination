import 'package:flutter/material.dart';
import 'package:flutter_pagination/model/comment.dart';

class ItemComment extends StatelessWidget {
  final Comment data;

  const ItemComment(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(data.id.toString()),
        ),
        title: Text(data.name),
        subtitle: Text(data.body),
      ),
    );
  }
}
