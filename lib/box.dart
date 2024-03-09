import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class box2 extends StatelessWidget {
  double x;
  double y;
  String boxText2 = "ui";
  int day;
  final moonLanding = DateTime.parse(DateTime.now().toString());
  Color? method(day) {
    if (moonLanding.weekday == day) {
      return Color.fromARGB(255, 128, 203, 153);
    } else {
      return Colors.teal[200];
    }
  }

  box2(this.boxText2, this.day, [this.y = 100, this.x = 100]);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: x,
          height: y,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: method(day),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            boxText2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
      back: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: x,
          height: y,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[200],
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            "ROOM",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
      direction: FlipDirection.VERTICAL,
    );
  }
}

class hdr2 extends StatelessWidget {
  double x;
  double y;
  String boxText2;
  hdr2(this.boxText2, [this.y = 100, this.x = 100]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: x,
        height: y,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 100, 245, 201),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          boxText2,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
      ),
    );
  }
}

class box3 extends StatelessWidget {
  double x;
  double y;

  String boxText2 = "ui";
  String room;
  int day;

  final moonLanding = DateTime.parse(DateTime.now().toString());
  Color? method(day) 
  {
    if (moonLanding.weekday == day + 1) {
      return Color.fromARGB(255, 128, 203, 153);
    } else {
      return Colors.teal[200];
    }
  }

  Color? method2(day) 
  {
    if (moonLanding.weekday == day + 1) {
      return Color.fromARGB(255, 78, 194, 117);
    } else {
      return Color.fromARGB(255, 87, 183, 171);
    }
  }

  box3(this.boxText2, this.day,this.room ,[this.y = 100, this.x = 100]);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: x,
          height: y,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: method(day),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            boxText2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
      back: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: x,
          height: y,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:  method2(day),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            room,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
      direction: FlipDirection.VERTICAL,
    );
  }
}
