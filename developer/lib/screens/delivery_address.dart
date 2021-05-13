import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:developer/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Deliver extends StatefulWidget {
  static final String id = "Del";
  @override
  _DeliverState createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController textEditingController2 = new TextEditingController();
  static final _firestore = Firestore.instance;

  Future<void> upload() async {
    Firestore.instance.collection('address').add({
      "pickupAddress": textEditingController.text,
      "deliveryAddress": textEditingController2.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Add Delivery Address',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          child: Icon(
            Icons.arrow_back,
            size: 19.0,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("address").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 180.0, left: 80.0),
              child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _showDialog();
                  }),
            );
          } else {
            return new ListView(children: getUsers(snapshot));
          }
        },
      ),
    );
  }

  getUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => Column(
              children: [
                Container(
                  height: 200.0,
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Enter Pickup Address",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      doc["pickupAddress"],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Enter Delivery Address",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      doc["deliveryAddress"],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))
        .toList();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Enter Delivery Address"),
          content: Column(
            children: [
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Enter PickUp Address'),
              ),
              TextField(
                controller: textEditingController2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Enter Delivery Address'),
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Cancel"),
                  onPressed: () {},
                ),
                new FlatButton(
                    onPressed: () {
                      upload();
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"))
              ],
            ),
          ],
        );
      },
    );
  }
}
