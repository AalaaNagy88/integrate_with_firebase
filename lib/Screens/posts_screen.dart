import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integratewithfirebase/Wedgits/post_body.dart';
import 'package:integratewithfirebase/models/post_model.dart';
import 'package:intl/intl.dart';

Widget posts(context) {
  TextEditingController _bodyController = TextEditingController();
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)
      ,child: Card(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.perm_identity),
                  ),
                  title: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(hintText: "What's on your mind?"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("What's on your mind?"),
                              content: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: _bodyController,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      final PostModel post = PostModel(
                                          time: DateFormat('dd MMM  h:mm a')
                                              .format(DateTime.now())
                                              .toString(),
                                          body: _bodyController.text);
                                      insertData(post.toMap());
                                      Navigator.pop(context);
                                    },
                                    child: Text("Post"))
                              ],
                            );
                          });
                    },
                  ),
                ),
              ),
            ),
          ),),
       StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("Posts").snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> querySnapshot) {
              if (querySnapshot.hasError) {
                print("error");
              }
              if (querySnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(backgroundColor: Colors.white,);
              } else {
                final list = querySnapshot.data.documents;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: ListView.builder(
                      itemCount: list.length,
                        itemBuilder: (context, i) {
                      return PostBody(time: list[i]["time"], t: list[i]["body"]);
                    }),
                  ),
                );
              }
            }),
    ],
  );
}

Future<void> insertData(final post) async {
  Firestore firestore = Firestore.instance;
  firestore.collection("Posts").add(post).then((DocumentReference d) {
    print(d.toString());
  }).catchError((e) {
    print(e);
  });
}
