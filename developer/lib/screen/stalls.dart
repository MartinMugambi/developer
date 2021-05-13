import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:developer/constants/constants.dart';
import 'package:developer/models/helper.dart';
import 'package:developer/models/option_model.dart';
import 'package:developer/models/posts.dart';
import 'package:developer/screens/date_time.dart';
import 'package:developer/screens/details.dart';
import 'package:developer/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Stall extends StatefulWidget {
  static final String id = "stall";
  @override
  _StallState createState() => _StallState();
}

class _StallState extends State<Stall> {
  int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Choose Your Stall",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            // Navigator.pushReplacementNamed(context, DetailScro.id);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedOption = index - 1;
                });
                print(_selectedOption);
              },
              child: Container(
                height: 320.0,
                decoration: BoxDecoration(
                  color: _selectedOption == index - 1
                      ? Theme.of(context).accentColor
                      : Color(0xFFE7EBEE),
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  elevation: 4.0,
                  color: Colors.white,
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
                                  ListTile(
                                    title: Text(
                                      options[index - 1].title,
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        color: _selectedOption == index - 1
                                            ? Theme.of(context).primaryColor
                                            : Color(0xFFB4C1C4),
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    subtitle: Text(
                                      options[index - 1].subtitle,
                                      style: TextStyle(
                                        fontSize: 23.0,
                                        color: _selectedOption == index - 1
                                            ? Theme.of(context).primaryColor
                                            : Color(0xFFB4C1C4),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.info_outline_rounded,
                                size: 35.0,
                                color: Color(0xFF00008b),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.av_timer,
                              size: 39.0,
                              color: Colors.green,
                            ),
                            Text('Offer Delivery and Transport',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito',
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.wrap_text_rounded,
                              size: 39.0,
                              color: Colors.green,
                            ),
                            Text('Offer Sorting and Wrapping',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito',
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150.0),
                          child: Row(
                            children: [
                              Text('Price for 1day',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Nunito',
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170.0),
                          child: Row(
                            children: [
                              Text(options[index - 1].pric,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                size: 20.0,
                                color: Color(0xFF00008b),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      bottomSheet: Container(
        width: double.infinity,
        height: 80.0,
        color: Color(0xFFF3F3F3),
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (_selectedOption == 1 || _selectedOption == 0) {
                    print('showing dialog....');
                    _showDialog();
                  } else {
                    Navigator.pushReplacementNamed(context, Calendar.id);
                  }
                },
                child: Text(
                  "Reserve",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Stall Already Booked"),
          content: Text('Select another Stall'),
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
