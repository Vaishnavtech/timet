import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timet/screen2.dart';
import 'package:timet/box.dart';

import 'package:timet/csv.dart';



main()
{
  runApp(const Myapp());
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
  
   home({super.key});
final bulkInsta = bulkUploadState();
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
                  hdr2("1", 40),
                  hdr2("2", 40),
                  hdr2("3", 40),
                  hdr2("4", 40),
                  hdr2("5", 40),
                  hdr2("6", 40),
                ],
              ),
              Row(
                children: [
                  box2("f", 1),
                  box2("f", 1),
                  box2("t", 1),
                  box2("TP", 1),
                  box2("TP", 1),
                  box2("TP", 1),
                ],
              ),
              Row(
                children: [
                  box2("TP 1", 2),
                  box2("TP 2", 2),
                  box2("TP 3", 2),
                  box2("TP 4", 2),
                  box2("TP 5", 2),
                  box2("TP 6", 2),
                ],
              ),
              Row(
                children: [
                  box2("TP", 3),
                  box2("TP", 3),
                  box2("TP", 3),
                  box2("TP", 3),
                  box2("TP", 3),
                  box2("TP", 3),
                ],
              ),
              Row(
                children: [
                  box2("TP", 4),
                  box2("TP", 4),
                  box2("TP", 4),
                  box2("TP", 4),
                  box2("TP", 4),
                  box2("TP", 4),
                ],
              ),
              Row(
                children: [
                  box2("TP", 5),
                  box2("TP", 5),
                  box2("TP", 5),
                  box2("TP", 5),
                  box2("TP", 5),
                  box2("TP", 5),
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
              ElevatedButton(
                child: const Text("Upload FIle"),
                onPressed: () {
                  bulkInsta.pickFile();
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
