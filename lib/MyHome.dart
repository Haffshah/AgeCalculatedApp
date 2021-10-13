
import 'package:expansionpanel/Expansiontile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double age = 0.0;
  var selectedYear;

  void _showPicker() {
    showDatePicker(
            context: context,
            firstDate: new DateTime(1900),
            initialDate: new DateTime.now(),
            lastDate: new DateTime.now())
        .then((dt) {
      setState(() {
        selectedYear = dt!.year;
        calculateAge();
      });
    });
  }

  void calculateAge() {
    setState(() {
      age = (2021 - selectedYear).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xff8CA1A5),
        appBar: new AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ExpansionTileDemo()));
              },
              icon: Icon(Icons.more_horiz),
            ),
          ],
          backgroundColor: Color(0xff316B83),
          title: new Text("Age Calculator"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffD1E8E4),
                    elevation: 20.0,
                    shadowColor: Color(0xffD1E8E4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.elliptical(200, 50),
                        right: Radius.elliptical(200, 50),
                      ),
                    ),
                    padding: EdgeInsetsDirectional.all(20.0),
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.1)),
                child: new Text(
                  selectedYear != null
                      ? selectedYear.toString()
                      : "Select Your Birthday",
                  style: TextStyle(color: Color(0xff316B83), fontSize: 16),
                ),
                onPressed: _showPicker,
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              new Text("You are $age Years old",
                  style: new TextStyle(
                    fontSize: 24.0,
                    color: Color(0xffD1E8E4),
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),);
  }
}
