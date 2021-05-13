import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:developer/screens/home.dart';
import 'package:flutter/material.dart';

class BookData extends StatelessWidget {
  static final String id = "book";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Payment History",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          child: Icon(
            Icons.arrow_back,
            size: 26.0,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("payment").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('No payment available');
          return new ListView(children: getUsers(snapshot));
        },
      ),
    );
  }

  getUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => ListTile(
              title: Text(
                doc["type"],
                style: TextStyle(fontSize: 19.0),
              ),
              subtitle: Text(
                doc["amount"],
                style: TextStyle(fontSize: 17.0),
              ),
            ))
        .toList();
  }
}
