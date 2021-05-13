import 'package:developer/screens/home.dart';
import 'package:developer/screens/payment.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  static final String id = 'calendar';
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  void dispalyBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (ctx) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0)),
              ),
              height: MediaQuery.of(context).size.height * 0.90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Order  Details',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ksh 500',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Jumia Warehouse',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Stall 3',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'PickUp Address',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Kasarani',
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nairobi',
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "23 March 2021",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 340.0,
                        height: 45.0,
                        child: FlatButton(
                            onPressed: () {
                              _payment();
                            },
                            color: Colors.black,
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Process Payment',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar in Flutter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarController: _controller,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.teal,
                  selectedColor: Colors.black,
                  todayStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20)),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toIso8601String());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     children: <Widget>[
            //       Text(
            //         'Select a time window for your Delivery',
            //         style: TextStyle(
            //           fontSize: 17.0,
            //           fontWeight: FontWeight.bold,
            //           letterSpacing: 2.0,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20.0,
            //       ),
            //       Container(
            //         width: 340.0,
            //         height: 45.0,
            //         child: OutlineButton(
            //           onPressed: () {
            //             dispalyBottomSheet(context);
            //           },
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(5.0),
            //           ),
            //           borderSide: BorderSide(color: Colors.black),
            //           child: Text(
            //             'Select time',
            //             style: TextStyle(fontSize: 17.0),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          dispalyBottomSheet(context);
        },
        child: Container(
          width: double.infinity,
          height: 80.0,
          color: Color(0xFFF3F3F3),
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'SAVE & CONTINUE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Nunito',
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
      ),
    );
  }

  _payment() async {
    await InAppPayments.setSquareApplicationId('sq0idp-mi3zkvIM_Qe-0z-QvjpPLA');
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails result) {
          try {
            result.nonce;
            print('Sucess');
            InAppPayments.completeCardEntry(
                onCardEntryComplete: () =>
                    Navigator.pushNamed(context, BookData.id));
          } catch (ex) {
            InAppPayments.showCardNonceProcessingError(ex.toString());
          }
        },
        onCardEntryCancel: () {});
    //ExpandingBottomSheet.of(context).close();
  }
}
