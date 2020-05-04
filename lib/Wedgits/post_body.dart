import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostBody extends StatefulWidget {
  String t, time;
  PostBody({this.time, this.t});
  @override
  _PostBodyState createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  bool loved = false;
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
        child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.perm_identity),
            ),
            title: Text("Alaa"),
            subtitle: Text(widget.time),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(widget.t),
          ),
          Divider(),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                onPressed: () {
                  setState(() {
                    loved = !loved;
                  });
                },
                icon: Icon(
                  loved ? Icons.favorite : Icons.favorite_border,
                  color: loved ? Colors.red : Colors.grey,
                ),
                label: Text(
                  "Like",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                icon: Icon(
                  Icons.mode_comment,
                  color: Colors.grey,
                ),
                label: Text(
                  "Comment",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              FlatButton.icon(
                  onPressed: () {},
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  icon:  Icon(
                    Icons.share,
                    color: Colors.grey,
                  ) ,
                  label:Text(
                    "Share",
                    style: TextStyle(color: Colors.grey),
                  ) ,
                 ),
            ],
          ),
        ],
      ),
    ));
  }
}
