import 'package:final_project/screens/MessageContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  );

  sendMessage() {
    if (messageController.text.trim().isEmpty) return;
    print(messageController.text.trim());
    FirebaseFirestore.instance.collection("chat").add({
      "message": messageController.text.trim(),
      "date": DateTime.now(),
      "donorid": "1",
      "uid": "1"
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 67, 149, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("chat")
                    .orderBy("date", descending: true)
                    .snapshots(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return ListView.separated(
                      reverse: true,
                      itemBuilder: (ctx, i) {
                        final message =
                            MessageModel.fromDocument(snapshot.data!.docs[i]);
                        return Row(
                          mainAxisAlignment: message.uid == "1"
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [MessageContainer(message: message)],
                        );
                      },
                      separatorBuilder: (ctx, i) => SizedBox(
                            height: 10,
                          ),
                      itemCount: snapshot.data!.docs.length);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    style: TextStyle(height: 0.5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Message',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(165, 160, 160, 1)),
                      fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: sendMessage,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 67, 149, 1),
                    radius: 30,
                    child: Transform.rotate(
                      angle: 12,
                      child: Icon(Icons.send, color: Colors.white,),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessageModel {
  final String id;
  final String message;
  final String donorid;
  final DateTime date;
  final String uid;

  MessageModel(
      {required this.id,
      required this.date,
      required this.donorid,
      required this.message,
      required this.uid});

  factory MessageModel.fromDocument(DocumentSnapshot doc) => MessageModel(
      id: doc.id,
      date: doc["date"].toDate(),
      donorid: doc["donorid"],
      message: doc["message"],
      uid: doc["uid"]);
}
