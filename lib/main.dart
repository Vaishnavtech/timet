import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timet/screen2.dart';

main() {
  runApp(const Myapp());
}

class box2 extends StatelessWidget {
  double x;
  double y;
  String boxText2;
  box2( this.boxText2,[this.y=100,this.x=100]);

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
          color: Colors.teal[200],
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          boxText2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 17, 255),
      ),
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  hdr2("1",40),
                  hdr2("2",40),
                  hdr2("3",40),
                  hdr2("4",40),
                  hdr2("5",40),
                  hdr2("6",40),
                ],
              ),
              Row(
                children: [
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                ],
              ),
              Row(
                children: [
                  box2("TP 1"),
                  box2("TP 2"),
                  box2("TP 3"),
                  box2("TP 4"),
                  box2("TP 5"),
                  box2("TP 6"),
                ],
              ),
              Row(
                children: [
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                ],
              ),
              Row(
                children: [
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                ],
              ),
              Row(
                children: [
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                  box2("TP"),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const screenone()),
                    );
                  },
                  child: Text('click')),
            ],
          ),
        ),
      ),
    );
  }
}


class hdr2 extends StatelessWidget {
  double x;
  double y;
  String boxText2;
  hdr2( this.boxText2,[this.y=100,this.x=100]);

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
          color: Color.fromARGB(255,100, 245, 201),
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

